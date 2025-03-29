module stopwatch(
    input clk, reset,
    output[7:0] illuminate,
    output[7:0] seven_segment 
);
    wire[5:0] seconds, minutes;
    counter counter_module(
        .clk(clk),
        .reset(reset),
        .seconds(seconds),
        .minutes(minutes)
    );

    wire[3:0] units_seconds, tens_seconds;
    hexa_to_bcd_converter hexa_to_bcd_converter_module_seconds(
        .hexa(seconds),
        .clk(clk),
        .reset(reset),
        .units_place(units_seconds),
        .tens_place(tens_seconds)
    );

    wire[3:0] units_minutes, tens_minutes;
    hexa_to_bcd_converter hexa_to_bcd_converter_module_minutes(
        .hexa(seconds),
        .clk(clk),
        .reset(reset),
        .units_place(units_minutes),
        .tens_place(tens_minutes)
    );

    illuminator illuminator_module(
        .clk(clk),
        .reset(reset),
        .units_seconds(units_seconds),
        .tens_seconds(tens_seconds),
        .units_minutes(units_minutes),
        .tens_minutes(tens_minutes),
        .illuminate(illuminate),
        .segment(seven_segment)
    );

endmodule
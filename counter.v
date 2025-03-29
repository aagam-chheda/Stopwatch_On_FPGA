module counter(
    input clk, reset,
    output reg[5:0] seconds,
    output reg[5:0] minutes
);
    reg[26:0] temp;
    always@(posedge clk or posedge reset)
        begin
            if(reset) temp<=27'd0;
            else
                begin
                    if(temp==27'd99_999_999) temp<=27'd0;
                    else temp<=temp+1;
                end
        end

    always@(posedge clk or posedge reset)
        begin
            if(reset) seconds<=6'd0;
            else
                begin
                    if(temp==27'd99_999_999)
                        begin
                            if(seconds==6'd59) seconds<=6'd0;
                            else seconds<=seconds+1;
                        end
                    else seconds<=seconds;
                end
        end
    
    always@(posedge clk or posedge reset)
        begin
            if(reset) minutes<=6'd0;
            else
                begin
                    if(temp==27'd99_999_999)
                        begin
                            if(seconds==6'd59)
                                begin
                                    if(minutes==6'd59) minutes<=6'd0;
                                    else minutes<=minutes+1;
                                end
                            else minutes<=minutes;
                        end
                    else minutes<=minutes;
                end
        end
endmodule
`timescale 1ns / 1ps

module wnmux(
    input [4:0] wn1,
    input  jal,
    
    output reg[4:0] wnfinal
    );
    
    always @(*) begin
        if (jal == 1'b1) begin
            wnfinal = 5'd31;
            end
        else if (jal == 1'b0) begin
            wnfinal = wn1;
            end
            end
endmodule
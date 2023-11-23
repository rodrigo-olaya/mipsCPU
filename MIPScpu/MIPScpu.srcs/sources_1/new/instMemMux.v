`timescale 1ns / 1ps

module instMemMux(
    input [4:0] rd,
    input [4:0] rt,
    input regrt,
    
    output reg [4:0] wn1
    );
    
    always @(*) begin
        if(regrt == 1)
            wn1 = rt;
        else if (regrt == 0)
            wn1 = rd;
        end 
endmodule


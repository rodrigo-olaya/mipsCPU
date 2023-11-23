`timescale 1ns / 1ps

module regfilemux(qa, sa, shift, regfilemuxOut);
    input [31:0] qa;    
    input [4:0] sa;    
    input shift;
    output reg [31:0] regfilemuxOut;
    
    always @(*) begin
        if (shift ==0)
            regfilemuxOut <= qa;
        else if (shift == 1)
            regfilemuxOut <= 32'b00 | sa;
    end 
    endmodule

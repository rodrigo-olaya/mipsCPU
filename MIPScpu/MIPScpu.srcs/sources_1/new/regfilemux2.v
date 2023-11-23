`timescale 1ns / 1ps

module regfilemux2(
    input [31:0] qb,
    input [31:0] immExtOut,
    input aluimm,
    
    output reg [31:0] regfilemux2Out
    );
    always @(*) begin
     if (aluimm == 1'b0) 
        regfilemux2Out = qb;
     else if (aluimm == 1'b1)
        regfilemux2Out = immExtOut;
     end
endmodule

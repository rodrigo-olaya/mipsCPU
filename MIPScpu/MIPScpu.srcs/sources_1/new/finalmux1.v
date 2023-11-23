`timescale 1ns / 1ps

module finalmux(
    input [31:0] aluOut,
    input [31:0] dataOut,
    input m2reg,
    
    output reg [31:0] finalmuxOut
    );
    always @(*) begin
        if (m2reg == 0)
            finalmuxOut = aluOut;
        else if (m2reg == 1)
            finalmuxOut = dataOut;
        end
endmodule

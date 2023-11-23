`timescale 1ns / 1ps

module jalmux(
    input [31:0] pcmuxOut,
    input [31:0] finalmuxOut,
    input jal,
    
    output reg [31:0] d
    );
    always @(*) begin
        if (jal == 1'b0) begin 
            d = finalmuxOut;
            end
        else if (jal == 1'b1) begin
            d = pcmuxOut;
            end
        end
endmodule


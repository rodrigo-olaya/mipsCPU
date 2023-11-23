`timescale 1ns / 1ps

module pc (
    input [31:0] pcmuxOut,
    input clk,
    output reg [31:0] pcout
    );
    initial begin
        pcout = 32'h00000000;
        end
    always @(posedge clk)
        pcout = pcmuxOut;
endmodule

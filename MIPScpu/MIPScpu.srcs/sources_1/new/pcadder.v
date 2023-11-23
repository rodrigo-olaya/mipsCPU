`timescale 1ns / 1ps

module pcadder(
    input [31:0] pcout,
    output reg [31:0] pcadderOut
    );
    
    always @(*)
    begin
        pcadderOut = pcout + 32'h00000004;
    end
endmodule

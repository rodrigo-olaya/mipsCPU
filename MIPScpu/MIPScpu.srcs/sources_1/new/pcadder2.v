`timescale 1ns / 1ps

module pcadder2(
    input [31:0] pcadderOut, 
    input [31:0] slliOut, 
    
    output reg [31:0] pcadder2Out
    );
    
    always @(*)begin
        pcadder2Out = pcadderOut + slliOut;
        end
    endmodule

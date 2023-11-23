`timescale 1ns / 1ps

module pcmux(
    input [31:0] pcadderOut, 
    input [31:0] pcadder2Out,
    input [31:0] qa,
    input [31:0] jumpin,
    input [1:0] pcsrc,    // MUX SELECTOR
    output reg [31:0] pcmuxOut
    );
    always @(*)
        begin
            if (pcsrc == 2'b00)
                pcmuxOut = pcadderOut;
            else if (pcsrc == 2'b01)
                pcmuxOut = pcadder2Out;
            else if (pcsrc == 2'b10)
                pcmuxOut = qa;
            else if (pcsrc == 2'b11)
                pcmuxOut = jumpin;
        end 
endmodule

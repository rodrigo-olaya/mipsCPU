`timescale 1ns / 1ps

module slli(
    input [31:0] immExtOut,
    
    output reg [31:0] slliOut
    );
    
    always @(*) begin
        slliOut = immExtOut << 2;
    end

endmodule

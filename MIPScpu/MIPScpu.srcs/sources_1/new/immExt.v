`timescale 1ns / 1ps

module immExt(
    input [15:0] imm,
    input sext,
    
    output reg [31:0] immExtOut
    );
    
    always @(*) begin
        if (sext == 1) begin    //sign extend
            if (imm[15] ==1) begin  // first bit is 1
                immExtOut = {16'hffff, imm};
                end
            else if (imm[15] == 0) begin
                immExtOut = {16'h0000, imm};
                end
                end
        else if (sext == 0) begin   //zero extend
            //immExtOut = imm | 32'b0;
            immExtOut = {16'h0000, imm};
            end
    end
endmodule

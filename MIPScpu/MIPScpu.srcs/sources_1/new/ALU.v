`timescale 1ns / 1ps

module ALU(regfilemuxOut, regfilemux2Out, aluc, z, aluOut);
    input [31:0] regfilemuxOut;  //rs or shift amount
    input [31:0] regfilemux2Out; //rt or imm
    input [3:0] aluc;
    output reg z;
    output reg [31:0] aluOut;
    
    always @(*) begin  
            if (aluc == 4'b0000) // add 
                aluOut = regfilemuxOut + regfilemux2Out;
            if (aluc == 4'b0100) begin // sub
                aluOut = regfilemuxOut - regfilemux2Out;
                if (aluOut == 32'b00000000) begin
                    z <= 1'b1;
                    end
                else if (aluOut != 32'b00000000) begin
                    z <= 1'b0;
                    end
                    end
            if (aluc == 4'b0001) // and
                aluOut = regfilemuxOut & regfilemux2Out;
             if (aluc == 4'b0101) // or
                aluOut = regfilemuxOut | regfilemux2Out;
             if (aluc == 4'b0011) //sll
                aluOut = regfilemux2Out << regfilemuxOut; 
             if (aluc == 4'b0110) //lui
                aluOut = regfilemux2Out << 16;
             if (aluc == 4'b0010) //xor
                aluOut = regfilemuxOut ^ regfilemux2Out;
             if (aluc == 4'b0111) //srl
                aluOut = regfilemux2Out >> regfilemuxOut;
             if (aluc == 4'b1111) //sra
                aluOut = regfilemux2Out >>> regfilemuxOut;
             if (aluc == 4'b1010) //ALU
                aluOut = 32'b0;
    end
endmodule

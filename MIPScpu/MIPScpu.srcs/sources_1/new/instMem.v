`timescale 1ns / 1ps

module instMem(
    input[31:0] pcout,
    output reg [31:0] instrOut
    ); 
    reg [31:0] instr[0:255];
    initial begin
            instr[0] = 32'h3c010000; // (00) main: lui $1, 0
            instr[4] = 32'h34240050; // (04) ori $4, $1, 80
            instr[8] = 32'h20050004; // (08) addi $5, $0, 4
            instr[12] = 32'h0c000018; // (0c) call: jal sum
            instr[16] = 32'hac820000; // (10) sw $2, 0($4)
            instr[20] = 32'h8c890000; // (14) lw $9, 0($4)
            instr[24] = 32'h01244022; // (18) sub $8, $9, $4
            instr[28] = 32'h20050003; // (1c) addi $5, $0, 3
            instr[32] = 32'h20a5ffff; // (20) loop2: addi $5, $5, -1
            instr[36] = 32'h34a8ffff; // (24) ori $8, $5, 0xffff
            instr[40] = 32'h39085555; // (28) xori $8, $8, 0x5555
            instr[44] = 32'h2009ffff; // (2c) addi $9, $0, -1
            instr[48] = 32'h312affff; // (30) andi $10,$9, 0xffff
            instr[52] = 32'h01493025; // (34) or $6, $10, $9
            instr[56] = 32'h01494026; // (38) xor $8, $10, $9
            instr[60] = 32'h01463824; // (3c) and $7, $10, $6
            instr[64] = 32'h10a00001; // (40) beq $5, $0, shift
            instr[68] = 32'h08000008; // (44) j loop2
            instr[72] = 32'h2005ffff; // (48) shift: addi $5, $0, -1
            instr[76] = 32'h000543c0; // (4c) sll $8, $5, 15
            instr[80] = 32'h00084400; // (50) sll $8, $8, 16
            instr[84] = 32'h00084403; // (54) sra $8, $8, 16
            instr[88] = 32'h000843c2; // (58) srl $8, $8, 15
            instr[92] = 32'h08000017; // (5c) finish: j finish
            instr[96] = 32'h00004020; // (60) sum: add $8, $0, $0
            instr[100] = 32'h8c890000; // (64) loop: lw $9, 0($4)
            instr[104] = 32'h20840004; // (68) addi $4, $4, 4
            instr[108] = 32'h01094020; // (6c) add $8, $8, $9
            instr[112] = 32'h20a5ffff; // (70) addi $5, $5, -1
            instr[116] = 32'h14a0fffb; // (74) bne $5, $0, loop
            instr[120] = 32'h00081000; // (78) sll $2, $8, 0
            instr[124] = 32'h03e00008; // (7c) jr $31
        end
    always @(*) begin
        instrOut = instr[pcout];
        end
endmodule

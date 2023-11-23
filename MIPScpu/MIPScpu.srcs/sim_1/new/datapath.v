`timescale 1ns / 1ps

module datapath(
    input clk,
    input clrn,
    output wire [31:0] pcout,
    output wire [31:0] instrOut,
    output wire [31:0] aluOut,
    output wire[31:0] dataOut
    );
    
    wire [31:0] pcmuxOut;
    wire [1:0] pcsrc;
    //wire [31:0] aluOut;
    wire [31:0] finalmuxOut;
    wire [31:0] d;
    wire [31:0] pcadderOut;    //wire[31:0] dataOut;
    wire z;
    //wire [3:0] aluc;
    wire [31:0] regfilemuxOut;
    wire [31:0] regfilemux2Out;
    wire shift;
    wire [31:0] qa;
    wire [31:0] qb;
    wire wreg;
    wire [31:0] immExtOut;
    wire aluimm;
    wire wmem;
    
    pc sub(pcmuxOut, clk, pcout);
    
    pcadder sub1(pcout, pcadderOut);
    
    instMem sub2(pcout, instrOut);
    
    wire [5:0] op = instrOut[31:26];
    wire [4:0] rs = instrOut[25:21];
    wire [4:0] rt = instrOut[20:16];
    wire [4:0] rd = instrOut[15:11];
    wire [4:0] sa = instrOut[10:6];
    wire [5:0] func = instrOut[5:0];
    wire [15:0] imm = instrOut[15:0];   
    wire [25:0] addr = instrOut[25:0];
    
    wire shift;
    wire regrt;
    wire [4:0] wn1;
    wire jal;
    wire m2reg;
    wire sext;
    
    controlUnit sub3(op, func, z, pcsrc, aluc, shift, wreg, regrt, aluimm, jal, m2reg, sext, wmem);
    
    instMemMux sub8(rd,rt, regrt, wn1);
    
    regfile sub4(rs,rt,finalmuxOut,wnfinal,wreg,clk,clrn,qa,qb);    //changed wn1 to wnfinal
    
    wire [31:0] pcadder2Out; 
    wire [31:0] slliOut;
    
    slli sub14(immExtOut, slliOut);
    
    pcadder2 sub13(pcadderOut, slliOut, pcadder2Out);
    
    wire [31:0] jumpin = {pcadderOut[31:28], addrext[27:0]};
    wire [31:0] qa1 = qa;
    pcmux sub5(pcadderOut, pcadder2Out, qa1, jumpin, pcsrc, pcmuxOut);
    
    immExt sub10(imm, sext, immExtOut);
    
    regfilemux sub6(qa, sa, shift, regfilemuxOut);
    
    regfilemux2 sub9(qb, immExtOut, aluimm, regfilemux2Out);
    
    ALU sub7(regfilemuxOut, regfilemux2Out, aluc, z, aluOut);

    wire datawe;
    wire [31:0] datain = qb;
    
    dataMem sub12(clk,dataOut,datain,aluOut,wmem);
    
    finalmux sub11(aluOut, dataOut, m2reg, finalmuxOut);
    
    wire [27:0] addrext;
    slljump sub15(addr, addrext);
    
    wire [4:0] wnfinal;
    jalmux sub16(pcadderOut, finalmuxOut,jal, d);
    wnmux sub17(wn1, jal, wnfinal);
endmodule

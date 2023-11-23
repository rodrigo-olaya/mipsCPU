`timescale 1ns / 1ps

module controlUnit(op, func,z, pcsrc, aluc, shift, wreg, regrt, aluimm, jal, m2reg, sext, wmem);
    input [5:0] op;
    input [5:0] func;
    input z;
    output reg [1:0] pcsrc; 
    output reg [3:0] aluc;
    output reg shift;
    output reg wreg;
    output reg regrt;
    output reg [1:0] aluimm;
    output reg jal;
    output reg m2reg;
    output reg sext;
    output reg wmem;
    
    always @(*) begin
   
        
        if (op == 6'b000000 && func == 6'b100000) begin //add
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b0;
            sext = 0; //acutal is x
            aluc = 4'b0000;
            wmem = 0;
            pcsrc = 2'b00;
            end 
        else if (op == 6'b000000 && func == 6'b100010) begin // sub
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b0;
            sext = 0; //acutal is x
            aluc = 4'b0100;
            wmem = 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b000000 && func == 6'b100100) begin // and
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b0;
            sext = 0; //acutal is x
            aluc = 4'b0001;
            wmem = 0;
            pcsrc = 2'b00;
            end
         else if (op == 6'b001100) begin // andi
            wreg = 1;
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 0; //acutal is x
            aluc = 4'b0001;
            wmem = 0;
            pcsrc = 2'b00;
            end
            
        else if (op == 6'b000000 && func == 6'b100101) begin // or
            wreg <= 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b0;
            sext = 1; //acutal is x
            aluc = 4'b0101;
            wmem <= 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b000000 && func == 6'b000000) begin//sll
            wreg <= 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 1;
            aluimm = 1'b0;
            sext = 1; //acutal is x
            aluc = 4'b0011;
            wmem <= 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b001101) begin //ori
            wreg <= 1;
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 0; //acutal is x
            aluc = 4'b0101;
            wmem <= 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b001000) begin //addi
            wreg <= 1;
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 1; //acutal is x
            aluc = 4'b0000;
            wmem <= 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b001111) begin //lui 
            wreg <= 1;
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 0; //acutal is x
            aluc = 4'b0110;
            wmem <= 0;
            pcsrc = 2'b00;
            end
        else if (op == 6'b101011) begin //sw
            wreg = 0;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 1; //acutal is x
            aluc = 4'b0000;
            wmem <= 1;
            pcsrc = 2'b00;
            end 
        else if (op == 6'b100011) begin //lw
            wreg <= 1;
            regrt = 1;
            jal = 0;
            m2reg = 1;
            shift <= 0;
            aluimm = 1'b1;
            sext = 1; //acutal is x
            aluc = 4'b0000;
            wmem <= 0;
            pcsrc = 2'b00;
            end 
         else if (op == 6'b000000 && func == 6'b100110) begin //xor 
            wreg <= 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b0;
            sext = 1; //acutal is x
            aluc = 4'b0010;
            wmem <= 0;
            pcsrc = 2'b00;
            end 
       else if (op == 6'b001110) begin //xori 
            wreg <= 1;
            regrt = 1;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 1; //acutal is x
            aluc = 4'b0010;
            wmem <= 0;
            pcsrc = 2'b00;
            end 
        else if (op == 6'b000010) begin //j
            wreg = 0;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 0;
            aluimm = 1'b1;
            sext = 1; //acutal is x
            aluc = 4'b0000;
            wmem <= 0;
            pcsrc = 2'b11;
            end
        else if (op == 6'b000100) begin //beq
            aluc = 4'b0100;
            if (z == 0) begin
                pcsrc = 2'b00;
                wreg = 0;
                shift <= 0;
                aluimm = 1'b0;
                sext = 1; //acutal is x
                wmem <= 0;
                end
            else if (z == 1) begin   //the branch is taken
                pcsrc = 2'b01;
                wreg = 0;
                shift <= 0;
                aluimm = 1'b0;
                sext = 1; //acutal is x
                wmem <= 0;
                end
            end
        else if (op == 6'b000101) begin //bne
            aluc = 4'b0100;
            if (z == 0) begin
                pcsrc = 2'b01;
                wreg = 0;
                shift <= 0;
                aluimm = 1'b0;
                sext = 1; //acutal is x
                wmem <= 0;
                end
            else if (z == 1) begin   
                pcsrc = 2'b00;
                wreg = 0;
                shift <= 0;
                aluimm = 1'b0;
                sext = 1; //acutal is x
                wmem <= 0;
                end
           end
        else if (op == 6'b000011) begin //jal
            wreg = 1'b1;
            jal = 1'b1;
            wmem = 1'b0;
            pcsrc = 2'b11;
            aluc = 4'b1010;
            end
        else if (op == 6'b000000 && func == 6'b001000) begin //jr
            wreg = 1'b0;
            wmem = 1'b0;
            pcsrc = 2'b10;
            end
        else if (op == 6'b000000 && func == 000011) begin //sra
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 1;
            aluimm = 1'b0;
            sext = 0; //acutal is x
            aluc = 4'b1111;
            wmem <= 0;
            pcsrc = 2'b00;
            end 
        else if (op == 6'b000000 && func == 000010) begin //srl
            wreg = 1;
            regrt = 0;
            jal = 0;
            m2reg = 0;
            shift <= 1;
            aluimm = 1'b0;
            sext = 0; //acutal is x
            aluc = 4'b0111;
            wmem <= 0;
            pcsrc = 2'b00;
            end 
       end
endmodule     

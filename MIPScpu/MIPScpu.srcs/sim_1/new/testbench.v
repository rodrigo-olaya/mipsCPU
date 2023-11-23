`timescale 1ns / 1ps

module testbench();

    reg clk_tb;
    reg clrn_tb;
    
    wire [31:0] pcout1;
    wire [31:0] instOut1;
    wire [31:0] aluOut1;
    wire[31:0] dataOut1;

    initial 
        begin
        clk_tb = 1'b0;
        clrn_tb = 1'b1; 
        #500 clrn_tb = 1'b0;  
        end
    always
        begin
            #10  
            clk_tb = ~clk_tb;
        end
    datapath tst(clk_tb, clrn_tb, pcout1, instOut1, aluOut1, dataOut1);
    
endmodule


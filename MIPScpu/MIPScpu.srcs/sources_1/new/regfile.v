`timescale 1ns / 1ps

module regfile (rna,rnb,d,wn,we,clk,clrn,qa,qb); // 32x32 regfile
    input [31:0] d; // data of write port
    input [4:0] rna; // reg # of read port A
    input [4:0] rnb; // reg # of read port B
    input [4:0] wn; // reg # of write port
    input we; // write enable
    input clk, clrn; // clock and reset
    output [31:0] qa, qb; // read ports A and B
    reg [31:0] register [1:31]; // 31 32-bit registers
    assign qa = (rna == 0)? 0 : register[rna]; // read port A
    assign qb = (rnb == 0)? 0 : register[rnb]; // read port B
    integer i;
    initial 
    begin
        register[0] = 32'h00000000; //00000000; 
        register[1] = 32'h00000000; //A00000AA;
        register[2] = 32'h00000000;//10000011;
        register[3] = 32'h00000000; //20000022;
        register[4] = 32'h00000000; //30000033;
        register[5] = 32'h00000000; //40000044;
        register[6] = 32'h00000000; //50000055;
        register[7] = 32'h00000000; //60000066;
        register[8] = 32'h00000000; //70000077;
        register[9] = 32'h00000000; //80000088;
        register[10] = 32'h00000000; //90000099;
        register[31] = 32'h00000000;
    end
    always @(posedge clk or negedge clrn) // write port
        if (!clrn)
        for (i = 1; i < 32; i = i + 1)
            register[i] <= 0; // reset
        else
            if ((wn != 0) && we) // not reg[0] & enabled
                register[wn] <= d; // write d to reg[wn]
    endmodule

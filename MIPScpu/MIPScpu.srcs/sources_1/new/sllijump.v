module slljump(
    input [25:0] addr,
    
    output reg [27:0] addrext
    );
    
    always @(*) begin
        addrext = addr << 2;
        end
    endmodule

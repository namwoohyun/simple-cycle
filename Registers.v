module Registers(rs,rt,rd,Writedata,RegWrite,RegDst,Readdata1,Readdata2,clk);
   input [4:0] rs,rt,rd;
   input [31:0] Writedata;
   input        RegWrite,RegDst,clk;
   output reg [31:0] Readdata1,Readdata2;
   reg [4:0]     W;
   reg [31:0]    registers[31:0];
   initial
     begin
        $readmemb("registers.txt",registers,0,31);
     end
   always @(*) W = (RegDst) ? rd : rt;
   always @(rs,rt)
     begin
        Readdata1 <= registers[rs];
        Readdata2 <= registers[rt];
     end
   always @(posedge clk)
     begin
        if(RegWrite) registers[W] <= Writedata;
     end
endmodule // Registers

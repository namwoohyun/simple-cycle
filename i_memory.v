`timescale 1ps/1ps
module imemory(iaddr,instruction,clk);
   reg [7:0]           iram[2**16 - 1 : 0];
   input [31:0]        iaddr;
   input               clk;
   
   output reg [31:0] instruction;
   initial
     begin
        $readmemb("i_memory.txt",iram,0,39);
     end
   
   always @(iaddr)
     begin
        instruction <= {iram[iaddr],iram[iaddr+1],iram[iaddr+2],iram[iaddr+3]};
     end
endmodule // i_memory

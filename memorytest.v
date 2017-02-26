`timescale 1ns/1ns
`include "i_memory.v"
module memorytest;
   reg [31:0] iaddr;
   reg        clk;
   wire [31:0] instruction;
   always #50 clk = ~clk;
   imemory imemory(.iaddr(iaddr),.instruction(instruction),.clk(clk));
   initial
     begin
        clk = 0;
        #50
          iaddr = 8'h00000000;
        #100
          iaddr = 8'h00000001;
        #100 $finish;
     end
   initial
     begin
        $dumpfile("memorytest.vcd");
        $dumpvars(0,memorytest);
     end
endmodule // memorytest

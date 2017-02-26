`timescale 1ns/1ns
`include "pc.v"
`include "i_memory.v"
module pctest;
   reg [31:0] new_pc,branchtarget;
   reg        clk,Zero,Branch;
   wire [31:0] PC,instruction;
   pc pc(.Zero(Zero),.PC(PC),.new_pc(new_pc),.branchtarget(branchtarget),.clk(clk),.Branch(Branch));
   imemory imemory(.iaddr(PC),.instruction(instruction),.clk(clk));
   always #50 clk = ~clk;
   
   initial
     begin
        clk = 0;
        #50
        new_pc = 0;
        Zero = 0;
        Branch = 0;
        branchtarget = 8'h00001101;
        #1000
        Zero = 1;
        Branch = 1;
        branchtarget = 8'h00001111;
        #100
          Zero = 0;
        
        #1000 $finish;
     end // initial begin
   initial
     begin
        $dumpfile("pctest.vcd");
        $dumpvars(0,pctest);
     end
   
endmodule // pctest

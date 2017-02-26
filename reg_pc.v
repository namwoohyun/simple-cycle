module reg_pc(in,out,clk);
   input [31:0] in;
   input        clk;
   output [31:0] out;
   always @(posedge clk) out <= in;
endmodule // reg_pc

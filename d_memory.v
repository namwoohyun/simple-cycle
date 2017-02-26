module dmemory(daddr,din,dout,MemWrite,MemRead,clk);
   input [7:0] din,daddr;
   input        MemWrite,MemRead,clk;
   output reg [31:0] dout;
   reg [31:0]        dram[2**16-1:0];
   initial
     begin
        $readmemb("d_memory.txt",dram,0,7);
     end
   always @(daddr)
     begin
        if(MemRead)
          begin
             dout <= {dram[daddr],dram[daddr+1],dram[daddr+2],dram[daddr+3]};
          end
     end
   always @(clk)
     begin
        if(MemWrite)
          begin
             {dram[daddr],dram[daddr+1],dram[daddr+2],dram[daddr+3]} <= din;
          end
     end
endmodule // d_memory


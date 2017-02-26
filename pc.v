module pc(Zero,PC,new_pc,branchtarget,jumptarget,clk,Branch,Jump);
   input [31:0]           new_pc,branchtarget,jumptarget;
   input                  clk,Zero,Branch,Jump;
   reg                    state = 0;
   output reg [31:0]      PC;
   reg [31:0]             pc;
   always @(PC) pc = PC + 4;
   
   always @(posedge clk)
     begin
        case(state)
          0 :
            begin
               PC <= new_pc;
               state <= 1;
            end
          1 :
            begin
               PC <= (Jump) ? (jumptarget) : ((Branch && Zero) ? branchtarget : pc);
            end
          
        endcase // case (state)
     end
endmodule // pc

module alucontrol(ALUOp,Funct,Operation);
   input [1:0] ALUOp;
   input [5:0] Funct;
   output reg [3:0] Operation;
   wire [7:0]    y;
   
   assign y = {ALUOp,Funct};
   
   always @(*)
     casez (y)
       8'b00?????? : Operation = 4'b0010;
       8'b01?????? : Operation = 4'b0110;
       8'b10??0000 : Operation = 4'b0010;
       8'b1???0010 : Operation = 4'b0110;
       8'b10??0100 : Operation = 4'b0000;
       8'b10??0101 : Operation = 4'b0001;
       8'b1???1010 : Operation = 4'b0111;
     endcase // casez (y)
endmodule // alucontrol

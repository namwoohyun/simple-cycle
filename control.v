module control(opcode,RegDst,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,Jump);
   input [5:0]          opcode;
   output               RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump;
   output [1:0]         ALUOp;
   reg [9:0]            y;
   
   always @(*)
     casez (opcode)
       6'b000000 : y = 10'b1001000100;
       6'b100011 : y = 10'b0111100000;
       6'b101011 : y = 10'bx1x0010000;
       6'b000100 : y = 10'bx0x0001010;
       6'b000010 : y = 10'bxxxxxxxxx1;
       default : y = 10'b0000000000;
     endcase // casez (opcade)
   assign {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump} = y;
endmodule // control

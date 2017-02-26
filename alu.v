module alu(Operation,A,B,ALUOut,Zero);
   input [3:0] Operation;
   input [31:0] A,B;
   output reg [31:0] ALUOut;
   output        Zero;
   assign Zero = (ALUOut == 0);
   always @(Operation,A,B)
     begin
        case(Operation)
          4'b0000 : ALUOut <= A & B;
          4'b0001 : ALUOut <= A | B;
          4'b0010 : ALUOut <= A + B;
          4'b0110 : ALUOut <= A - B;
          4'b0111 : ALUOut <= A < B ? 1 : 0;
          4'b1100 : ALUOut <= ~(A | B);
          default : ALUOut <= 0;
        endcase // case (Operation)
     end // always @ (Operation,A,B)
endmodule // alu

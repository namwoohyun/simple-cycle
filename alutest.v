`timescale 1ns/1ns
`include "alucontrol.v"
`include "alu.v"

module alutest;
   reg [31:0] A,B;
   reg [5:0]  Funct;
   reg [1:0]  ALUOp;
   wire [31:0] ALUOut;
   wire        Zero;
   wire [3:0]   Operation;
   alu alu(.Operation(Operation),.A(A),.B(B),.ALUOut(ALUOut),.Zero(Zero));
   alucontrol alucontrol(.ALUOp(ALUOp),.Funct(Funct),.Operation(Operation));
   initial
     begin
        A = 10;
        B = 6;
        ALUOp = 2'b10;
        Funct = 6'b000000;
        #100
          A = 0;
        B = 1;
        ALUOp = 2'b10;
        Funct = 6'b000010;
        #100 $finish;
     end // initial begin
   initial
     begin
        $dumpfile("alutest.vcd");
        $dumpvars(0,alutest);
     end
endmodule // alutest

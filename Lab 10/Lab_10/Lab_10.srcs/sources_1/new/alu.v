//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
// Lab 10
// Engineer: Eric Santana
// ID: 015107467
 
module alu(srca, srcb, alucontrol, aluout, zero);
    input  [31:0] srca, srcb;
    input  [2:0]  alucontrol;
    output [31:0] aluout;
    output        zero;

    assign aluout = (alucontrol == 0) ? (srca & srcb) :      // AND
                    (alucontrol == 1) ? (srca | srcb) :      // OR
                    (alucontrol == 2) ? (srca + srcb) :      // ADD
                    (alucontrol == 6) ? (srca - srcb) :      // SUB
                    (alucontrol == 7) ? (srca < srcb) :      // SLT
                    32'hx;                                   // default

    assign zero = (aluout == 0);

endmodule

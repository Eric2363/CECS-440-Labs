`timescale 1ns / 1ps
//Name: Eric Santana
//ID: 015107467
//Lab : 9

module imem(
    input  [5:0]  a,
    output [31:0] rd
);

    reg [31:0] RAM[63:0];

    assign rd = RAM[a];

endmodule

`timescale 1ns / 1ps

//Name: Eric Santana
//ID: 015107467
//Lab: 8
//Class: CECS 440
//CSULB

module dmem(clk, we, a, wd, rd);
    input clk, we;
    input [31:0] a, wd;
    output [31:0] rd;

    reg [31:0] RAM[63:0];


    assign rd = RAM[a[7:2]];


    always @(posedge clk)
        if (we) RAM[a[7:2]] <= wd;

endmodule

//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
// Lab 10
// Engineer: Eric Santana
// ID: 015107467
    

module sl2(a, y);
    input  [31:0] a;
    output [31:0] y;

    // shift left by 2 (append two zeros)
    assign y = {a[29:0], 2'b00};

endmodule


//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
// Company: CSULB CECS 440
// Engineer: Eric Santana 


module se16(a, y);
    input  [15:0] a;
    output [31:0] y;

    assign y = (a[15]==1) ? {16'hFFFF, a} : {16'h0000, a};
endmodule
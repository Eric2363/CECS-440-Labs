`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Name: Eric Santana
//ID: 015107467
//Lab : 9




`timescale 1ns / 1ps
//Name: Eric Santana
//ID: 015107467
//Lab : 9

module mux2 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] d0,
    input  [WIDTH-1:0] d1,
    input  s,
    output [WIDTH-1:0] y
);

// Select line will choose either d0 or d1
assign y = s ? d1 : d0;

endmodule

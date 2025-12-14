`timescale 1ns / 1ps
//Class: CECS 440
//Lab: 5
//Name:  Eric Santana
//ID: 015107467


module alu # (parameter width = 8)
(
    input [width-1:0] a,b,
    input [2:0] aluop,
    output reg [width-1:0] y,
    output reg c, n, z, p
    );
    
always @ (a, b, aluop)
    begin
    {y,c,n,z,p} = 0;
    case(aluop)
        0: {c,y} = a +b;
        1:{c,y} = a + 1;
        2:y = a&b;
        3:y = a|b;
        4:y = a^b;
        5:y = ~a;
        6:{c,y} = a <<1;
        7:y = 0;
        default: y = 32'bz;
     endcase
     
     n = y[width-1];
     z = !y;
     p = ^y;
   end
        
endmodule

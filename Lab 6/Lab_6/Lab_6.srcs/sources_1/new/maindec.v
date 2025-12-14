`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eric Santana
// ID: 015107467
// Lab: 6
// Class: CECS 440

//////////////////////////////////////////////////////////////////////////////////


module maindec(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    input[5:0] op;
    output memtoreg, memwrite;
    output branch, alusrc;
    output regdst, regwrite;
    output jump;
    output [1:0] aluop;
    
    reg [8:0] controls;
    
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = controls;
    always @(op)
        case(op)
        6'b000_000: controls <= 9'b110_000_010;
        6'b100_011: controls <= 9'b101_001_000;
        6'b101_011: controls <= 9'b001_010_000;
        6'b000_100: controls <= 9'b000_100_001;
        6'b001_000: controls <= 9'b101_000_000;
        6'b000_010: controls <= 9'b000_000_100;
        default: controls <= 9'bxxx_xxx_xxx;
    endcase 
endmodule

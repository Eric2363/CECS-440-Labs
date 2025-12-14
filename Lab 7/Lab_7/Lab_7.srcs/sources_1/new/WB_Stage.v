//Name: Eric Santana
//ID: 015107467
//Lab: 7
//Class: CECS 440

`timescale 1ns / 1ps
`include "mux.v"

module WB_Stage(
    input        regwritem, memtoregw,
    input  [31:0] aluoutw, readdata,
    input  [4:0]  writeregm,
    output        regwritew,
    output [4:0]  writeregw,
    output [31:0] resultw
);

    // Pass-through control signals
    assign regwritew = regwritem;
    assign writeregw = writeregm;

    // Mux selects between ALU result and Read Data
    mux #(32) resmux (
        .d0(aluoutw),
        .d1(readdata),
        .s(memtoregw),
        .y(resultw)
    );

endmodule

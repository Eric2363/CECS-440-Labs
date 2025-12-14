`timescale 1ns / 1ps
//Name: Eric Santana
//ID: 015107467
//Lab : 9


module IF_Stage (
    input clk, pcsrc, reset,
    input [31:0] pcbranch,
    output [31:0] instr,
    output [31:0] pcplus4
);

    wire [31:0] pc, pcnext;
    assign pc[31:8] = 0;

    // Complete this
    register pcreg( clk, reset, pcnext, pc );

    adder32 pcadd(
        .a( {24'h0, pc[7:0]} ),
        .b( 32'h4 ),
        // Complete this
        .y( pcplus4 )
    );

    // Complete this
    mux2 #(32) pcbrmux( pcplus4, pcbranch, pcsrc, pcnext );

    // Complete this
    imem imem( pc[7:2], instr );

endmodule

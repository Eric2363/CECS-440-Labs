`timescale 1ns / 1ps
//Name: Eric Santana
//ID: 015107467
//Lab: 8
//Class: CECS 440
//CSULB

module MEM_Stage(
    input wire clk,
    input wire regwritee,
    input wire memtorege,
    input wire memwritem,
    input wire branchm,
    input wire zerom,
    input wire [31:0] aluoute,
    input wire [31:0] writedatam,
    input wire [4:0] writerege,
    output wire pcsrcm,
    input wire [31:0] pcbranche,
    output wire regwritem,
    output wire memtoregm,
    output wire [31:0] aluoutm,
    output wire [31:0] readdatam,
    output wire [4:0] writeregm,
    output wire [31:0] pcbranchm
);

    assign regwritem  = regwritee;
    assign memtoregm  = memtorege;

  
    assign pcsrcm     = branchm & zerom;

    assign aluoutm    = aluoute;
    assign writeregm  = writerege;

  
    assign pcbranchm  = pcbranche;

 
    dmem dmem(
        clk,
        memwritem,
        aluoute,
        writedatam,
        readdatam
    );

endmodule

//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
// Lab 10
// Engineer: Eric Santana
// ID: 015107467
 

module EX_Stage(
    regwriteD,
    memtoregD,
    memwriteD,
    branchD,
    alucontrolE,
    alusrcE,
    regdstE,
    srcaE,
    writedataD,
    rtE,
    rdE,
    signimmE,
    pcplus4E,

    regwriteE,
    memtoregE,
    memwriteE,
    branchE,
    zeroE,
    aluoutE,
    writedataE,
    writeregE,
    pcbranchE
    );

    input        regwriteD, memtoregD, memwriteD, branchD;
    input [2:0]  alucontrolE;
    input        alusrcE, regdstE;
    input [31:0] srcaE, writedataD, signimmE, pcplus4E;
    input [4:0]  rtE, rdE;

    output       regwriteE, memtoregE, memwriteE, branchE, zeroE;
    output [31:0] aluoutE, writedataE, pcbranchE;
    output [4:0]  writeregE;

    wire [31:0] srcbE, signimmshE;

    
    assign regwriteE = regwriteD;
    assign memtoregE = memtoregD;
    assign memwriteE = memwriteD;
    assign branchE   = branchD;
    assign writedataE = writedataD;

   
    alu alu(
        .srca(srcaE),
        .srcb(srcbE),
        .alucontrol(alucontrolE),
        .aluout(aluoutE),
        .zero(zeroE)
    );

    
    mux2 #(32) srcbmux(
        .d0(writedataD),
        .d1(signimmE),
        .s(alusrcE),
        .y(srcbE)
    );

   
    mux2 #(5) wrmux(
        .d0(rtE),
        .d1(rdE),
        .s(regdstE),
        .y(writeregE)
    );

   
    sl2 immsh(
        .a(signimmE),
        .y(signimmshE)
    );

   
    adder32 pcadd2(
        .a(pcplus4E),
        .b(signimmshE),
        .y(pcbranchE)
    );

endmodule


//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
// Company: CSULB CECS 440
// Engineer: Eric Santana 



`include "regfile.v"
`include "se16.v"
`include "controlUnit.v"

`define datasize 32
module ID_Stage(clk, instr, writeregw, resultw, regwritew, memtoregd, 
memwrited, branchd, alucontrold, alusrcd, regdstd, regwrited, rd1, rd2, 
signimme);

  input regwritew, clk;
  input [`datasize-1:0] instr, resultw;
  input [4:0] writeregw;
  output [2:0] alucontrold;
  output regwrited, memtoregd, memwrited, branchd, alusrcd, regdstd;
  output [`datasize-1:0] rd1, rd2, signimme;
  
  assign regwritew = regwrited;

 //Fill out
  controlUnit controlUnit(
    .op(instr[31:26]), 
    .funct(instr[5:0]), 
    .regwrited(regwrited), 
    .memtoregd(memtoregd), 
    .memwrited(memwrited), 
    .branchd(branchd), 
    .alucontrold(alucontrold), 
    .alusrcd(alusrcd), 
    .regdstd(regdstd));
  
  regfile rf(
    .clk(clk), 
    .wr_en(regwritew), 
    .rd_addr1(instr[25:21]), 
    .rd_addr2(instr[20:16]), 
    .wr_addr(writeregw), 
    .wr_data(resultw), 
    .rd_data1(rd1), 
    .rd_data2(rd2)); 
  
  se16 signExtend(
    .a(instr[15:0]), 
    .y(signimme));
  
endmodule
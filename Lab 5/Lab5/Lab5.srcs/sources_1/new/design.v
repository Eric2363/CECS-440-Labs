//Class: CECS 440
//Lab: 5
//Name:  Eric Santana
//ID: 015107467


`include "regfile.v"
`include "ALUout.v"
`include "alu.v"

`define datasize 32

module simple_datapath 
   (input [2:0] op_code,
    input clk, reset,
    input [4:0] rs, rt, rd,
    input wr_en,
    input [`datasize - 1:0] d_in,
    output [`datasize - 1:0] d_out,
    output c, n, z, p);
    
    wire [`datasize - 1:0] srca, srcb, aluout, aluout_y; // rfDataOut1, rfDataOut2
    
    regfile #(`datasize) rf 
       (.clk(clk),
        .wr_en(wr_en),
        .rd_addr1(rs),
        .rd_addr2(rt),
        .wr_addr(rd),
        .wr_data(d_in),
        .rd_data1(srca),
        .rd_data2(srcb)
        ); // fill in the port list 
        
    alu #(`datasize) a1 
       (.a(srca),
        .b(srcb),
        .aluop(op_code),
        .y(aluout_y),
        .c(c),
        .n(n),
        .z(z),
        .p(p)
         ); // fill in the port list
    ALUout #(`datasize) ALUout 
       (.clk(clk),
        .reset(reset),
        .load(1'b1),
        .d(aluout_y),
        .q(aluout)
           );
    assign d_out = aluout;
endmodule
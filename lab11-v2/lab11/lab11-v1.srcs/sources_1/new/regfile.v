
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
// Company: CSULB CECS 440
// Engineer: Eric Santana 



module regfile #(parameter width = 32)
   (input clk, 
    input wr_en, // write enable
    input [4:0] rd_addr1, rd_addr2, wr_addr, // rs, rt, rd
    input [width - 1:0] wr_data, // d_in = data in
    output [width - 1:0] rd_data1, rd_data2); // srca, srcb
    
reg [31:0] rf[31:0];
// three ported register file 
// read two ports combinationally
// write third port on rising edge of clk
// register 0 hardwired to 0 
// note: for pipelined processor, write third port
// on falling edge of clock (might need to get rid of it if simulation does not work)

always @(negedge clk)
    if (wr_en) rf[wr_addr] <= wr_data;
    
assign rd_data1 = (rd_addr1 != 5'd0) ? rf[rd_addr1][width-1:0]:{width{1'b0}};
assign rd_data2 = (rd_addr2 != 5'd0) ? rf[rd_addr2][width-1:0]:{width{1'b0}};

endmodule

//Class: CECS 440
//Lab: 5
//Name:  Eric Santana
//ID: 015107467


module regfile #(parameter width = 8)
   (input clk, 
    input wr_en, // write enable
    input [4:0] rd_addr1, rd_addr2, wr_addr, // rs, rt, rd
    input [width - 1:0] wr_data, // d_in = data in
    output [width - 1:0] rd_data1, rd_data2); // srca, srcb
    
reg [31:0] rf[31:0];


always @(negedge clk)
    if (wr_en) rf[wr_addr] <= wr_data;
    
assign rd_data1 = (rd_addr1 != 5'd0) ? rf[rd_addr1][width-1:0]:{width{1'b0}};
assign rd_data2 = (rd_addr2 != 5'd0) ? rf[rd_addr2][width-1:0]:{width{1'b0}};

endmodule

//Class: CECS 440
//Lab: 5
//Name:  Eric Santana
//ID: 015107467


module ALUout #(parameter width = 8)
   (input clk, reset, load,
    input [width - 1:0] d,
    output reg [width - 1:0] q);
    
    always @(posedge clk)
    begin
        if(reset) q <= {width{1'b0}};
        else if(load) q <= d;
    end
endmodule
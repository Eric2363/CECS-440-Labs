//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
// Company: CSULB CECS 440
// Engineer: Eric Santana 

`define datasize 32

module t_ID_Stage();
    reg clk, regwritew;
    reg [`datasize-1:0] instr, resultw;
    reg [4:0] writeregw;
    wire [2:0] alucontrold;
    wire regwrited, memtoregd, memwrited, branchd, alusrcd, regdstd;
    wire [`datasize-1:0] rd1, rd2, signimme;
    
    integer i,x;
    
    ID_Stage dut(clk, instr, writeregw, resultw, regwritew, memtoregd, memwrited, branchd, alucontrold, alusrcd, regdstd, regwrited, rd1, rd2, signimme);
  
    always #5 clk = ~clk;
  
    initial begin
        clk = 0;
        regwritew = 1'b1;
        resultw = 0;    // Initialize write data
        
        // Test case 0: add $5, $3, $4
        @(negedge clk)
        instr = 32'h00642820;
        writeregw = 5'h5;
        regwritew = 1;        // Enable write
        resultw = 32'h0000_0000;  // Some test data
        x = 0;
        @(posedge clk) #1 displayControls();
        
        // Test case 1: sub $8, $4, $5
        @(negedge clk)
        instr = 32'h00854022;
        writeregw = 5'h8;
        resultw = 32'h0000_0001;  // Some test data
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 2: slt $9, $4, $5
        @(negedge clk)
        instr = 32'h0085482A;
        writeregw = 5'h9;
        resultw = 32'h0000_0002;  // Some test data
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 3: beq $10, $4, 2
        @(negedge clk)
        instr = 32'h11440002;
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 4: lw $11, 4($0)
        @(negedge clk)
        instr = 32'h8C0B0004;
        regwritew = 1'b1;
        writeregw = 5'hB;
        resultw = 32'h0000_000a;  // Some test data
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 5: sw $12, 4($0)
        @(negedge clk)
        instr = 32'hAC0C0004;
        regwritew = 1'b0;
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 6: and $13, $4, $5
        @(negedge clk)
        instr = 32'h00856824;
        regwritew = 1'b1;
        writeregw = 5'hD;
        resultw = 32'h0000_0004;  // Some test data
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        // Test case 7: or $14, $4, $5
        @(negedge clk)
        instr = 32'h00857025;
        writeregw = 5'hE;
        resultw = 32'h0000_0006;  // Some test data
        x = x + 1;
        @(posedge clk) #1 displayControls();
        
        $finish;
        end
        
        task displayControls;
        begin
          $display("Control Signals for test case %0d: %b", x, {regwrited, memtoregd, memwrited, branchd, alucontrold, alusrcd, regdstd, regwrited});
        end
    endtask 
endmodule

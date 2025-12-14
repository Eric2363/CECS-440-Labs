//Name: Eric Santana
//ID: 015107467
//Lab: 7
//Class: CECS 440

`timescale 1ns/1ps
module t_WB_Stage();
    reg        regwritem, memtoregm;
    reg [31:0] aluoutw, readdata;
    reg [4:0]  writeregm;
    wire       regwritew;
    wire [4:0] writeregw;
    wire [31:0] resultw;
    integer i;

    // Instantiate the WB_Stage module
    WB_Stage dut (
        .regwritem(regwritem),
        .memtoregw(memtoregm),
        .aluoutw(aluoutw),
        .readdata(readdata),
        .writeregm(writeregm),
        .regwritew(regwritew),
        .writeregw(writeregw),
        .resultw(resultw)
    );

    // Generate random test cases
    initial begin
        for (i = 0; i < 5; i = i + 1) begin
            aluoutw   = $random;
            readdata  = $random;
            {writeregm, regwritem} = $random;
            memtoregm = i;
            #1 testcase();
        end
        #1 $finish;
    end

    // Task: verify outputs
    task testcase();
    begin
        $display("Test Case %d", i);
        $display("aluoutw = %h\treaddata = %h", aluoutw, readdata);
        $display("memtoregm = %h\tresultw = %h", memtoregm, resultw);

        if ((!memtoregm && resultw != aluoutw) || (memtoregm && resultw != readdata)) begin
            $display("TEST FAILED: resmux has malfunctioned");
            $finish;
        end

        $display("regwritem = %b\tregwritew = %b", regwritem, regwritew);
        $display("writeregm = %h\twriteregw = %h", writeregm, writeregw);

        if ((regwritem != regwritew) || (writeregm != writeregw)) begin
            $display("TEST FAILED: signal passing malfunctioned");
            $finish;
        end

        $display("");
    end
    endtask
endmodule

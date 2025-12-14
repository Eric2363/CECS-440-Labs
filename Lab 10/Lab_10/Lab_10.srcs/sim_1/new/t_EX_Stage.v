//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
// Lab 10
// Engineer: Eric Santana
// ID: 015107467
 
module t_EX_Stage;

    reg regwriteD, memtoregD, memwriteD, branchD, alusrcE, regdstE;
    reg [2:0] alucontrole;
    reg [31:0] srcaE, writedataD, signimmE, pcplus4E;
    reg [4:0] rtE, rdE;

    wire regwriteE, memtoregE, memwriteE, branchE, zeroE;
    wire [31:0] aluoutE, writedataE, pcbranchE;
    wire [4:0] writeregE;

    integer i;

    EX_Stage dut(
        regwriteD, memtoregD, memwriteD, branchD,
        alucontrole, alusrcE, regdstE, srcaE,
        writedataD, rtE, rdE, signimmE, pcplus4E,
        regwriteE, memtoregE, memwriteE, branchE,
        zeroE, aluoutE, writedataE, writeregE,
        pcbranchE
    );

    initial begin
        srcaE      = 32'h00001212;
        writedataD = 32'h00003434;
        signimmE   = 32'hffffffff;
        pcplus4E   = 32'h44444444;

        for (i = 0; i < 8; i = i + 1)
            testcase;

        #10 $finish;
    end

    task testcase;
    begin
        {regwriteD, memtoregD, memwriteD, branchD,
         alusrcE, regdstE} = $random;

        alucontrole = i;

        case (alucontrole)
            0: $display("ALU is performing AND");
            1: $display("ALU is performing OR");
            2: $display("ALU is performing ADD");
            6: $display("ALU is performing SUB");
            7: $display("ALU is performing SLT");
            default: $display("ALU Operation is invalid");
        endcase

        #1 $display("aluoutE = %h", aluoutE);

        if (zeroE != (!aluoutE))
            $display("zero flag is malfunctioning");

        // verify control signals propagate unchanged
        if (regwriteE != regwriteD ||
            memtoregE != memtoregD ||
            memwriteE != memwriteD ||
            branchE   != branchD   ||
            writedataE != writedataD)
        begin
            $display("Control signals did not pass correctly!");
            $finish;
        end

        // verify branch adder
        if (pcbranchE != ((signimmE[29:0] << 2) + pcplus4E))
        begin
            $display("Branch Adder is malfunctioning");
            $finish;
        end

        if (i == 3)
            i = 5;
    end
    endtask

endmodule

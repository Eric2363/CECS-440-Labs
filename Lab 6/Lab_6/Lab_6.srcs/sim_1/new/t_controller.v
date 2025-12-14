`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Eric Santana
// ID: 015107467
// Lab: 6
// Class: CECS 440
//////////////////////////////////////////////////////////////////////////////////

module t_controller();
    reg [5:0] op, funct;
    reg zero;
    wire memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump;
    wire [2:0] alucontrol;

    // Instantiate DUT
    controller dut (
        .op(op),
        .funct(funct),
        .zero(zero),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    );

    integer i;
    reg [5:0] funct_codes [0:4]; // 5 R-type funct values

    // Initialize funct codes
    initial begin
        funct_codes[0] = 6'b100000; // add
        funct_codes[1] = 6'b100010; // sub
        funct_codes[2] = 6'b100100; // and
        funct_codes[3] = 6'b100101; // or
        funct_codes[4] = 6'b101010; // slt
    end

    // Main test sequence
    initial begin
        $display("Testing R-Type instructions");
        op = 6'b000000; zero = 0;
        for (i = 0; i < 5; i = i + 1) begin
            funct = funct_codes[i];
            #1 showsignals();
        end

        funct = 6'bxxxxxx; // funct field doesn't matter for non-R-type
        op = 6'b100011; #1 $display("LW");   showsignals();
        op = 6'b101011; #1 $display("SW");   showsignals();
        op = 6'b000100;
        zero = 1; #1 $display("BEQ - branch taken"); showsignals();
        zero = 0; #1 $display("BEQ - branch NOT taken"); showsignals();
        op = 6'b001000; #1 $display("ADDI"); showsignals();
        op = 6'b000010; #1 $display("J");    showsignals();

        $display("END SIMULATION!");
        $finish;
    end

    // Task to display control signals
    task showsignals;
    begin
        $display("%b", {memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol});
    end
    endtask

endmodule

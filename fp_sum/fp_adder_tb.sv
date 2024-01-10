`timescale 1ns / 1ps

module fp_adder_tb;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;

    // Instantiate the unit under test (UUT)
    fp_adder UUT (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Initialize inputs
        a = 32'h3F800000; // 1.0 in IEEE754
        b = 32'h40000000; // 2.0 in IEEE754
        #10;

        a = 32'hC0000000; // -2.0 in IEEE754
        b = 32'h40000000; // 2.0 in IEEE754
        #10;

        a = 32'h40490FDB; // 3.1415927 in IEEE754
        b = 32'h40000000; // 2.0 in IEEE754
        #10;

        a = 32'hBF800000; // -1.0 in IEEE754
        b = 32'h3F800000; // 1.0 in IEEE754
        #10;

        a = 32'h3F800000; // 1.0 in IEEE754
        b = 32'h3F800000; // 1.0 in IEEE754
        #10;

        a = 32'h40E00000; // 7.0 in IEEE754
        b = 32'h40C00000; // 6.0 in IEEE754
        #10;

        a = 32'h41900000; // 17.0 in IEEE754
        b = 32'h40490FDB; // 16.0 in IEEE754
        #10;

        a = 32'hC2800000; // -20.0 in IEEE754
        b = 32'hC2600000; // -19.0 in IEEE754
        #10;

        // Finish the simulation
        $finish;
    end

    initial begin
        // Dump waveforms to a VCD file
        $dumpfile("fp_adder_tb.vcd");
        $dumpvars(0, fp_adder_tb);
    end
endmodule
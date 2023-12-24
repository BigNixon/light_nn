`timescale 1ns / 1ps

module testbench;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] p;

    // Instantiate the unit under test (UUT)
    floating_point_multiplier UUT (
        .a(a),
        .b(b),
        .p(p)
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

        // Finish the simulation
        $finish;
    end

    initial begin
        // Dump waveforms to a VCD file
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
    end
endmodule   
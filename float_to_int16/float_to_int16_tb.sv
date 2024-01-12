`timescale 1ns / 1ps

module tb_float_to_int16;
    reg [31:0] in;
    wire [15:0] out;

    float_to_int16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $monitor("At time %d, in = %f, out = %d", $time, $bitstoreal(in), out);

        // Test with a range of inputs
        in = 32'hc4800000; // -1024.0
        #10;
        in = 32'h00000000; // 0.0
        #10;
        in = 32'h3F800000; // 1.0
        #10;
        in = 32'h44800000; // 1024.0
        #10;
        in = 32'hC2C80000; // -100.0
        #10 $display("Input: -100.0, Output: %h", out);

        in = 32'h41200000; // 10.5
        #10 $display("Input: 10.5, Output: %h", out);

        in = 32'h40200000; // 2.5
        #10 $display("Input: 2.5, Output: %h", out);

        in = 32'h40B00000; // 5.5
        #10 $display("Input: 5.5, Output: %h", out);

        in = 32'h41A1999A; // 20.1
        #10 $display("Input: 20.1, Output: %h", out);

        in = 32'h43FA0000; // 500.5
        #10 $display("Input: 500.5, Output: %h", out);
    

        $finish;
    end
endmodule
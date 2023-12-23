`timescale 1ns/1ps

module multiplier_tb;

  reg clk;
  reg [31:0] data_in;
  wire [31:0] data_out;

  // Instantiate the multiplier module
  multiplier #(.wieght(-3)) u_multiplier (
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    data_in = 0;

    #10;
    // Generate random multiplications
    for (int i = 0; i < 10; i++) begin
      #10 data_in = $random;
    end
    #10
    $finish;
  end

endmodule
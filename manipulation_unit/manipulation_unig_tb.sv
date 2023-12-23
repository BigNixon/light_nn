`timescale 1ns/1ps

module manipulation_unit_tb;

  reg clk;
  reg reset;
  integer symbol_0, symbol_1, symbol_2, symbol_3; // Declare as integers
  reg [7:0] data_in;
  wire [7:0] r_out, g_out, b_out;
  integer ok;
  // Instantiate the manipulation_unit module
  manipulation_unit u_manipulation_unit (
    .clk(clk),
    .data_in(data_in),
    .symbol_0(symbol_0),
    .symbol_1(symbol_1),
    .symbol_2(symbol_2),
    .symbol_3(symbol_3),
    .r_out(r_out),
    .g_out(g_out),
    .b_out(b_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

    // Test sequence
    // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    data_in = 0;
    symbol_0 = 0;
    symbol_1 = 0;
    symbol_2 = 0;
    symbol_3 = 0;

    #10;
    reset = 0;
    #10;
    // Generate random inputs for symbols
    for (int i = 0; i < 128; i++) begin
      #10;
      data_in = $random;
      symbol_0 = $random % 256; // Constrain to 0-255
      symbol_1 = $random % 256; // Constrain to 0-255
      symbol_2 = $random % 256; // Constrain to 0-255
      symbol_3 = $random % 256; // Constrain to 0-255
    end
  end

endmodule
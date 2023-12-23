`timescale 1ns/1ps

module neuron_unit_tb;

  reg clk;
  reg reset;
  reg de_in;
  reg [55:0] line_0_in, line_1_in, line_2_in, line_3_in, line_4_in, line_5_in, line_6_in;
  reg [55:0] memory [0:6];
  integer symbol_0, symbol_1, symbol_2, symbol_3;

  // Instantiate the neuron_unit module
  neuron_unit u_neuron_unit (
    .clk(clk),
    .reset(reset),
    .de_in(de_in),
    .line_0_in(line_0_in),
    .line_1_in(line_1_in),
    .line_2_in(line_2_in),
    .line_3_in(line_3_in),
    .line_4_in(line_4_in),
    .line_5_in(line_5_in),
    .line_6_in(line_6_in),
    .symbol_0(symbol_0),
    .symbol_1(symbol_1),
    .symbol_2(symbol_2),
    .symbol_3(symbol_3)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    de_in = 0;
    line_0_in = 0;
    line_1_in = 0;
    line_2_in = 0;
    line_3_in = 0;
    line_4_in = 0;
    line_5_in = 0;
    line_6_in = 0;

    // Read pixel data from file into memory
    $readmemb("./luminance_plus.txt", memory);
    // Open VCD file
    $dumpfile("neuron_unit.vcd");
    $dumpvars(0, neuron_unit_tb);

    #10;
    reset = 0;
    #10;
    de_in = 1;
    // Assign memory to each line_i_in
    #10
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    #1000;
    
    $finish;
  end

endmodule
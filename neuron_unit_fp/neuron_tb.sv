`timescale 1ns/1ps

module neuron_unit_tb;

  reg clk;
  reg reset;
  reg de_in;
  reg [223:0] line_0_in, line_1_in, line_2_in, line_3_in, line_4_in, line_5_in, line_6_in;
  reg [55:0] memory [0:6];
  reg[31:0] symbol_0, symbol_1, symbol_2, symbol_3;

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
  integer mem00i, mem01i, mem02i, mem03i, mem04i, mem05i, mem06i;
  integer mem10i, mem11i, mem12i, mem13i, mem14i, mem15i, mem16i;
  integer mem20i, mem21i, mem22i, mem23i, mem24i, mem25i, mem26i;
  integer mem30i, mem31i, mem32i, mem33i, mem34i, mem35i, mem36i;
  integer mem40i, mem41i, mem42i, mem43i, mem44i, mem45i, mem46i;
  integer mem50i, mem51i, mem52i, mem53i, mem54i, mem55i, mem56i;
  integer mem60i, mem61i, mem62i, mem63i, mem64i, mem65i, mem66i;

  reg[31:0] mem00r, mem01r, mem02r, mem03r, mem04r, mem05r, mem06r;

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
    mem00i = memory[0][55:48];
    mem01i = memory[0][47:40];
    mem02i = memory[0][39:32];
    mem03i = memory[0][31:24];
    mem04i = memory[0][23:16];
    mem05i = memory[0][15:8];
    mem06i = memory[0][7:0];

    mem00r = $bitstoshortreal(mem00i);
    mem01r = $bitstoshortreal(mem01i);
    mem02r = $bitstoshortreal(mem02i);
    mem03r = $bitstoshortreal(mem03i);
    mem04r = $bitstoshortreal(mem04i);
    mem05r = $bitstoshortreal(mem05i);
    mem06r = $bitstoshortreal(mem06i);

    line_0_in = {mem00r, mem01r, mem02r, mem03r, mem04r, mem05r, mem06r};
    #1000;
    
    $finish;
  end

endmodule
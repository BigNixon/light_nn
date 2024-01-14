`timescale 1ns/1ps

module neuron_unit_tb;

  reg clk;
  reg reset;
  reg de_in;
  reg [223:0] line_0_in, line_1_in, line_2_in, line_3_in, line_4_in, line_5_in, line_6_in;
  reg [55:0] memory [0:6];
  wire[31:0] symbol_0, symbol_1, symbol_2, symbol_3;

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

  real real_mem00i, real_mem01i, real_mem02i, real_mem03i, real_mem04i, real_mem05i, real_mem06i;
  real real_mem10i, real_mem11i, real_mem12i, real_mem13i, real_mem14i, real_mem15i, real_mem16i;
  real real_mem20i, real_mem21i, real_mem22i, real_mem23i, real_mem24i, real_mem25i, real_mem26i;
  real real_mem30i, real_mem31i, real_mem32i, real_mem33i, real_mem34i, real_mem35i, real_mem36i;
  real real_mem40i, real_mem41i, real_mem42i, real_mem43i, real_mem44i, real_mem45i, real_mem46i;
  real real_mem50i, real_mem51i, real_mem52i, real_mem53i, real_mem54i, real_mem55i, real_mem56i;
  real real_mem60i, real_mem61i, real_mem62i, real_mem63i, real_mem64i, real_mem65i, real_mem66i;

  reg[31:0] mem00r, mem01r, mem02r, mem03r, mem04r, mem05r, mem06r;
  reg[31:0] mem10r, mem11r, mem12r, mem13r, mem14r, mem15r, mem16r;
  reg[31:0] mem20r, mem21r, mem22r, mem23r, mem24r, mem25r, mem26r;
  reg[31:0] mem30r, mem31r, mem32r, mem33r, mem34r, mem35r, mem36r;
  reg[31:0] mem40r, mem41r, mem42r, mem43r, mem44r, mem45r, mem46r;
  reg[31:0] mem50r, mem51r, mem52r, mem53r, mem54r, mem55r, mem56r;
  reg[31:0] mem60r, mem61r, mem62r, mem63r, mem64r, mem65r, mem66r;


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
    #10;
    
    mem00i = memory[0][55:48];  real_mem00i = mem00i;  mem00r = $shortrealtobits(real_mem00i);
    mem02i = memory[0][39:32];  real_mem02i = mem02i;  mem01r = $shortrealtobits(real_mem01i);
    mem01i = memory[0][47:40];  real_mem01i = mem01i;  mem02r = $shortrealtobits(real_mem02i);
    mem03i = memory[0][31:24];  real_mem03i = mem03i;  mem03r = $shortrealtobits(real_mem03i);
    mem04i = memory[0][23:16];  real_mem04i = mem04i;  mem04r = $shortrealtobits(real_mem04i);
    mem05i = memory[0][15:8];   real_mem05i = mem05i;  mem05r = $shortrealtobits(real_mem05i);
    mem06i = memory[0][7:0];    real_mem06i = mem06i;  mem06r = $shortrealtobits(real_mem06i);
    
    mem10i = memory[1][55:48];  real_mem10i = mem10i;  mem10r = $shortrealtobits(real_mem10i);
    mem12i = memory[1][39:32];  real_mem12i = mem12i;  mem11r = $shortrealtobits(real_mem11i);
    mem11i = memory[1][47:40];  real_mem11i = mem11i;  mem12r = $shortrealtobits(real_mem12i);
    mem13i = memory[1][31:24];  real_mem13i = mem13i;  mem13r = $shortrealtobits(real_mem13i);
    mem14i = memory[1][23:16];  real_mem14i = mem14i;  mem14r = $shortrealtobits(real_mem14i);
    mem15i = memory[1][15:8];   real_mem15i = mem15i;  mem15r = $shortrealtobits(real_mem15i);
    mem16i = memory[1][7:0];    real_mem16i = mem16i;  mem16r = $shortrealtobits(real_mem16i);

    mem20i = memory[2][55:48];  real_mem20i = mem20i;  mem20r = $shortrealtobits(real_mem20i);
    mem22i = memory[2][39:32];  real_mem22i = mem22i;  mem21r = $shortrealtobits(real_mem21i);
    mem21i = memory[2][47:40];  real_mem21i = mem21i;  mem22r = $shortrealtobits(real_mem22i);
    mem23i = memory[2][31:24];  real_mem23i = mem23i;  mem23r = $shortrealtobits(real_mem23i);
    mem24i = memory[2][23:16];  real_mem24i = mem24i;  mem24r = $shortrealtobits(real_mem24i);
    mem25i = memory[2][15:8];   real_mem25i = mem25i;  mem25r = $shortrealtobits(real_mem25i);
    mem26i = memory[2][7:0];    real_mem26i = mem26i;  mem26r = $shortrealtobits(real_mem26i);

    mem30i = memory[3][55:48];  real_mem30i = mem30i;  mem30r = $shortrealtobits(real_mem30i);
    mem32i = memory[3][39:32];  real_mem32i = mem32i;  mem31r = $shortrealtobits(real_mem31i);
    mem31i = memory[3][47:40];  real_mem31i = mem31i;  mem32r = $shortrealtobits(real_mem32i);
    mem33i = memory[3][31:24];  real_mem33i = mem33i;  mem33r = $shortrealtobits(real_mem33i);
    mem34i = memory[3][23:16];  real_mem34i = mem34i;  mem34r = $shortrealtobits(real_mem34i);
    mem35i = memory[3][15:8];   real_mem35i = mem35i;  mem35r = $shortrealtobits(real_mem35i);
    mem36i = memory[3][7:0];    real_mem36i = mem36i;  mem36r = $shortrealtobits(real_mem36i);

    mem40i = memory[4][55:48];  real_mem40i = mem40i;  mem40r = $shortrealtobits(real_mem40i);
    mem42i = memory[4][39:32];  real_mem42i = mem42i;  mem41r = $shortrealtobits(real_mem41i);
    mem41i = memory[4][47:40];  real_mem41i = mem41i;  mem42r = $shortrealtobits(real_mem42i);
    mem43i = memory[4][31:24];  real_mem43i = mem43i;  mem43r = $shortrealtobits(real_mem43i);
    mem44i = memory[4][23:16];  real_mem44i = mem44i;  mem44r = $shortrealtobits(real_mem44i);
    mem45i = memory[4][15:8];   real_mem45i = mem45i;  mem45r = $shortrealtobits(real_mem45i);
    mem46i = memory[4][7:0];    real_mem46i = mem46i;  mem46r = $shortrealtobits(real_mem46i);

    mem50i = memory[5][55:48];  real_mem50i = mem50i;  mem50r = $shortrealtobits(real_mem50i);
    mem52i = memory[5][39:32];  real_mem52i = mem52i;  mem51r = $shortrealtobits(real_mem51i);
    mem51i = memory[5][47:40];  real_mem51i = mem51i;  mem52r = $shortrealtobits(real_mem52i);
    mem53i = memory[5][31:24];  real_mem53i = mem53i;  mem53r = $shortrealtobits(real_mem53i);
    mem54i = memory[5][23:16];  real_mem54i = mem54i;  mem54r = $shortrealtobits(real_mem54i);
    mem55i = memory[5][15:8];   real_mem55i = mem55i;  mem55r = $shortrealtobits(real_mem55i);
    mem56i = memory[5][7:0];    real_mem56i = mem56i;  mem56r = $shortrealtobits(real_mem56i);

    mem60i = memory[6][55:48];  real_mem60i = mem60i;  mem60r = $shortrealtobits(real_mem60i);
    mem62i = memory[6][39:32];  real_mem62i = mem62i;  mem61r = $shortrealtobits(real_mem61i);
    mem61i = memory[6][47:40];  real_mem61i = mem61i;  mem62r = $shortrealtobits(real_mem62i);
    mem63i = memory[6][31:24];  real_mem63i = mem63i;  mem63r = $shortrealtobits(real_mem63i);
    mem64i = memory[6][23:16];  real_mem64i = mem64i;  mem64r = $shortrealtobits(real_mem64i);
    mem65i = memory[6][15:8];   real_mem65i = mem65i;  mem65r = $shortrealtobits(real_mem65i);
    mem66i = memory[6][7:0];    real_mem66i = mem66i;  mem66r = $shortrealtobits(real_mem66i);


    line_0_in = {mem00r, mem01r, mem02r, mem03r, mem04r, mem05r, mem06r};
    line_1_in = {mem10r, mem11r, mem12r, mem13r, mem14r, mem15r, mem16r};
    line_2_in = {mem20r, mem21r, mem22r, mem23r, mem24r, mem25r, mem26r};
    line_3_in = {mem30r, mem31r, mem32r, mem33r, mem34r, mem35r, mem36r};
    line_4_in = {mem40r, mem41r, mem42r, mem43r, mem44r, mem45r, mem46r};
    line_5_in = {mem50r, mem51r, mem52r, mem53r, mem54r, mem55r, mem56r};
    line_6_in = {mem60r, mem61r, mem62r, mem63r, mem64r, mem65r, mem66r};

    #1000;
    
    $finish;
  end

endmodule
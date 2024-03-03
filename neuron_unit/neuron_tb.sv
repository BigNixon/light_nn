`timescale 1ns/1ps

module neuron_unit_tb;

  reg clk;
  reg reset;
  reg de_in;
  reg [223:0] line_0_in, line_1_in, line_2_in, line_3_in, line_4_in, line_5_in, line_6_in, line_7_in, line_8_in, line_9_in, line_10_in, line_11_in, line_12_in, line_13_in, line_14_in, line_15_in, line_16_in, line_17_in, line_18_in, line_19_in, line_20_in, line_21_in, line_22_in, line_23_in, line_24_in, line_25_in, line_26_in, line_27_in;
  reg [223:0] memory [0:27];
  integer symbol_0, symbol_1, symbol_2, symbol_3, symbol_4, symbol_5, symbol_6, symbol_7, symbol_8, symbol_9;

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
    .line_7_in(line_7_in),
    .line_8_in(line_8_in),
    .line_9_in(line_9_in),
    .line_10_in(line_10_in),
    .line_11_in(line_11_in),
    .line_12_in(line_12_in),
    .line_13_in(line_13_in),
    .line_14_in(line_14_in),
    .line_15_in(line_15_in),
    .line_16_in(line_16_in),
    .line_17_in(line_17_in),
    .line_18_in(line_18_in),
    .line_19_in(line_19_in),
    .line_20_in(line_20_in),
    .line_21_in(line_21_in),
    .line_22_in(line_22_in),
    .line_23_in(line_23_in),
    .line_24_in(line_24_in),
    .line_25_in(line_25_in),
    .line_26_in(line_26_in),
    .line_27_in(line_27_in),

    .symbol_0(symbol_0),
    .symbol_1(symbol_1),
    .symbol_2(symbol_2),
    .symbol_3(symbol_3),
    .symbol_4(symbol_4),
    .symbol_5(symbol_5),
    .symbol_6(symbol_6),
    .symbol_7(symbol_7),
    .symbol_8(symbol_8),
    .symbol_9(symbol_9)

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
    line_0_in = 0; line_1_in = 0;    line_2_in = 0;    line_3_in = 0;    line_4_in = 0;    line_5_in = 0;    line_6_in = 0; line_7_in = 0;
    line_8_in = 0; line_9_in = 0;    line_10_in = 0;    line_11_in = 0;    line_12_in = 0;    line_13_in = 0;    line_14_in = 0; line_15_in = 0;
    line_16_in = 0; line_17_in = 0;    line_18_in = 0;    line_19_in = 0;    line_20_in = 0;    line_21_in = 0;    line_22_in = 0; line_23_in = 0;
    line_24_in = 0; line_25_in = 0;    line_26_in = 0;    line_27_in = 0;

    // Read pixel data from file into memory
    $readmemb("./label_0.txt", memory);
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
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];

    #250;

    // Read pixel data from file into memory
    $readmemb("./label_1.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_2.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_3.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_4.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_5.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_6.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_7.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_8.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;
    $readmemb("./label_9.txt", memory); 
    line_0_in = memory[0];
    line_1_in = memory[1];
    line_2_in = memory[2];
    line_3_in = memory[3];
    line_4_in = memory[4];
    line_5_in = memory[5];
    line_6_in = memory[6];
    line_7_in = memory[7];
    line_8_in = memory[8];
    line_9_in = memory[9];
    line_10_in = memory[10];
    line_11_in = memory[11];
    line_12_in = memory[12];
    line_13_in = memory[13];
    line_14_in = memory[14];
    line_15_in = memory[15];
    line_16_in = memory[16];
    line_17_in = memory[17];
    line_18_in = memory[18];
    line_19_in = memory[19];
    line_20_in = memory[20];
    line_21_in = memory[21];
    line_22_in = memory[22];
    line_23_in = memory[23];
    line_24_in = memory[24];
    line_25_in = memory[25];
    line_26_in = memory[26];
    line_27_in = memory[27];
    #250;



    
    $finish;
  end

endmodule
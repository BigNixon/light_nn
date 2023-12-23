`timescale 1ns/1ps

module npu_tb;

  reg clk;
  reg reset;
  reg de_in;
  reg [7:0] data_in;
  wire [7:0] r_out, g_out, b_out;

  // Instantiate the npu module
  npu u_npu (
    .clk(clk),
    .reset(reset),
    .de_in(de_in),
    .data_in(data_in),
    .r_out(r_out),
    .g_out(g_out),
    .b_out(b_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Memory array
  reg [7:0] memory [0:921599];
  integer chann_out, symbol_out;
  // Test sequence
  initial begin
    // Initialize signals
    chann_out = $fopen("rgb_out.txt", "w");
    // symbol_out = $fopen("symbol_out.txt", "w");
    clk = 0;
    reset = 1;
    de_in = 0;
    data_in = 0;

    // Read values from the file and store them in the memory array
    $readmemb("all_luminance.txt", memory);

    #10;
    reset = 0;
    #10;
    // Apply the stimulus to the npu module
    for (int i = 0; i < 921600; i++) begin
      #10;
      de_in = 1;
      data_in = memory[i];
      $fdisplay(chann_out,"%b%b%b", r_out, g_out, b_out);
      // $fdisplay(symbol_out, "symb0=%d, symb1=%d, symb2=%d, symb3=%d", u_npu.symbol_0, u_npu.symbol_1, u_npu.symbol_2, u_npu.symbol_3);

    end
    #1;
    de_in = 0;
    #10;
    $fclose(chann_out);
    // $fclose(symbol_out);
    $finish;
    // Capture the output values and write them to another text file
   
  end

endmodule
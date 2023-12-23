`timescale 1ns/1ps

module memory_line_tb;

  reg clk;
  reg rst;
  reg data_en;
  reg [7:0] data_in;
  wire [7:0] data_out;

  // Instantiate the memory_line module
  memory_line u_memory_line (
    .clk(clk),
    .rst(rst),
    .data_en(data_en),
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
    rst = 1;
    data_en = 0;
    data_in = 0;

    #10;
    rst = 0;
    #10;
    data_en = 1;

    // Stimulate more than 1280 data inputs
    for (int i = 0; i < 1600; i++) begin
      data_in = $random;
      #10;
    end
    data_en = 0;
    #10;
    // End simulation
    $finish;
  end

endmodule

`timescale 1ns/1ps

module memory_stage_tb;

  reg clk;
  reg rst;
  reg data_enable_in;
  reg [7:0] data_in; // 8 bits
  wire [55:0] line0, line1, line2, line3, line4, line5, line6;
 wire [7:0] data_out; // 8 bits

  // Instantiate the memory_stage module
  memory_stage u_memory_stage (
    .clk(clk),
    .rst(rst),
    .data_enable_in(data_enable_in),
    .data_in(data_in),
    .line0(line0),
    .line1(line1),
    .line2(line2),
    .line3(line3),
    .line4(line4),
    .line5(line5),
    .line6(line6),
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
    data_enable_in = 0;
    data_in = 0;

    #10;
    rst = 0;
    #10;
    data_enable_in = 1;
    // Generate random pixel data
    for (int j=0; j<7; j++) begin
        for (int i = 0; i < 1280; i++) begin
            #10 data_in = i;
        end
    end
    data_enable_in = 0;
    #10;
    $finish;
  end

endmodule
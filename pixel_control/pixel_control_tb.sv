`timescale 1ns/1ps

module pixel_control_unit_tb;

  logic clk;
  logic [7:0] input_pixel; // Assuming input_pixel is 8 bits
  logic [7:0] output_pixel; // Assuming there is an output

  // Instantiate the pixel_control_unit module
  pixel_control_unit #(
    .delay(7)
  ) uut (
    .clk(clk),
    .input_pixel(input_pixel),
    .output_pixel(output_pixel)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    input_pixel = 8'h00;

    #10;
    // Write a constant value to input_pixel
    input_pixel = 8'hAA;
    #100;
    $finish;
  end

endmodule
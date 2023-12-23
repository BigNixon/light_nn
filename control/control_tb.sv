`timescale 1ns/1ps
module control_tb;
    
    parameter integer delay = 7;

    logic clk;
    logic reset;
    logic vs_in;
    logic hs_in;
    logic de_in;

    logic vs_out;
    logic hs_out;
    logic de_out;

    pixel_control_unit #(
        .delay(delay)
    ) control_unit (
        .clk(clk),
        .reset(reset),
        .vs_in(vs_in),
        .hs_in(hs_in),
        .de_in(de_in),
        .vs_out(vs_out),
        .hs_out(hs_out),
        .de_out(de_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        vs_in = 0;
        hs_in = 0;
        de_in = 0;
        #10 reset = 0;
        #10 vs_in = 1;
        #10 hs_in = 1;
        #10 de_in = 1;
        #100 $finish;
    end
    
        
endmodule
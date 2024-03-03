`timescale 1ns / 1ps
`include "rom.sv"

module tb_ROM;

    // Parameters
    localparam ADDR_WIDTH = 12;
    localparam DATA_WIDTH = 8;

    // Signals
    reg clk;
    reg [ADDR_WIDTH-1:0] addr;
    wire [DATA_WIDTH-1:0] data;

    // Instantiate the ROM
    rom #(ADDR_WIDTH, DATA_WIDTH) uut (
        .clk(clk),
        .addr(addr),
        .data(data)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        addr = 0;

        // Specify the VCD file
        $dumpfile("tb_ROM.vcd");

        // Dump all variables
        $dumpvars(0, tb_ROM);

        // Wait for a few clock cycles
        #20;

        // Change the address
        addr = 10;

        // Wait for a few more clock cycles
        #20;

        // Finish the simulation
        $finish;
    end

endmodule
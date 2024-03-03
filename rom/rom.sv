module rom #(parameter ADDR_WIDTH = 12, DATA_WIDTH = 8)(
    input wire clk,
    input wire [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] data
);

    // Define the ROM
    reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0];

    // Load the ROM data from a file
    initial begin
        $readmemb("sigmoid_12_bit.txt", mem);
    end

    // Output the data at the given address on the rising edge of the clock
    always @(posedge clk) begin
        data <= mem[addr];
    end

endmodule
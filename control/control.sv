module control#(
    parameter integer delay = 7
)(
    input logic clk,
    input logic reset,
    input logic vs_in,
    input logic hs_in,
    input logic de_in,

    output logic vs_out,
    output logic hs_out,
    output logic de_out
);

    logic vs_buffer[1:delay];
    logic hs_buffer[1:delay];
    logic de_buffer[1:delay];

    always_ff @(posedge clk) begin
        vs_buffer[1] <= vs_in;
        hs_buffer[1] <= hs_in;
        de_buffer[1] <= de_in;
        for (int i = 2; i <= delay; i++) begin
            vs_buffer[i] <= vs_buffer[i-1];
            hs_buffer[i] <= hs_buffer[i-1];
            de_buffer[i] <= de_buffer[i-1];
        end
    end

    assign vs_out = vs_buffer[delay];
    assign hs_out = hs_buffer[delay];
    assign de_out = de_buffer[delay];


endmodule
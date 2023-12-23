module pixel_control_unit#(
    parameter integer delay = 7
)(
    input logic clk,
    input logic[7:0] input_pixel,
    output logic[7:0] output_pixel
);

    logic[7:0] pixel_buffer[1:delay];

    always_ff @(posedge clk) begin
        pixel_buffer[1] <= input_pixel;
        for (int i = 2; i <= delay; i++) begin
            pixel_buffer[i] <= pixel_buffer[i-1];
        end
    end

    assign output_pixel = pixel_buffer[delay];

endmodule
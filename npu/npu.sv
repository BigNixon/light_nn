module npu (
    input logic clk,
    input logic reset,
    input logic de_in,
    input logic [7:0] data_in,

    output logic [7:0] r_out,
    output logic [7:0] g_out,
    output logic [7:0] b_out
);

    logic [55:0] line_0, line_1, line_2, line_3, line_4, line_5, line_6;
    integer symbol_0, symbol_1, symbol_2, symbol_3;
    logic [7:0] pixel_0, pixel_1;


    memory_stage mem_inst(
        .clk(clk),
        .rst(reset),
        .data_enable_in(de_in),
        .data_in(data_in),

        .data_out(pixel_0),
        .line0(line_0),
        .line1(line_1),
        .line2(line_2),
        .line3(line_3),
        .line4(line_4),
        .line5(line_5),
        .line6(line_6)
    );

    neuron_unit neuron_unit_inst(
        .clk(clk),
        .reset(reset),
        .de_in(de_in),
        .line_0_in(line_0),
        .line_1_in(line_1),
        .line_2_in(line_2),
        .line_3_in(line_3),
        .line_4_in(line_4),
        .line_5_in(line_5),
        .line_6_in(line_6),

        .symbol_0(symbol_0),
        .symbol_1(symbol_1),
        .symbol_2(symbol_2),
        .symbol_3(symbol_3)
    );

    pixel_control_unit #(
        .delay(7)
    )pixel_control_unit_inst(
        .clk(clk),
        .input_pixel(pixel_0),
        .output_pixel(pixel_1)
    );

    manipulation_unit manipulation_unit_inst(
        .clk(clk),
        .data_in(pixel_1),
        .symbol_0(symbol_0),
        .symbol_1(symbol_1),
        .symbol_2(symbol_2),
        .symbol_3(symbol_3),
        .r_out(r_out),
        .g_out(g_out),
        .b_out(b_out)
    );
    

endmodule

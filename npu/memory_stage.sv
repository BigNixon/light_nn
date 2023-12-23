module memory_stage (
    input logic clk,
    input logic rst,
    input logic data_enable_in,
    input logic [7:0] data_in,

    output reg [7:0] data_out,
    
    output reg [55:0] line0,
    output reg [55:0] line1,
    output reg [55:0] line2,
    output reg [55:0] line3,
    output reg [55:0] line4,
    output reg [55:0] line5,
    output reg [55:0] line6
);

reg [7:0] tap_00, tap_01, tap_02, tap_03, tap_04, tap_05, tap_06,
            tap_10, tap_11, tap_12, tap_13, tap_14, tap_15, tap_16,
            tap_20, tap_21, tap_22, tap_23, tap_24, tap_25, tap_26,
            tap_30, tap_31, tap_32, tap_33, tap_34, tap_35, tap_36,
            tap_40, tap_41, tap_42, tap_43, tap_44, tap_45, tap_46,
            tap_50, tap_51, tap_52, tap_53, tap_54, tap_55, tap_56,
            tap_60, tap_61, tap_62, tap_63, tap_64, tap_65, tap_66;

    assign tap_66 = data_in;

    memory_line mem_0(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_66),
        .data_out(tap_56)
    );

    memory_line mem_1(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_56),
        .data_out(tap_46)
    );

    memory_line mem_2(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_46),
        .data_out(tap_36)
    );

    memory_line mem_3(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_36),
        .data_out(tap_26)
    );

    memory_line mem_4(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_26),
        .data_out(tap_16)
    );

    memory_line mem_5(
        .clk(clk),
        .rst(rst),
        .data_en(data_enable_in),
        .data_in(tap_16),
        .data_out(tap_06)
    );

    always @(posedge clk) begin
        //0 line
        tap_05 <= tap_06;
        tap_04 <= tap_05;
        tap_03 <= tap_04;
        tap_02 <= tap_03;
        tap_01 <= tap_02;
        tap_00 <= tap_01;

        //1 line
        tap_15 <= tap_16;
        tap_14 <= tap_15;
        tap_13 <= tap_14;
        tap_12 <= tap_13;
        tap_11 <= tap_12;
        tap_10 <= tap_11;

        //2 line
        tap_25 <= tap_26;
        tap_24 <= tap_25;
        tap_23 <= tap_24;
        tap_22 <= tap_23;
        tap_21 <= tap_22;
        tap_20 <= tap_21;
        
        //3 line
        tap_35 <= tap_36;
        tap_34 <= tap_35;
        tap_33 <= tap_34;
        tap_32 <= tap_33;
        tap_31 <= tap_32;
        tap_30 <= tap_31;
        
        //4 line
        tap_45 <= tap_46;
        tap_44 <= tap_45;
        tap_43 <= tap_44;
        tap_42 <= tap_43;
        tap_41 <= tap_42;
        tap_40 <= tap_41;

        //5 line
        tap_55 <= tap_56;
        tap_54 <= tap_55;
        tap_53 <= tap_54;
        tap_52 <= tap_53;
        tap_51 <= tap_52;
        tap_50 <= tap_51;

        //6 line
        tap_65 <= tap_66;
        tap_64 <= tap_65;
        tap_63 <= tap_64;
        tap_62 <= tap_63;
        tap_61 <= tap_62;
        tap_60 <= tap_61;

    end

    assign line0 = {tap_00, tap_01, tap_02, tap_03, tap_04, tap_05, tap_06};
    assign line1 = {tap_10, tap_11, tap_12, tap_13, tap_14, tap_15, tap_16};
    assign line2 = {tap_20, tap_21, tap_22, tap_23, tap_24, tap_25, tap_26};
    assign line3 = {tap_30, tap_31, tap_32, tap_33, tap_34, tap_35, tap_36};
    assign line4 = {tap_40, tap_41, tap_42, tap_43, tap_44, tap_45, tap_46};
    assign line5 = {tap_50, tap_51, tap_52, tap_53, tap_54, tap_55, tap_56};
    assign line6 = {tap_60, tap_61, tap_62, tap_63, tap_64, tap_65, tap_66};

    assign data_out = tap_33; 

endmodule
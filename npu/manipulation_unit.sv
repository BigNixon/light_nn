module manipulation_unit(
    input logic clk,
    input logic [7:0] data_in,
    input integer symbol_0, //dot
    input integer symbol_1, //circle
    input integer symbol_2, //x
    input integer symbol_3, //cross

    output logic [7:0] r_out,
    output logic [7:0] g_out,
    output logic [7:0] b_out
);


    localparam integer threshold = 170;

    always_ff @( posedge clk ) begin : check_threshold
        if(symbol_0>threshold) begin
            //dark yellow
            r_out <= 8'b11111111;
            g_out <= 8'b11111111;
            b_out <= 8'b00000000;
        end else if (symbol_1>threshold) begin
            //green
            r_out <= 8'b00000000;
            g_out <= 8'b11111111;
            b_out <= 8'b00000000;
        end else if (symbol_2>threshold) begin
            //blue
            r_out <= 8'b00000000;
            g_out <= 8'b00000000;
            b_out <= 8'b11111111;
        end else if (symbol_3>threshold) begin
            //red
            r_out <= 8'b11111111;
            g_out <= 8'b00000000;
            b_out <= 8'b00000000;
        end else begin
            //light input value
            r_out <= {{2'b11},data_in[7:2]};
            g_out <= {{2'b11},data_in[7:2]};
            b_out <= {{2'b11},data_in[7:2]};
        end
        
    end

endmodule
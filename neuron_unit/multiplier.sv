module multiplier #(parameter integer weigths=7) (
    input logic  clk,
    input integer data_in,
    output integer data_out
);

    always_ff @(posedge clk) begin
        data_out <= weigths * data_in;
    end

    
endmodule
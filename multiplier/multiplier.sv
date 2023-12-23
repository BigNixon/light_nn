module multiplier #(parameter integer wieght) (
    input wire  clk,
    input integer data_in,
    output integer data_out
);

    always_ff @(posedge clk) begin
        data_out <= wieght * data_in;
    end

    
endmodule
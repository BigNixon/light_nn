
module neuron_input64 #(
    parameter integer weigths [64:0] = '{
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65
    } // 64 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [63:0],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [63:0];

    integer sum;

    genvar i;
    generate
        for (i = 0; i<64; i++) begin : gen_multipliers
            multiplier #(
                .weigths(weigths[i])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[i]),
                .data_out(accumulate[i])
            );
        end
    endgenerate
    
    always_ff @( posedge clk ) begin : acummulations
        sum <= accumulate[0] + accumulate[1] + accumulate[2] + accumulate[3] + accumulate[4] + accumulate[5] + accumulate[6] + accumulate[7] + accumulate[8] + accumulate[9] + accumulate[10] + accumulate[11] + accumulate[12] + accumulate[13] + accumulate[14] + accumulate[15] + accumulate[16] + accumulate[17] + accumulate[18] + accumulate[19] + accumulate[20] + accumulate[21] + accumulate[22] + accumulate[23] + accumulate[24] + accumulate[25] + accumulate[26] + accumulate[27] + accumulate[28] + accumulate[29] + accumulate[30] + accumulate[31] + accumulate[32] + accumulate[33] + accumulate[34] + accumulate[35] + accumulate[36] + accumulate[37] + accumulate[38] + accumulate[39] + accumulate[40] + accumulate[41] + accumulate[42] + accumulate[43] + accumulate[44] + accumulate[45] + accumulate[46] + accumulate[47] + accumulate[48] + accumulate[49] + accumulate[50] + accumulate[51] + accumulate[52] + accumulate[53] + accumulate[54] + accumulate[55] + accumulate[56] + accumulate[57] + accumulate[58] + accumulate[59] + accumulate[60] + accumulate[61] + accumulate[62] + accumulate[63];
        sumForActivation <= sum + weigths[64];
    end

    always_ff @( posedge clk ) begin : activation
        if (sumForActivation < -32768) begin
            sumAdress <= 0;
        end else if(sumForActivation > 32767) begin
            sumAdress <= ~0;
        end else begin
            sumAdress <= sumForActivation;
        end
    end

    //FOR MODELSIM SIMULATION & QUARTUS SYNTHESIS
   sigmoid_IP sigmoid_inst (
       .clk(clk),
       .addr(sumAdress[15:4]), //12 bits
       .data(afterActivation)
   );

   //FOR VIVADO SYNTHESIS
    // sigmoid_IP sigmoid_inst (
    //         .clk(clk),
    //         .a(sumAdress[15:4]), //12 bits
    //         .spo(afterActivation)
    //     );

    assign output_out = afterActivation;

endmodule
    
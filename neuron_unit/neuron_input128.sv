
module neuron_input128 #(
    parameter integer weigths [128:0] = '{
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129
    } // 128 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [127:0],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [127:0];

    integer sum;

    genvar i;
    generate
        for (i = 0; i<128; i++) begin : gen_multipliers
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
        sum <= accumulate[0] + accumulate[1] + accumulate[2] + accumulate[3] + accumulate[4] + accumulate[5] + accumulate[6] + accumulate[7] + accumulate[8] + accumulate[9] + accumulate[10] + accumulate[11] + accumulate[12] + accumulate[13] + accumulate[14] + accumulate[15] + accumulate[16] + accumulate[17] + accumulate[18] + accumulate[19] + accumulate[20] + accumulate[21] + accumulate[22] + accumulate[23] + accumulate[24] + accumulate[25] + accumulate[26] + accumulate[27] + accumulate[28] + accumulate[29] + accumulate[30] + accumulate[31] + accumulate[32] + accumulate[33] + accumulate[34] + accumulate[35] + accumulate[36] + accumulate[37] + accumulate[38] + accumulate[39] + accumulate[40] + accumulate[41] + accumulate[42] + accumulate[43] + accumulate[44] + accumulate[45] + accumulate[46] + accumulate[47] + accumulate[48] + accumulate[49] + accumulate[50] + accumulate[51] + accumulate[52] + accumulate[53] + accumulate[54] + accumulate[55] + accumulate[56] + accumulate[57] + accumulate[58] + accumulate[59] + accumulate[60] + accumulate[61] + accumulate[62] + accumulate[63] + accumulate[64] + accumulate[65] + accumulate[66] + accumulate[67] + accumulate[68] + accumulate[69] + accumulate[70] + accumulate[71] + accumulate[72] + accumulate[73] + accumulate[74] + accumulate[75] + accumulate[76] + accumulate[77] + accumulate[78] + accumulate[79] + accumulate[80] + accumulate[81] + accumulate[82] + accumulate[83] + accumulate[84] + accumulate[85] + accumulate[86] + accumulate[87] + accumulate[88] + accumulate[89] + accumulate[90] + accumulate[91] + accumulate[92] + accumulate[93] + accumulate[94] + accumulate[95] + accumulate[96] + accumulate[97] + accumulate[98] + accumulate[99] + accumulate[100] + accumulate[101] + accumulate[102] + accumulate[103] + accumulate[104] + accumulate[105] + accumulate[106] + accumulate[107] + accumulate[108] + accumulate[109] + accumulate[110] + accumulate[111] + accumulate[112] + accumulate[113] + accumulate[114] + accumulate[115] + accumulate[116] + accumulate[117] + accumulate[118] + accumulate[119] + accumulate[120] + accumulate[121] + accumulate[122] + accumulate[123] + accumulate[124] + accumulate[125] + accumulate[126] + accumulate[127];
        sumForActivation <= sum + weigths[128];
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
    
module neuron_input37 #(
    parameter integer weigths [38]='{1,2,3,4,5,6,7,8,9,10,
												11,12,13,14,15,16,17,18,19,20,
												21,22,23,24,25,26,27,28,29,30,
												31,32,33,34,34,36,37,38} //37 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [37],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [36:0];

    integer sum, sum0, sum1, sum2, sum3, sum4, sum5;

    genvar i;
    generate
        for (i = 0; i<37; i++) begin : gen_multipliers
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
        sum0 <= accumulate[0] + accumulate[1] + accumulate[2]+ accumulate[3] + accumulate[4] + accumulate[5];
        sum1 <= accumulate[6] + accumulate[7] + accumulate[8]+ accumulate[9] + accumulate[10] + accumulate[11];
        sum2 <= accumulate[12] + accumulate[13] + accumulate[14] + accumulate[15] + accumulate[16] + accumulate[17];
        sum3 <= accumulate[18] + accumulate[19] + accumulate[20] + accumulate[21] + accumulate[22] + accumulate[23];
        sum4 <= accumulate[24] + accumulate[25] + accumulate[26] + accumulate[27] + accumulate[28] + accumulate[29];
        sum5 <= accumulate[30] + accumulate[31] + accumulate[32] + accumulate[33] + accumulate[34] + accumulate[35] + accumulate[36];
        sum <= sum0 + sum1 + sum2 + sum3 + sum4 + sum5;
        sumForActivation <= sum + weigths[37];
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
       .clock(clk),
       .address(sumAdress[15:4]), //12 bits
       .q(afterActivation)
   );

// FOR VIVADO SYNTHESIS
    // sigmoid_IP sigmoid_inst (
    //     .clk(clk),
    //     .a(sumAdress[15:4]), //12 bits
    //     .spo(afterActivation)
    // );


    assign output_out = afterActivation;

endmodule
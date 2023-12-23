module neuron_input49 #(
    parameter integer weigths [50] //49 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [49],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [48:0];

    integer sum, sum0, sum1, sum2, sum3, sum4, sum5, sum6;

    genvar i;
    generate
        for (i = 0; i<49; i++) begin : gen_multipliers
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
        sum0 <= accumulate[0] + accumulate[1] + accumulate[2]+
                accumulate[3] + accumulate[4] + accumulate[5]+
                accumulate[6];
        sum1 <= accumulate[7] + accumulate[8] + accumulate[9]+
                accumulate[10] + accumulate[11] + accumulate[12]+
                accumulate[13];
        sum2 <= accumulate[14] + accumulate[15] + accumulate[16]+
                accumulate[17] + accumulate[18] + accumulate[19]+
                accumulate[20];
        sum3 <= accumulate[21] + accumulate[22] + accumulate[23]+
                accumulate[24] + accumulate[25] + accumulate[26]+
                accumulate[27];
        sum4 <= accumulate[28] + accumulate[29] + accumulate[30]+
                accumulate[31] + accumulate[32] + accumulate[33]+
                accumulate[34];
        sum5 <= accumulate[35] + accumulate[36] + accumulate[37]+
                accumulate[38] + accumulate[39] + accumulate[40]+
                accumulate[41];
        sum6 <= accumulate[42] + accumulate[43] + accumulate[44]+
                accumulate[45] + accumulate[46] + accumulate[47]+
                accumulate[48];
        sum <= sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6;
        sumForActivation <= sum + weigths[49];
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

    sigmoid_IP sigmoid_inst (
        .clock(clk),
        .address(sumAdress[15:4]), //12 bits
        .q(afterActivation)
    );


    assign output_out = afterActivation;

endmodule

module neuron_input49 #(
    parameter integer weigths [49:0] = '{
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50
    } // 49 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [48:0],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [49-1:0];

    integer sum;

    genvar i;
    generate
        for (i = 0; i<50; i++) begin : gen_multipliers
            
            multiplier #(
                .weigths(weigths[0])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[0]),
                .data_out(accumulate[0])
            );
        
            multiplier #(
                .weigths(weigths[1])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[1]),
                .data_out(accumulate[1])
            );
        
            multiplier #(
                .weigths(weigths[2])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[2]),
                .data_out(accumulate[2])
            );
        
            multiplier #(
                .weigths(weigths[3])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[3]),
                .data_out(accumulate[3])
            );
        
            multiplier #(
                .weigths(weigths[4])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[4]),
                .data_out(accumulate[4])
            );
        
            multiplier #(
                .weigths(weigths[5])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[5]),
                .data_out(accumulate[5])
            );
        
            multiplier #(
                .weigths(weigths[6])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[6]),
                .data_out(accumulate[6])
            );
        
            multiplier #(
                .weigths(weigths[7])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[7]),
                .data_out(accumulate[7])
            );
        
            multiplier #(
                .weigths(weigths[8])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[8]),
                .data_out(accumulate[8])
            );
        
            multiplier #(
                .weigths(weigths[9])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[9]),
                .data_out(accumulate[9])
            );
        
            multiplier #(
                .weigths(weigths[10])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[10]),
                .data_out(accumulate[10])
            );
        
            multiplier #(
                .weigths(weigths[11])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[11]),
                .data_out(accumulate[11])
            );
        
            multiplier #(
                .weigths(weigths[12])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[12]),
                .data_out(accumulate[12])
            );
        
            multiplier #(
                .weigths(weigths[13])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[13]),
                .data_out(accumulate[13])
            );
        
            multiplier #(
                .weigths(weigths[14])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[14]),
                .data_out(accumulate[14])
            );
        
            multiplier #(
                .weigths(weigths[15])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[15]),
                .data_out(accumulate[15])
            );
        
            multiplier #(
                .weigths(weigths[16])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[16]),
                .data_out(accumulate[16])
            );
        
            multiplier #(
                .weigths(weigths[17])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[17]),
                .data_out(accumulate[17])
            );
        
            multiplier #(
                .weigths(weigths[18])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[18]),
                .data_out(accumulate[18])
            );
        
            multiplier #(
                .weigths(weigths[19])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[19]),
                .data_out(accumulate[19])
            );
        
            multiplier #(
                .weigths(weigths[20])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[20]),
                .data_out(accumulate[20])
            );
        
            multiplier #(
                .weigths(weigths[21])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[21]),
                .data_out(accumulate[21])
            );
        
            multiplier #(
                .weigths(weigths[22])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[22]),
                .data_out(accumulate[22])
            );
        
            multiplier #(
                .weigths(weigths[23])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[23]),
                .data_out(accumulate[23])
            );
        
            multiplier #(
                .weigths(weigths[24])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[24]),
                .data_out(accumulate[24])
            );
        
            multiplier #(
                .weigths(weigths[25])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[25]),
                .data_out(accumulate[25])
            );
        
            multiplier #(
                .weigths(weigths[26])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[26]),
                .data_out(accumulate[26])
            );
        
            multiplier #(
                .weigths(weigths[27])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[27]),
                .data_out(accumulate[27])
            );
        
            multiplier #(
                .weigths(weigths[28])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[28]),
                .data_out(accumulate[28])
            );
        
            multiplier #(
                .weigths(weigths[29])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[29]),
                .data_out(accumulate[29])
            );
        
            multiplier #(
                .weigths(weigths[30])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[30]),
                .data_out(accumulate[30])
            );
        
            multiplier #(
                .weigths(weigths[31])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[31]),
                .data_out(accumulate[31])
            );
        
            multiplier #(
                .weigths(weigths[32])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[32]),
                .data_out(accumulate[32])
            );
        
            multiplier #(
                .weigths(weigths[33])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[33]),
                .data_out(accumulate[33])
            );
        
            multiplier #(
                .weigths(weigths[34])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[34]),
                .data_out(accumulate[34])
            );
        
            multiplier #(
                .weigths(weigths[35])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[35]),
                .data_out(accumulate[35])
            );
        
            multiplier #(
                .weigths(weigths[36])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[36]),
                .data_out(accumulate[36])
            );
        
            multiplier #(
                .weigths(weigths[37])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[37]),
                .data_out(accumulate[37])
            );
        
            multiplier #(
                .weigths(weigths[38])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[38]),
                .data_out(accumulate[38])
            );
        
            multiplier #(
                .weigths(weigths[39])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[39]),
                .data_out(accumulate[39])
            );
        
            multiplier #(
                .weigths(weigths[40])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[40]),
                .data_out(accumulate[40])
            );
        
            multiplier #(
                .weigths(weigths[41])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[41]),
                .data_out(accumulate[41])
            );
        
            multiplier #(
                .weigths(weigths[42])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[42]),
                .data_out(accumulate[42])
            );
        
            multiplier #(
                .weigths(weigths[43])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[43]),
                .data_out(accumulate[43])
            );
        
            multiplier #(
                .weigths(weigths[44])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[44]),
                .data_out(accumulate[44])
            );
        
            multiplier #(
                .weigths(weigths[45])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[45]),
                .data_out(accumulate[45])
            );
        
            multiplier #(
                .weigths(weigths[46])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[46]),
                .data_out(accumulate[46])
            );
        
            multiplier #(
                .weigths(weigths[47])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[47]),
                .data_out(accumulate[47])
            );
        
            multiplier #(
                .weigths(weigths[48])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[48]),
                .data_out(accumulate[48])
            );
        
            multiplier #(
                .weigths(weigths[49])
            ) multiplier_inst (
                .clk(clk),
                .data_in(input_in[49]),
                .data_out(accumulate[49])
            );
        
        end
    endgenerate
    
    always_ff @( posedge clk ) begin : acummulations
        sum <= accumulate[0] + accumulate[1] + accumulate[2] + accumulate[3] + accumulate[4] + accumulate[5] + accumulate[6] + accumulate[7] + accumulate[8] + accumulate[9] + accumulate[10] + accumulate[11] + accumulate[12] + accumulate[13] + accumulate[14] + accumulate[15] + accumulate[16] + accumulate[17] + accumulate[18] + accumulate[19] + accumulate[20] + accumulate[21] + accumulate[22] + accumulate[23] + accumulate[24] + accumulate[25] + accumulate[26] + accumulate[27] + accumulate[28] + accumulate[29] + accumulate[30] + accumulate[31] + accumulate[32] + accumulate[33] + accumulate[34] + accumulate[35] + accumulate[36] + accumulate[37] + accumulate[38] + accumulate[39] + accumulate[40] + accumulate[41] + accumulate[42] + accumulate[43] + accumulate[44] + accumulate[45] + accumulate[46] + accumulate[47] + accumulate[48] + accumulate[49];
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

    //FOR MODELSIM SIMULATION & QUARTUS SYNTHESIS
   sigmoid_IP sigmoid_inst (
       .clock(clk),
       .address(sumAdress[15:4]), //12 bits
       .q(afterActivation)
   );

   //FOR VIVADO SYNTHESIS
    // sigmoid_IP sigmoid_inst (
    //         .clk(clk),
    //         .a(sumAdress[15:4]), //12 bits
    //         .spo(afterActivation)
    //     );

    assign output_out = afterActivation;

endmodule
    
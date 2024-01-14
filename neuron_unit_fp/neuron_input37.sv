module neuron_input37 #(
    parameter [31:0] weigths [38]='{1,2,3,4,5,6,7,8,9,10,
												11,12,13,14,15,16,17,18,19,20,
												21,22,23,24,25,26,27,28,29,30,
												31,32,33,34,34,36,37,38} //37 weigth + 1 bias
) (
    input logic clk,
    input reg [31:0] input_in [37],
    output reg [31:0] output_out
);

    reg [15:0] sumAdress;
    logic [31:0] afterActivation;
    reg[31:0] sumForActivation;

    reg [31:0] accumulate [36:0];

    reg [31:0] sum, sum0, sum1, sum2, sum3, sum4, sum5;
    wire [31:0] aux01,aux02, aux03, aux04, aux05;
    wire [31:0] aux11,aux12, aux13, aux14, aux15;
    wire [31:0] aux21,aux22, aux23, aux24, aux25;
    wire [31:0] aux31,aux32, aux33, aux34, aux35;
    wire [31:0] aux41,aux42, aux43, aux44, aux45;
    wire [31:0] aux51,aux52, aux53, aux54, aux55, aux56;

    wire [31:0] aux_1,aux_2, aux_3, aux_4, aux_5;
    wire [31:0] sfa;

    wire [15:0] sumForActivation_address;

    genvar i;
    generate
        for (i = 0; i<37; i++) begin : gen_multipliers
            // multiplier #(
            //     .weigths(weigths[i])
            // ) multiplier_inst (
            //     .clk(clk),
            //     .data_in(input_in[i]),
            //     .data_out(accumulate[i])
            // );
            floating_point_multiplier floating_point_multiplier_inst (
                .clk(clk),
                .a(input_in[i]),
                .b(weigths[i]),
                .p(accumulate[i])
            );
        end
    endgenerate

    fp_adder fp_adder_inst0 (.a(accumulate[0]),.b(accumulate[1]),.sum(aux01));
    fp_adder fp_adder_inst1 (.a(accumulate[2]),.b(accumulate[3]),.sum(aux02));
    fp_adder fp_adder_inst2 (.a(accumulate[4]),.b(accumulate[5]),.sum(aux03));
    fp_adder fp_adder_inst3 (.a(aux01),.b(aux02),.sum(aux04));
    fp_adder fp_adder_inst4 (.a(aux04),.b(aux03),.sum(aux05));

    fp_adder fp_adder_inst5 (.a(accumulate[6]),.b(accumulate[7]),.sum(aux11));
    fp_adder fp_adder_inst6 (.a(accumulate[8]),.b(accumulate[9]),.sum(aux12));
    fp_adder fp_adder_inst7 (.a(accumulate[10]),.b(accumulate[11]),.sum(aux13));
    fp_adder fp_adder_inst8 (.a(aux11),.b(aux12),.sum(aux14));
    fp_adder fp_adder_inst9 (.a(aux14),.b(aux13),.sum(aux15));

    fp_adder fp_adder_inst10 (.a(accumulate[12]),.b(accumulate[13]),.sum(aux21));
    fp_adder fp_adder_inst11 (.a(accumulate[14]),.b(accumulate[15]),.sum(aux22));
    fp_adder fp_adder_inst12 (.a(accumulate[16]),.b(accumulate[17]),.sum(aux23));
    fp_adder fp_adder_inst13 (.a(aux21),.b(aux22),.sum(aux24));
    fp_adder fp_adder_inst14 (.a(aux24),.b(aux23),.sum(aux25));

    fp_adder fp_adder_inst15 (.a(accumulate[18]),.b(accumulate[19]),.sum(aux31));
    fp_adder fp_adder_inst16 (.a(accumulate[20]),.b(accumulate[21]),.sum(aux32));
    fp_adder fp_adder_inst17 (.a(accumulate[22]),.b(accumulate[23]),.sum(aux33));
    fp_adder fp_adder_inst18 (.a(aux31),.b(aux32),.sum(aux34));
    fp_adder fp_adder_inst19 (.a(aux34),.b(aux33),.sum(aux35));

    fp_adder fp_adder_inst20 (.a(accumulate[24]),.b(accumulate[25]),.sum(aux41));
    fp_adder fp_adder_inst21 (.a(accumulate[26]),.b(accumulate[27]),.sum(aux42));
    fp_adder fp_adder_inst22 (.a(accumulate[28]),.b(accumulate[29]),.sum(aux43));
    fp_adder fp_adder_inst23 (.a(aux41),.b(aux42),.sum(aux44));
    fp_adder fp_adder_inst24 (.a(aux44),.b(aux43),.sum(aux45));

    fp_adder fp_adder_inst25 (.a(accumulate[30]),.b(accumulate[31]),.sum(aux51));
    fp_adder fp_adder_inst26 (.a(accumulate[32]),.b(accumulate[33]),.sum(aux52));
    fp_adder fp_adder_inst27 (.a(accumulate[34]),.b(accumulate[35]),.sum(aux53));
    fp_adder fp_adder_inst28 (.a(aux51),.b(aux52),.sum(aux54));
    fp_adder fp_adder_inst29 (.a(aux53),.b(accumulate[36]),.sum(aux55));
    fp_adder fp_adder_inst30 (.a(aux55),.b(aux54),.sum(aux56));

    fp_adder fp_adder_inst31 (.a(sum0),.b(sum1),.sum(aux_1));
    fp_adder fp_adder_inst32 (.a(sum2),.b(sum3),.sum(aux_2));
    fp_adder fp_adder_inst33 (.a(sum4),.b(sum5),.sum(aux_3));
    fp_adder fp_adder_inst34 (.a(aux_1),.b(aux_2),.sum(aux_4));
    fp_adder fp_adder_inst35 (.a(aux_4),.b(aux_3),.sum(aux_5));

    fp_adder fp_adder_inst36 (.a(sum),.b(weigths[37]),.sum(sfa));

    always_ff @( posedge clk ) begin : acummulations
        sum0 <= aux05;
        sum1 <= aux15;
        sum2 <= aux25;
        sum3 <= aux35;
        sum4 <= aux45;
        sum5 <= aux56;
        sum <= aux_5;
        sumForActivation <= sfa;
    end

    float_to_int16 float_to_int16_inst (
        .a(sumForActivation),
        .out(sumForActivation_address),
        .clk(clk)
    );

    always_ff @( posedge clk ) begin : activation
        sumAdress <= sumForActivation_address;
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
module neuron_input49 #(
    parameter [31:0] weigths [49:0] = '{1,2,3,4,5,6,7,8,9,10,
												11,12,13,14,15,16,17,18,19,20,
												21,22,23,24,25,26,27,28,29,30,
												31,32,33,34,34,36,37,38, 39, 40, 41,
												42, 43, 44, 45, 46, 47, 48, 49, 50} //49 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [48:0],
    output reg [31:0] output_out
);

    logic [15:0] sumAdress;
    logic [31:0] afterActivation;
    integer sumForActivation = 0;

    reg [31:0] accumulate [48:0];

    reg [31:0] sum, sum0, sum1, sum2, sum3, sum4, sum5, sum6;
    wire [31:0] aux01,aux02, aux03, aux04, aux05, aux06;
    wire [31:0] aux11,aux12, aux13, aux14, aux15, aux16;
    wire [31:0] aux21,aux22, aux23, aux24, aux25, aux26;
    wire [31:0] aux31,aux32, aux33, aux34, aux35, aux36;
    wire [31:0] aux41,aux42, aux43, aux44, aux45, aux46;
    wire [31:0] aux51,aux52, aux53, aux54, aux55, aux56;
    wire [31:0] aux61,aux62, aux63, aux64, aux65, aux66;

    wire [31:0] aux_1,aux_2, aux_3, aux_4, aux_5, aux_6;
    wire [31:0] sfa;

    wire [15:0] sumForActivation_address;

    genvar i;
    generate
        for (i = 0; i<49; i++) begin : gen_multipliers
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
    fp_adder fp_adder_inst4 (.a(aux03),.b(accumulate[6]),.sum(aux05));
    fp_adder fp_adder_inst5 (.a(aux04),.b(aux05),.sum(aux06));

    fp_adder fp_adder_inst6 (.a(accumulate[7]),.b(accumulate[8]),.sum(aux11));
    fp_adder fp_adder_inst7 (.a(accumulate[9]),.b(accumulate[10]),.sum(aux12));
    fp_adder fp_adder_inst_8 (.a(accumulate[11]),.b(accumulate[12]),.sum(aux13));
    fp_adder fp_adder_inst8 (.a(aux11), .b(aux12), .sum(aux14));
    fp_adder fp_adder_inst9 (.a(aux13), .b(accumulate[13]), .sum(aux15));
    fp_adder fp_adder_inst10 (.a(aux14), .b(aux15), .sum(aux16));

    fp_adder fp_adder_inst11 (.a(accumulate[14]),.b(accumulate[15]),.sum(aux21));
    fp_adder fp_adder_inst12 (.a(accumulate[16]),.b(accumulate[17]),.sum(aux22));
    fp_adder fp_adder_inst13 (.a(accumulate[18]),.b(accumulate[19]),.sum(aux23));
    fp_adder fp_adder_inst14 (.a(aux21),.b(aux22),.sum(aux24));
    fp_adder fp_adder_inst15 (.a(aux23),.b(accumulate[20]),.sum(aux25));
    fp_adder fp_adder_inst16 (.a(aux24),.b(aux25),.sum(aux26));

    fp_adder fp_adder_inst17 (.a(accumulate[21]),.b(accumulate[22]),.sum(aux31));
    fp_adder fp_adder_inst18 (.a(accumulate[23]),.b(accumulate[24]),.sum(aux32));
    fp_adder fp_adder_inst19 (.a(accumulate[25]),.b(accumulate[26]),.sum(aux33));
    fp_adder fp_adder_inst20 (.a(aux31),.b(aux32),.sum(aux34));
    fp_adder fp_adder_inst21 (.a(aux33),.b(accumulate[27]),.sum(aux35));
    fp_adder fp_adder_inst22 (.a(aux34),.b(aux35),.sum(aux36));

    fp_adder fp_adder_inst23 (.a(accumulate[28]),.b(accumulate[29]),.sum(aux41));
    fp_adder fp_adder_inst24 (.a(accumulate[30]),.b(accumulate[31]),.sum(aux42));
    fp_adder fp_adder_inst25 (.a(accumulate[32]),.b(accumulate[33]),.sum(aux43));
    fp_adder fp_adder_inst26 (.a(aux41),.b(aux42),.sum(aux44));
    fp_adder fp_adder_inst27 (.a(aux43),.b(accumulate[34]),.sum(aux45));
    fp_adder fp_adder_inst28 (.a(aux44),.b(aux45),.sum(aux46));

    fp_adder fp_adder_inst29 (.a(accumulate[35]),.b(accumulate[36]),.sum(aux51));
    fp_adder fp_adder_inst30 (.a(accumulate[37]),.b(accumulate[38]),.sum(aux52));
    fp_adder fp_adder_inst31 (.a(accumulate[39]),.b(accumulate[40]),.sum(aux53));
    fp_adder fp_adder_inst32 (.a(aux51),.b(aux52),.sum(aux54));
    fp_adder fp_adder_inst33 (.a(aux53),.b(accumulate[41]),.sum(aux55));
    fp_adder fp_adder_inst34 (.a(aux54),.b(aux55),.sum(aux56));

    fp_adder fp_adder_inst35 (.a(accumulate[42]),.b(accumulate[43]),.sum(aux61));
    fp_adder fp_adder_inst36 (.a(accumulate[44]),.b(accumulate[45]),.sum(aux62));
    fp_adder fp_adder_inst37 (.a(accumulate[46]),.b(accumulate[47]),.sum(aux63));
    fp_adder fp_adder_inst38 (.a(aux61),.b(aux62),.sum(aux64));
    fp_adder fp_adder_inst39 (.a(aux63),.b(accumulate[48]),.sum(aux65));
    fp_adder fp_adder_inst40 (.a(aux64),.b(aux65),.sum(aux66));

    fp_adder fp_adder_inst41 (.a(sum0),.b(sum1),.sum(aux_1));
    fp_adder fp_adder_inst42 (.a(sum2),.b(sum3),.sum(aux_2));
    fp_adder fp_adder_inst43 (.a(sum4),.b(sum5),.sum(aux_3));
    fp_adder fp_adder_inst44 (.a(aux_1),.b(aux_2),.sum(aux_4));
    fp_adder fp_adder_inst45 (.a(aux_3),.b(sum6),.sum(aux_5));
    fp_adder fp_adder_inst46 (.a(aux_4),.b(aux_5),.sum(aux_6));

    fp_adder fp_adder_inst47 (.a(sum),.b(weigths[49]),.sum(sfa));
    
    always_ff @( posedge clk ) begin : acummulations
        sum0 <= aux06;
        sum1 <= aux16;
        sum2 <= aux26;
        sum3 <= aux36;
        sum4 <= aux46;
        sum5 <= aux56;
        sum6 <= aux66;
        sum <= aux_6;
        sumForActivation <= sfa;
    end

    float_to_int16 float_to_int16_inst (
        .a(sumForActivation),
        .out(sumForActivation_address),
        .clk(clk)
    );

    always_ff @( posedge clk ) begin : activation
        sumAdress <= sumForActivation;
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
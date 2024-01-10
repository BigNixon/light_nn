import my_package::*; // This is the package from config.sv

module neuron_unit (
    input logic clk,
    input logic reset,
    input logic de_in,

    input logic [55:0] line_0_in,
    input logic [55:0] line_1_in,
    input logic [55:0] line_2_in,
    input logic [55:0] line_3_in,
    input logic [55:0] line_4_in,
    input logic [55:0] line_5_in,
    input logic [55:0] line_6_in,

    output integer symbol_0,
    output integer symbol_1,
    output integer symbol_2,
    output integer symbol_3 
);
    

    genvar i, j;
    generate
        for (i=1;i<3;i++) begin : gen_layer
            
                for (j = 0; j<network_structure[i]; j++) begin : gen_neurons_within_layer
                    if (i==1) begin
                        neuron_input49  #(
                            .weigths(weigths[positions[j+1][i]-1:positions[j][i]])
                        ) neuron_input49_inst (
                            .clk(clk),
                            .input_in(connection[connectionRange[i]-1:connectionRange[i-1]]),
                            .output_out(connection[connectionRange[i]+j])
                        );
                    end else begin
                        neuron_input37  #(
                            .weigths(weigths[positions[j+1][i]-1:positions[j][i]])
                        ) neuron_input37_inst (
                            .clk(clk),
                            .input_in(connection[connectionRange[i]-1:connectionRange[i-1]]),
                            .output_out(connection[connectionRange[i]+j])
                        );
                    end
                end
        
        end
    endgenerate

    //reading data from memory into the network
    always @(posedge clk ) begin

        connection[0] <= line_0_in[55:48]; // 8 bits
        connection[1] <= line_0_in[47:40]; // 8 bits
        connection[2] <= line_0_in[39:32]; // 8 bits
        connection[3] <= line_0_in[31:24]; // 8 bits
        connection[4] <= line_0_in[23:16]; // 8 bits
        connection[5] <= line_0_in[15:8]; // 8 bits
        connection[6] <= line_0_in[7:0]; // 8 bits

        connection[7] <= line_1_in[55:48]; // 8 bits
        connection[8] <= line_1_in[47:40]; // 8 bits
        connection[9] <= line_1_in[39:32]; // 8 bits
        connection[10] <= line_1_in[31:24]; // 8 bits
        connection[11] <= line_1_in[23:16]; // 8 bits
        connection[12] <= line_1_in[15:8]; // 8 bits
        connection[13] <= line_1_in[7:0]; // 8 bits

        connection[14] <= line_2_in[55:48]; // 8 bits
        connection[15] <= line_2_in[47:40]; // 8 bits
        connection[16] <= line_2_in[39:32]; // 8 bits
        connection[17] <= line_2_in[31:24]; // 8 bits
        connection[18] <= line_2_in[23:16]; // 8 bits
        connection[19] <= line_2_in[15:8]; // 8 bits
        connection[20] <= line_2_in[7:0]; // 8 bits
        
        connection[21] <= line_3_in[55:48]; // 8 bits
        connection[22] <= line_3_in[47:40]; // 8 bits
        connection[23] <= line_3_in[39:32]; // 8 bits
        connection[24] <= line_3_in[31:24]; // 8 bits
        connection[25] <= line_3_in[23:16]; // 8 bits
        connection[26] <= line_3_in[15:8]; // 8 bits
        connection[27] <= line_3_in[7:0]; // 8 bits

        connection[28] <= line_4_in[55:48]; // 8 bits
        connection[29] <= line_4_in[47:40]; // 8 bits
        connection[30] <= line_4_in[39:32]; // 8 bits
        connection[31] <= line_4_in[31:24]; // 8 bits
        connection[32] <= line_4_in[23:16]; // 8 bits
        connection[33] <= line_4_in[15:8]; // 8 bits
        connection[34] <= line_4_in[7:0]; // 8 bits

        connection[35] <= line_5_in[55:48]; // 8 bits
        connection[36] <= line_5_in[47:40]; // 8 bits
        connection[37] <= line_5_in[39:32]; // 8 bits
        connection[38] <= line_5_in[31:24]; // 8 bits
        connection[39] <= line_5_in[23:16]; // 8 bits
        connection[40] <= line_5_in[15:8]; // 8 bits
        connection[41] <= line_5_in[7:0]; // 8 bits

        connection[42] <= line_6_in[55:48]; // 8 bits
        connection[43] <= line_6_in[47:40]; // 8 bits
        connection[44] <= line_6_in[39:32]; // 8 bits
        connection[45] <= line_6_in[31:24]; // 8 bits
        connection[46] <= line_6_in[23:16]; // 8 bits
        connection[47] <= line_6_in[15:8]; // 8 bits
        connection[48] <= line_6_in[7:0]; // 8 bits

        symbol_0 <= connection[86];
        symbol_1 <= connection[87];
        symbol_2 <= connection[88];
        symbol_3 <= connection[89];


    end

endmodule
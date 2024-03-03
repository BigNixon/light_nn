import my_package::*; // This is the package from config.sv

module neuron_unit (
    input logic clk,
    input logic reset,
    input logic de_in,

    input logic [223:0] line_0_in,
    input logic [223:0] line_1_in,
    input logic [223:0] line_2_in,
    input logic [223:0] line_3_in,
    input logic [223:0] line_4_in,
    input logic [223:0] line_5_in,
    input logic [223:0] line_6_in,
    input logic [223:0] line_7_in,
    input logic [223:0] line_8_in,
    input logic [223:0] line_9_in,
    input logic [223:0] line_10_in,
    input logic [223:0] line_11_in,
    input logic [223:0] line_12_in,
    input logic [223:0] line_13_in,
    input logic [223:0] line_14_in,
    input logic [223:0] line_15_in,
    input logic [223:0] line_16_in,
    input logic [223:0] line_17_in,
    input logic [223:0] line_18_in,
    input logic [223:0] line_19_in,
    input logic [223:0] line_20_in,
    input logic [223:0] line_21_in,
    input logic [223:0] line_22_in,
    input logic [223:0] line_23_in,
    input logic [223:0] line_24_in,
    input logic [223:0] line_25_in,
    input logic [223:0] line_26_in,
    input logic [223:0] line_27_in,

    output integer symbol_0,
    output integer symbol_1,
    output integer symbol_2,
    output integer symbol_3, 
    output integer symbol_4 ,
    output integer symbol_5 ,
    output integer symbol_6 ,
    output integer symbol_7 ,
    output integer symbol_8 ,
    output integer symbol_9 
);
    

    genvar i, j;
    generate
        for (i=1;i<4;i++) begin : gen_layer
            
                for (j = 0; j<network_structure[i]; j++) begin : gen_neurons_within_layer
                    if (i==1) begin
                        neuron_input784  #(
                            .weigths(weigths[positions[j+1][i]-1:positions[j][i]])
                        ) neuron_input784_inst (
                            .clk(clk),
                            .input_in(connection[connectionRange[i]-1:connectionRange[i-1]]),
                            .output_out(connection[connectionRange[i]+j])
                        );
                    end else if (i==2) begin
                        neuron_input128  #(
                            .weigths(weigths[positions[j+1][i]-1:positions[j][i]])
                        ) neuron_input128_inst (
                            .clk(clk),
                            .input_in(connection[connectionRange[i]-1:connectionRange[i-1]]),
                            .output_out(connection[connectionRange[i]+j])
                        );
                    end else if (i == 3) begin
                        neuron_input64  #(
                            .weigths(weigths[positions[j+1][i]-1:positions[j][i]])
                        ) neuron_input64_inst (
                            .clk(clk),
                            .input_in(connection[connectionRange[i]-1:connectionRange[i-1]]),
                            .output_out(connection[connectionRange[i]+j])
                        );
                    end
                end
        
        end
    endgenerate

    always @(posedge clk ) begin
    // row 1 of 28 pixels
    connection[0] <= line_0_in[223:216]; // 8 bits
    connection[1] <= line_0_in[215:208]; // 8 bits
    connection[2] <= line_0_in[207:200]; // 8 bits
    connection[3] <= line_0_in[199:192]; // 8 bits
    connection[4] <= line_0_in[191:184]; // 8 bits
    connection[5] <= line_0_in[183:176]; // 8 bits
    connection[6] <= line_0_in[175:168]; // 8 bits
    connection[7] <= line_0_in[167:160]; // 8 bits
    connection[8] <= line_0_in[159:152]; // 8 bits
    connection[9] <= line_0_in[151:144]; // 8 bits
    connection[10] <= line_0_in[143:136]; // 8 bits
    connection[11] <= line_0_in[135:128]; // 8 bits
    connection[12] <= line_0_in[127:120]; // 8 bits
    connection[13] <= line_0_in[119:112]; // 8 bits
    connection[14] <= line_0_in[111:104]; // 8 bits
    connection[15] <= line_0_in[103:96]; // 8 bits
    connection[16] <= line_0_in[95:88]; // 8 bits
    connection[17] <= line_0_in[87:80]; // 8 bits
    connection[18] <= line_0_in[79:72]; // 8 bits
    connection[19] <= line_0_in[71:64]; // 8 bits
    connection[20] <= line_0_in[63:56]; // 8 bits
    connection[21] <= line_0_in[55:48]; // 8 bits
    connection[22] <= line_0_in[47:40]; // 8 bits
    connection[23] <= line_0_in[39:32]; // 8 bits
    connection[24] <= line_0_in[31:24]; // 8 bits
    connection[25] <= line_0_in[23:16]; // 8 bits
    connection[26] <= line_0_in[15:8]; // 8 bits
    connection[27] <= line_0_in[7:0]; // 8 bits
    // row 2 of 28 pixels
    connection[28] <= line_1_in[223:216]; // 8 bits
    connection[29] <= line_1_in[215:208]; // 8 bits
    connection[30] <= line_1_in[207:200]; // 8 bits
    connection[31] <= line_1_in[199:192]; // 8 bits
    connection[32] <= line_1_in[191:184]; // 8 bits
    connection[33] <= line_1_in[183:176]; // 8 bits
    connection[34] <= line_1_in[175:168]; // 8 bits
    connection[35] <= line_1_in[167:160]; // 8 bits
    connection[36] <= line_1_in[159:152]; // 8 bits
    connection[37] <= line_1_in[151:144]; // 8 bits
    connection[38] <= line_1_in[143:136]; // 8 bits
    connection[39] <= line_1_in[135:128]; // 8 bits
    connection[40] <= line_1_in[127:120]; // 8 bits
    connection[41] <= line_1_in[119:112]; // 8 bits
    connection[42] <= line_1_in[111:104]; // 8 bits
    connection[43] <= line_1_in[103:96]; // 8 bits
    connection[44] <= line_1_in[95:88]; // 8 bits
    connection[45] <= line_1_in[87:80]; // 8 bits
    connection[46] <= line_1_in[79:72]; // 8 bits
    connection[47] <= line_1_in[71:64]; // 8 bits
    connection[48] <= line_1_in[63:56]; // 8 bits
    connection[49] <= line_1_in[55:48]; // 8 bits
    connection[50] <= line_1_in[47:40]; // 8 bits
    connection[51] <= line_1_in[39:32]; // 8 bits
    connection[52] <= line_1_in[31:24]; // 8 bits
    connection[53] <= line_1_in[23:16]; // 8 bits
    connection[54] <= line_1_in[15:8]; // 8 bits
    connection[55] <= line_1_in[7:0]; // 8 bits
    // row 3 of 28 pixels
    connection[56] <= line_2_in[223:216]; // 8 bits
    connection[57] <= line_2_in[215:208]; // 8 bits
    connection[58] <= line_2_in[207:200]; // 8 bits
    connection[59] <= line_2_in[199:192]; // 8 bits
    connection[60] <= line_2_in[191:184]; // 8 bits
    connection[61] <= line_2_in[183:176]; // 8 bits
    connection[62] <= line_2_in[175:168]; // 8 bits
    connection[63] <= line_2_in[167:160]; // 8 bits
    connection[64] <= line_2_in[159:152]; // 8 bits
    connection[65] <= line_2_in[151:144]; // 8 bits
    connection[66] <= line_2_in[143:136]; // 8 bits
    connection[67] <= line_2_in[135:128]; // 8 bits
    connection[68] <= line_2_in[127:120]; // 8 bits
    connection[69] <= line_2_in[119:112]; // 8 bits
    connection[70] <= line_2_in[111:104]; // 8 bits
    connection[71] <= line_2_in[103:96]; // 8 bits
    connection[72] <= line_2_in[95:88]; // 8 bits
    connection[73] <= line_2_in[87:80]; // 8 bits
    connection[74] <= line_2_in[79:72]; // 8 bits
    connection[75] <= line_2_in[71:64]; // 8 bits
    connection[76] <= line_2_in[63:56]; // 8 bits
    connection[77] <= line_2_in[55:48]; // 8 bits
    connection[78] <= line_2_in[47:40]; // 8 bits
    connection[79] <= line_2_in[39:32]; // 8 bits
    connection[80] <= line_2_in[31:24]; // 8 bits
    connection[81] <= line_2_in[23:16]; // 8 bits
    connection[82] <= line_2_in[15:8]; // 8 bits
    connection[83] <= line_2_in[7:0]; // 8 bits
    // row 4 of 28 pixels
    connection[84] <= line_3_in[223:216]; // 8 bits
    connection[85] <= line_3_in[215:208]; // 8 bits
    connection[86] <= line_3_in[207:200]; // 8 bits
    connection[87] <= line_3_in[199:192]; // 8 bits
    connection[88] <= line_3_in[191:184]; // 8 bits
    connection[89] <= line_3_in[183:176]; // 8 bits
    connection[90] <= line_3_in[175:168]; // 8 bits
    connection[91] <= line_3_in[167:160]; // 8 bits
    connection[92] <= line_3_in[159:152]; // 8 bits
    connection[93] <= line_3_in[151:144]; // 8 bits
    connection[94] <= line_3_in[143:136]; // 8 bits
    connection[95] <= line_3_in[135:128]; // 8 bits
    connection[96] <= line_3_in[127:120]; // 8 bits
    connection[97] <= line_3_in[119:112]; // 8 bits
    connection[98] <= line_3_in[111:104]; // 8 bits
    connection[99] <= line_3_in[103:96]; // 8 bits
    connection[100] <= line_3_in[95:88]; // 8 bits
    connection[101] <= line_3_in[87:80]; // 8 bits
    connection[102] <= line_3_in[79:72]; // 8 bits
    connection[103] <= line_3_in[71:64]; // 8 bits
    connection[104] <= line_3_in[63:56]; // 8 bits
    connection[105] <= line_3_in[55:48]; // 8 bits
    connection[106] <= line_3_in[47:40]; // 8 bits
    connection[107] <= line_3_in[39:32]; // 8 bits
    connection[108] <= line_3_in[31:24]; // 8 bits
    connection[109] <= line_3_in[23:16]; // 8 bits
    connection[110] <= line_3_in[15:8]; // 8 bits
    connection[111] <= line_3_in[7:0]; // 8 bits
    // row 5 of 28 pixels
    connection[112] <= line_4_in[223:216]; // 8 bits
    connection[113] <= line_4_in[215:208]; // 8 bits
    connection[114] <= line_4_in[207:200]; // 8 bits
    connection[115] <= line_4_in[199:192]; // 8 bits
    connection[116] <= line_4_in[191:184]; // 8 bits
    connection[117] <= line_4_in[183:176]; // 8 bits
    connection[118] <= line_4_in[175:168]; // 8 bits
    connection[119] <= line_4_in[167:160]; // 8 bits
    connection[120] <= line_4_in[159:152]; // 8 bits
    connection[121] <= line_4_in[151:144]; // 8 bits
    connection[122] <= line_4_in[143:136]; // 8 bits
    connection[123] <= line_4_in[135:128]; // 8 bits
    connection[124] <= line_4_in[127:120]; // 8 bits
    connection[125] <= line_4_in[119:112]; // 8 bits
    connection[126] <= line_4_in[111:104]; // 8 bits
    connection[127] <= line_4_in[103:96]; // 8 bits
    connection[128] <= line_4_in[95:88]; // 8 bits
    connection[129] <= line_4_in[87:80]; // 8 bits
    connection[130] <= line_4_in[79:72]; // 8 bits
    connection[131] <= line_4_in[71:64]; // 8 bits
    connection[132] <= line_4_in[63:56]; // 8 bits
    connection[133] <= line_4_in[55:48]; // 8 bits
    connection[134] <= line_4_in[47:40]; // 8 bits
    connection[135] <= line_4_in[39:32]; // 8 bits
    connection[136] <= line_4_in[31:24]; // 8 bits
    connection[137] <= line_4_in[23:16]; // 8 bits
    connection[138] <= line_4_in[15:8]; // 8 bits
    connection[139] <= line_4_in[7:0]; // 8 bits
    // row 6 of 28 pixels
    connection[140] <= line_5_in[223:216]; // 8 bits
    connection[141] <= line_5_in[215:208]; // 8 bits
    connection[142] <= line_5_in[207:200]; // 8 bits
    connection[143] <= line_5_in[199:192]; // 8 bits
    connection[144] <= line_5_in[191:184]; // 8 bits
    connection[145] <= line_5_in[183:176]; // 8 bits
    connection[146] <= line_5_in[175:168]; // 8 bits
    connection[147] <= line_5_in[167:160]; // 8 bits
    connection[148] <= line_5_in[159:152]; // 8 bits
    connection[149] <= line_5_in[151:144]; // 8 bits
    connection[150] <= line_5_in[143:136]; // 8 bits
    connection[151] <= line_5_in[135:128]; // 8 bits
    connection[152] <= line_5_in[127:120]; // 8 bits
    connection[153] <= line_5_in[119:112]; // 8 bits
    connection[154] <= line_5_in[111:104]; // 8 bits
    connection[155] <= line_5_in[103:96]; // 8 bits
    connection[156] <= line_5_in[95:88]; // 8 bits
    connection[157] <= line_5_in[87:80]; // 8 bits
    connection[158] <= line_5_in[79:72]; // 8 bits
    connection[159] <= line_5_in[71:64]; // 8 bits
    connection[160] <= line_5_in[63:56]; // 8 bits
    connection[161] <= line_5_in[55:48]; // 8 bits
    connection[162] <= line_5_in[47:40]; // 8 bits
    connection[163] <= line_5_in[39:32]; // 8 bits
    connection[164] <= line_5_in[31:24]; // 8 bits
    connection[165] <= line_5_in[23:16]; // 8 bits
    connection[166] <= line_5_in[15:8]; // 8 bits
    connection[167] <= line_5_in[7:0]; // 8 bits
    // row 7 of 28 pixels
    connection[168] <= line_6_in[223:216]; // 8 bits
    connection[169] <= line_6_in[215:208]; // 8 bits
    connection[170] <= line_6_in[207:200]; // 8 bits
    connection[171] <= line_6_in[199:192]; // 8 bits
    connection[172] <= line_6_in[191:184]; // 8 bits
    connection[173] <= line_6_in[183:176]; // 8 bits
    connection[174] <= line_6_in[175:168]; // 8 bits
    connection[175] <= line_6_in[167:160]; // 8 bits
    connection[176] <= line_6_in[159:152]; // 8 bits
    connection[177] <= line_6_in[151:144]; // 8 bits
    connection[178] <= line_6_in[143:136]; // 8 bits
    connection[179] <= line_6_in[135:128]; // 8 bits
    connection[180] <= line_6_in[127:120]; // 8 bits
    connection[181] <= line_6_in[119:112]; // 8 bits
    connection[182] <= line_6_in[111:104]; // 8 bits
    connection[183] <= line_6_in[103:96]; // 8 bits
    connection[184] <= line_6_in[95:88]; // 8 bits
    connection[185] <= line_6_in[87:80]; // 8 bits
    connection[186] <= line_6_in[79:72]; // 8 bits
    connection[187] <= line_6_in[71:64]; // 8 bits
    connection[188] <= line_6_in[63:56]; // 8 bits
    connection[189] <= line_6_in[55:48]; // 8 bits
    connection[190] <= line_6_in[47:40]; // 8 bits
    connection[191] <= line_6_in[39:32]; // 8 bits
    connection[192] <= line_6_in[31:24]; // 8 bits
    connection[193] <= line_6_in[23:16]; // 8 bits
    connection[194] <= line_6_in[15:8]; // 8 bits
    connection[195] <= line_6_in[7:0]; // 8 bits
    // row 8 of 28 pixels
    connection[196] <= line_7_in[223:216]; // 8 bits
    connection[197] <= line_7_in[215:208]; // 8 bits
    connection[198] <= line_7_in[207:200]; // 8 bits
    connection[199] <= line_7_in[199:192]; // 8 bits
    connection[200] <= line_7_in[191:184]; // 8 bits
    connection[201] <= line_7_in[183:176]; // 8 bits
    connection[202] <= line_7_in[175:168]; // 8 bits
    connection[203] <= line_7_in[167:160]; // 8 bits
    connection[204] <= line_7_in[159:152]; // 8 bits
    connection[205] <= line_7_in[151:144]; // 8 bits
    connection[206] <= line_7_in[143:136]; // 8 bits
    connection[207] <= line_7_in[135:128]; // 8 bits
    connection[208] <= line_7_in[127:120]; // 8 bits
    connection[209] <= line_7_in[119:112]; // 8 bits
    connection[210] <= line_7_in[111:104]; // 8 bits
    connection[211] <= line_7_in[103:96]; // 8 bits
    connection[212] <= line_7_in[95:88]; // 8 bits
    connection[213] <= line_7_in[87:80]; // 8 bits
    connection[214] <= line_7_in[79:72]; // 8 bits
    connection[215] <= line_7_in[71:64]; // 8 bits
    connection[216] <= line_7_in[63:56]; // 8 bits
    connection[217] <= line_7_in[55:48]; // 8 bits
    connection[218] <= line_7_in[47:40]; // 8 bits
    connection[219] <= line_7_in[39:32]; // 8 bits
    connection[220] <= line_7_in[31:24]; // 8 bits
    connection[221] <= line_7_in[23:16]; // 8 bits
    connection[222] <= line_7_in[15:8]; // 8 bits
    connection[223] <= line_7_in[7:0]; // 8 bits
    // row 9 of 28 pixels
    connection[224] <= line_8_in[223:216]; // 8 bits
    connection[225] <= line_8_in[215:208]; // 8 bits
    connection[226] <= line_8_in[207:200]; // 8 bits
    connection[227] <= line_8_in[199:192]; // 8 bits
    connection[228] <= line_8_in[191:184]; // 8 bits
    connection[229] <= line_8_in[183:176]; // 8 bits
    connection[230] <= line_8_in[175:168]; // 8 bits
    connection[231] <= line_8_in[167:160]; // 8 bits
    connection[232] <= line_8_in[159:152]; // 8 bits
    connection[233] <= line_8_in[151:144]; // 8 bits
    connection[234] <= line_8_in[143:136]; // 8 bits
    connection[235] <= line_8_in[135:128]; // 8 bits
    connection[236] <= line_8_in[127:120]; // 8 bits
    connection[237] <= line_8_in[119:112]; // 8 bits
    connection[238] <= line_8_in[111:104]; // 8 bits
    connection[239] <= line_8_in[103:96]; // 8 bits
    connection[240] <= line_8_in[95:88]; // 8 bits
    connection[241] <= line_8_in[87:80]; // 8 bits
    connection[242] <= line_8_in[79:72]; // 8 bits
    connection[243] <= line_8_in[71:64]; // 8 bits
    connection[244] <= line_8_in[63:56]; // 8 bits
    connection[245] <= line_8_in[55:48]; // 8 bits
    connection[246] <= line_8_in[47:40]; // 8 bits
    connection[247] <= line_8_in[39:32]; // 8 bits
    connection[248] <= line_8_in[31:24]; // 8 bits
    connection[249] <= line_8_in[23:16]; // 8 bits
    connection[250] <= line_8_in[15:8]; // 8 bits
    connection[251] <= line_8_in[7:0]; // 8 bits
    // row 10 of 28 pixels
    connection[252] <= line_9_in[223:216]; // 8 bits
    connection[253] <= line_9_in[215:208]; // 8 bits
    connection[254] <= line_9_in[207:200]; // 8 bits
    connection[255] <= line_9_in[199:192]; // 8 bits
    connection[256] <= line_9_in[191:184]; // 8 bits
    connection[257] <= line_9_in[183:176]; // 8 bits
    connection[258] <= line_9_in[175:168]; // 8 bits
    connection[259] <= line_9_in[167:160]; // 8 bits
    connection[260] <= line_9_in[159:152]; // 8 bits
    connection[261] <= line_9_in[151:144]; // 8 bits
    connection[262] <= line_9_in[143:136]; // 8 bits
    connection[263] <= line_9_in[135:128]; // 8 bits
    connection[264] <= line_9_in[127:120]; // 8 bits
    connection[265] <= line_9_in[119:112]; // 8 bits
    connection[266] <= line_9_in[111:104]; // 8 bits
    connection[267] <= line_9_in[103:96]; // 8 bits
    connection[268] <= line_9_in[95:88]; // 8 bits
    connection[269] <= line_9_in[87:80]; // 8 bits
    connection[270] <= line_9_in[79:72]; // 8 bits
    connection[271] <= line_9_in[71:64]; // 8 bits
    connection[272] <= line_9_in[63:56]; // 8 bits
    connection[273] <= line_9_in[55:48]; // 8 bits
    connection[274] <= line_9_in[47:40]; // 8 bits
    connection[275] <= line_9_in[39:32]; // 8 bits
    connection[276] <= line_9_in[31:24]; // 8 bits
    connection[277] <= line_9_in[23:16]; // 8 bits
    connection[278] <= line_9_in[15:8]; // 8 bits
    connection[279] <= line_9_in[7:0]; // 8 bits
    // row 11 of 28 pixels
    connection[280] <= line_10_in[223:216]; // 8 bits
    connection[281] <= line_10_in[215:208]; // 8 bits
    connection[282] <= line_10_in[207:200]; // 8 bits
    connection[283] <= line_10_in[199:192]; // 8 bits
    connection[284] <= line_10_in[191:184]; // 8 bits
    connection[285] <= line_10_in[183:176]; // 8 bits
    connection[286] <= line_10_in[175:168]; // 8 bits
    connection[287] <= line_10_in[167:160]; // 8 bits
    connection[288] <= line_10_in[159:152]; // 8 bits
    connection[289] <= line_10_in[151:144]; // 8 bits
    connection[290] <= line_10_in[143:136]; // 8 bits
    connection[291] <= line_10_in[135:128]; // 8 bits
    connection[292] <= line_10_in[127:120]; // 8 bits
    connection[293] <= line_10_in[119:112]; // 8 bits
    connection[294] <= line_10_in[111:104]; // 8 bits
    connection[295] <= line_10_in[103:96]; // 8 bits
    connection[296] <= line_10_in[95:88]; // 8 bits
    connection[297] <= line_10_in[87:80]; // 8 bits
    connection[298] <= line_10_in[79:72]; // 8 bits
    connection[299] <= line_10_in[71:64]; // 8 bits
    connection[300] <= line_10_in[63:56]; // 8 bits
    connection[301] <= line_10_in[55:48]; // 8 bits
    connection[302] <= line_10_in[47:40]; // 8 bits
    connection[303] <= line_10_in[39:32]; // 8 bits
    connection[304] <= line_10_in[31:24]; // 8 bits
    connection[305] <= line_10_in[23:16]; // 8 bits
    connection[306] <= line_10_in[15:8]; // 8 bits
    connection[307] <= line_10_in[7:0]; // 8 bits
    // row 12 of 28 pixels
    connection[308] <= line_11_in[223:216]; // 8 bits
    connection[309] <= line_11_in[215:208]; // 8 bits
    connection[310] <= line_11_in[207:200]; // 8 bits
    connection[311] <= line_11_in[199:192]; // 8 bits
    connection[312] <= line_11_in[191:184]; // 8 bits
    connection[313] <= line_11_in[183:176]; // 8 bits
    connection[314] <= line_11_in[175:168]; // 8 bits
    connection[315] <= line_11_in[167:160]; // 8 bits
    connection[316] <= line_11_in[159:152]; // 8 bits
    connection[317] <= line_11_in[151:144]; // 8 bits
    connection[318] <= line_11_in[143:136]; // 8 bits
    connection[319] <= line_11_in[135:128]; // 8 bits
    connection[320] <= line_11_in[127:120]; // 8 bits
    connection[321] <= line_11_in[119:112]; // 8 bits
    connection[322] <= line_11_in[111:104]; // 8 bits
    connection[323] <= line_11_in[103:96]; // 8 bits
    connection[324] <= line_11_in[95:88]; // 8 bits
    connection[325] <= line_11_in[87:80]; // 8 bits
    connection[326] <= line_11_in[79:72]; // 8 bits
    connection[327] <= line_11_in[71:64]; // 8 bits
    connection[328] <= line_11_in[63:56]; // 8 bits
    connection[329] <= line_11_in[55:48]; // 8 bits
    connection[330] <= line_11_in[47:40]; // 8 bits
    connection[331] <= line_11_in[39:32]; // 8 bits
    connection[332] <= line_11_in[31:24]; // 8 bits
    connection[333] <= line_11_in[23:16]; // 8 bits
    connection[334] <= line_11_in[15:8]; // 8 bits
    connection[335] <= line_11_in[7:0]; // 8 bits
    // row 13 of 28 pixels
    connection[336] <= line_12_in[223:216]; // 8 bits
    connection[337] <= line_12_in[215:208]; // 8 bits
    connection[338] <= line_12_in[207:200]; // 8 bits
    connection[339] <= line_12_in[199:192]; // 8 bits
    connection[340] <= line_12_in[191:184]; // 8 bits
    connection[341] <= line_12_in[183:176]; // 8 bits
    connection[342] <= line_12_in[175:168]; // 8 bits
    connection[343] <= line_12_in[167:160]; // 8 bits
    connection[344] <= line_12_in[159:152]; // 8 bits
    connection[345] <= line_12_in[151:144]; // 8 bits
    connection[346] <= line_12_in[143:136]; // 8 bits
    connection[347] <= line_12_in[135:128]; // 8 bits
    connection[348] <= line_12_in[127:120]; // 8 bits
    connection[349] <= line_12_in[119:112]; // 8 bits
    connection[350] <= line_12_in[111:104]; // 8 bits
    connection[351] <= line_12_in[103:96]; // 8 bits
    connection[352] <= line_12_in[95:88]; // 8 bits
    connection[353] <= line_12_in[87:80]; // 8 bits
    connection[354] <= line_12_in[79:72]; // 8 bits
    connection[355] <= line_12_in[71:64]; // 8 bits
    connection[356] <= line_12_in[63:56]; // 8 bits
    connection[357] <= line_12_in[55:48]; // 8 bits
    connection[358] <= line_12_in[47:40]; // 8 bits
    connection[359] <= line_12_in[39:32]; // 8 bits
    connection[360] <= line_12_in[31:24]; // 8 bits
    connection[361] <= line_12_in[23:16]; // 8 bits
    connection[362] <= line_12_in[15:8]; // 8 bits
    connection[363] <= line_12_in[7:0]; // 8 bits
    // row 14 of 28 pixels
    connection[364] <= line_13_in[223:216]; // 8 bits
    connection[365] <= line_13_in[215:208]; // 8 bits
    connection[366] <= line_13_in[207:200]; // 8 bits
    connection[367] <= line_13_in[199:192]; // 8 bits
    connection[368] <= line_13_in[191:184]; // 8 bits
    connection[369] <= line_13_in[183:176]; // 8 bits
    connection[370] <= line_13_in[175:168]; // 8 bits
    connection[371] <= line_13_in[167:160]; // 8 bits
    connection[372] <= line_13_in[159:152]; // 8 bits
    connection[373] <= line_13_in[151:144]; // 8 bits
    connection[374] <= line_13_in[143:136]; // 8 bits
    connection[375] <= line_13_in[135:128]; // 8 bits
    connection[376] <= line_13_in[127:120]; // 8 bits
    connection[377] <= line_13_in[119:112]; // 8 bits
    connection[378] <= line_13_in[111:104]; // 8 bits
    connection[379] <= line_13_in[103:96]; // 8 bits
    connection[380] <= line_13_in[95:88]; // 8 bits
    connection[381] <= line_13_in[87:80]; // 8 bits
    connection[382] <= line_13_in[79:72]; // 8 bits
    connection[383] <= line_13_in[71:64]; // 8 bits
    connection[384] <= line_13_in[63:56]; // 8 bits
    connection[385] <= line_13_in[55:48]; // 8 bits
    connection[386] <= line_13_in[47:40]; // 8 bits
    connection[387] <= line_13_in[39:32]; // 8 bits
    connection[388] <= line_13_in[31:24]; // 8 bits
    connection[389] <= line_13_in[23:16]; // 8 bits
    connection[390] <= line_13_in[15:8]; // 8 bits
    connection[391] <= line_13_in[7:0]; // 8 bits
    // row 15 of 28 pixels
    connection[392] <= line_14_in[223:216]; // 8 bits
    connection[393] <= line_14_in[215:208]; // 8 bits
    connection[394] <= line_14_in[207:200]; // 8 bits
    connection[395] <= line_14_in[199:192]; // 8 bits
    connection[396] <= line_14_in[191:184]; // 8 bits
    connection[397] <= line_14_in[183:176]; // 8 bits
    connection[398] <= line_14_in[175:168]; // 8 bits
    connection[399] <= line_14_in[167:160]; // 8 bits
    connection[400] <= line_14_in[159:152]; // 8 bits
    connection[401] <= line_14_in[151:144]; // 8 bits
    connection[402] <= line_14_in[143:136]; // 8 bits
    connection[403] <= line_14_in[135:128]; // 8 bits
    connection[404] <= line_14_in[127:120]; // 8 bits
    connection[405] <= line_14_in[119:112]; // 8 bits
    connection[406] <= line_14_in[111:104]; // 8 bits
    connection[407] <= line_14_in[103:96]; // 8 bits
    connection[408] <= line_14_in[95:88]; // 8 bits
    connection[409] <= line_14_in[87:80]; // 8 bits
    connection[410] <= line_14_in[79:72]; // 8 bits
    connection[411] <= line_14_in[71:64]; // 8 bits
    connection[412] <= line_14_in[63:56]; // 8 bits
    connection[413] <= line_14_in[55:48]; // 8 bits
    connection[414] <= line_14_in[47:40]; // 8 bits
    connection[415] <= line_14_in[39:32]; // 8 bits
    connection[416] <= line_14_in[31:24]; // 8 bits
    connection[417] <= line_14_in[23:16]; // 8 bits
    connection[418] <= line_14_in[15:8]; // 8 bits
    connection[419] <= line_14_in[7:0]; // 8 bits
    // row 16 of 28 pixels
    connection[420] <= line_15_in[223:216]; // 8 bits
    connection[421] <= line_15_in[215:208]; // 8 bits
    connection[422] <= line_15_in[207:200]; // 8 bits
    connection[423] <= line_15_in[199:192]; // 8 bits
    connection[424] <= line_15_in[191:184]; // 8 bits
    connection[425] <= line_15_in[183:176]; // 8 bits
    connection[426] <= line_15_in[175:168]; // 8 bits
    connection[427] <= line_15_in[167:160]; // 8 bits
    connection[428] <= line_15_in[159:152]; // 8 bits
    connection[429] <= line_15_in[151:144]; // 8 bits
    connection[430] <= line_15_in[143:136]; // 8 bits
    connection[431] <= line_15_in[135:128]; // 8 bits
    connection[432] <= line_15_in[127:120]; // 8 bits
    connection[433] <= line_15_in[119:112]; // 8 bits
    connection[434] <= line_15_in[111:104]; // 8 bits
    connection[435] <= line_15_in[103:96]; // 8 bits
    connection[436] <= line_15_in[95:88]; // 8 bits
    connection[437] <= line_15_in[87:80]; // 8 bits
    connection[438] <= line_15_in[79:72]; // 8 bits
    connection[439] <= line_15_in[71:64]; // 8 bits
    connection[440] <= line_15_in[63:56]; // 8 bits
    connection[441] <= line_15_in[55:48]; // 8 bits
    connection[442] <= line_15_in[47:40]; // 8 bits
    connection[443] <= line_15_in[39:32]; // 8 bits
    connection[444] <= line_15_in[31:24]; // 8 bits
    connection[445] <= line_15_in[23:16]; // 8 bits
    connection[446] <= line_15_in[15:8]; // 8 bits
    connection[447] <= line_15_in[7:0]; // 8 bits
    // row 17 of 28 pixels
    connection[448] <= line_16_in[223:216]; // 8 bits
    connection[449] <= line_16_in[215:208]; // 8 bits
    connection[450] <= line_16_in[207:200]; // 8 bits
    connection[451] <= line_16_in[199:192]; // 8 bits
    connection[452] <= line_16_in[191:184]; // 8 bits
    connection[453] <= line_16_in[183:176]; // 8 bits
    connection[454] <= line_16_in[175:168]; // 8 bits
    connection[455] <= line_16_in[167:160]; // 8 bits
    connection[456] <= line_16_in[159:152]; // 8 bits
    connection[457] <= line_16_in[151:144]; // 8 bits
    connection[458] <= line_16_in[143:136]; // 8 bits
    connection[459] <= line_16_in[135:128]; // 8 bits
    connection[460] <= line_16_in[127:120]; // 8 bits
    connection[461] <= line_16_in[119:112]; // 8 bits
    connection[462] <= line_16_in[111:104]; // 8 bits
    connection[463] <= line_16_in[103:96]; // 8 bits
    connection[464] <= line_16_in[95:88]; // 8 bits
    connection[465] <= line_16_in[87:80]; // 8 bits
    connection[466] <= line_16_in[79:72]; // 8 bits
    connection[467] <= line_16_in[71:64]; // 8 bits
    connection[468] <= line_16_in[63:56]; // 8 bits
    connection[469] <= line_16_in[55:48]; // 8 bits
    connection[470] <= line_16_in[47:40]; // 8 bits
    connection[471] <= line_16_in[39:32]; // 8 bits
    connection[472] <= line_16_in[31:24]; // 8 bits
    connection[473] <= line_16_in[23:16]; // 8 bits
    connection[474] <= line_16_in[15:8]; // 8 bits
    connection[475] <= line_16_in[7:0]; // 8 bits
    // row 18 of 28 pixels
    connection[476] <= line_17_in[223:216]; // 8 bits
    connection[477] <= line_17_in[215:208]; // 8 bits
    connection[478] <= line_17_in[207:200]; // 8 bits
    connection[479] <= line_17_in[199:192]; // 8 bits
    connection[480] <= line_17_in[191:184]; // 8 bits
    connection[481] <= line_17_in[183:176]; // 8 bits
    connection[482] <= line_17_in[175:168]; // 8 bits
    connection[483] <= line_17_in[167:160]; // 8 bits
    connection[484] <= line_17_in[159:152]; // 8 bits
    connection[485] <= line_17_in[151:144]; // 8 bits
    connection[486] <= line_17_in[143:136]; // 8 bits
    connection[487] <= line_17_in[135:128]; // 8 bits
    connection[488] <= line_17_in[127:120]; // 8 bits
    connection[489] <= line_17_in[119:112]; // 8 bits
    connection[490] <= line_17_in[111:104]; // 8 bits
    connection[491] <= line_17_in[103:96]; // 8 bits
    connection[492] <= line_17_in[95:88]; // 8 bits
    connection[493] <= line_17_in[87:80]; // 8 bits
    connection[494] <= line_17_in[79:72]; // 8 bits
    connection[495] <= line_17_in[71:64]; // 8 bits
    connection[496] <= line_17_in[63:56]; // 8 bits
    connection[497] <= line_17_in[55:48]; // 8 bits
    connection[498] <= line_17_in[47:40]; // 8 bits
    connection[499] <= line_17_in[39:32]; // 8 bits
    connection[500] <= line_17_in[31:24]; // 8 bits
    connection[501] <= line_17_in[23:16]; // 8 bits
    connection[502] <= line_17_in[15:8]; // 8 bits
    connection[503] <= line_17_in[7:0]; // 8 bits
    // row 19 of 28 pixels
    connection[504] <= line_18_in[223:216]; // 8 bits
    connection[505] <= line_18_in[215:208]; // 8 bits
    connection[506] <= line_18_in[207:200]; // 8 bits
    connection[507] <= line_18_in[199:192]; // 8 bits
    connection[508] <= line_18_in[191:184]; // 8 bits
    connection[509] <= line_18_in[183:176]; // 8 bits
    connection[510] <= line_18_in[175:168]; // 8 bits
    connection[511] <= line_18_in[167:160]; // 8 bits
    connection[512] <= line_18_in[159:152]; // 8 bits
    connection[513] <= line_18_in[151:144]; // 8 bits
    connection[514] <= line_18_in[143:136]; // 8 bits
    connection[515] <= line_18_in[135:128]; // 8 bits
    connection[516] <= line_18_in[127:120]; // 8 bits
    connection[517] <= line_18_in[119:112]; // 8 bits
    connection[518] <= line_18_in[111:104]; // 8 bits
    connection[519] <= line_18_in[103:96]; // 8 bits
    connection[520] <= line_18_in[95:88]; // 8 bits
    connection[521] <= line_18_in[87:80]; // 8 bits
    connection[522] <= line_18_in[79:72]; // 8 bits
    connection[523] <= line_18_in[71:64]; // 8 bits
    connection[524] <= line_18_in[63:56]; // 8 bits
    connection[525] <= line_18_in[55:48]; // 8 bits
    connection[526] <= line_18_in[47:40]; // 8 bits
    connection[527] <= line_18_in[39:32]; // 8 bits
    connection[528] <= line_18_in[31:24]; // 8 bits
    connection[529] <= line_18_in[23:16]; // 8 bits
    connection[530] <= line_18_in[15:8]; // 8 bits
    connection[531] <= line_18_in[7:0]; // 8 bits
    // row 20 of 28 pixels
    connection[532] <= line_19_in[223:216]; // 8 bits
    connection[533] <= line_19_in[215:208]; // 8 bits
    connection[534] <= line_19_in[207:200]; // 8 bits
    connection[535] <= line_19_in[199:192]; // 8 bits
    connection[536] <= line_19_in[191:184]; // 8 bits
    connection[537] <= line_19_in[183:176]; // 8 bits
    connection[538] <= line_19_in[175:168]; // 8 bits
    connection[539] <= line_19_in[167:160]; // 8 bits
    connection[540] <= line_19_in[159:152]; // 8 bits
    connection[541] <= line_19_in[151:144]; // 8 bits
    connection[542] <= line_19_in[143:136]; // 8 bits
    connection[543] <= line_19_in[135:128]; // 8 bits
    connection[544] <= line_19_in[127:120]; // 8 bits
    connection[545] <= line_19_in[119:112]; // 8 bits
    connection[546] <= line_19_in[111:104]; // 8 bits
    connection[547] <= line_19_in[103:96]; // 8 bits
    connection[548] <= line_19_in[95:88]; // 8 bits
    connection[549] <= line_19_in[87:80]; // 8 bits
    connection[550] <= line_19_in[79:72]; // 8 bits
    connection[551] <= line_19_in[71:64]; // 8 bits
    connection[552] <= line_19_in[63:56]; // 8 bits
    connection[553] <= line_19_in[55:48]; // 8 bits
    connection[554] <= line_19_in[47:40]; // 8 bits
    connection[555] <= line_19_in[39:32]; // 8 bits
    connection[556] <= line_19_in[31:24]; // 8 bits
    connection[557] <= line_19_in[23:16]; // 8 bits
    connection[558] <= line_19_in[15:8]; // 8 bits
    connection[559] <= line_19_in[7:0]; // 8 bits
    // row 21 of 28 pixels
    connection[560] <= line_20_in[223:216]; // 8 bits
    connection[561] <= line_20_in[215:208]; // 8 bits
    connection[562] <= line_20_in[207:200]; // 8 bits
    connection[563] <= line_20_in[199:192]; // 8 bits
    connection[564] <= line_20_in[191:184]; // 8 bits
    connection[565] <= line_20_in[183:176]; // 8 bits
    connection[566] <= line_20_in[175:168]; // 8 bits
    connection[567] <= line_20_in[167:160]; // 8 bits
    connection[568] <= line_20_in[159:152]; // 8 bits
    connection[569] <= line_20_in[151:144]; // 8 bits
    connection[570] <= line_20_in[143:136]; // 8 bits
    connection[571] <= line_20_in[135:128]; // 8 bits
    connection[572] <= line_20_in[127:120]; // 8 bits
    connection[573] <= line_20_in[119:112]; // 8 bits
    connection[574] <= line_20_in[111:104]; // 8 bits
    connection[575] <= line_20_in[103:96]; // 8 bits
    connection[576] <= line_20_in[95:88]; // 8 bits
    connection[577] <= line_20_in[87:80]; // 8 bits
    connection[578] <= line_20_in[79:72]; // 8 bits
    connection[579] <= line_20_in[71:64]; // 8 bits
    connection[580] <= line_20_in[63:56]; // 8 bits
    connection[581] <= line_20_in[55:48]; // 8 bits
    connection[582] <= line_20_in[47:40]; // 8 bits
    connection[583] <= line_20_in[39:32]; // 8 bits
    connection[584] <= line_20_in[31:24]; // 8 bits
    connection[585] <= line_20_in[23:16]; // 8 bits
    connection[586] <= line_20_in[15:8]; // 8 bits
    connection[587] <= line_20_in[7:0]; // 8 bits
    // row 22 of 28 pixels
    connection[588] <= line_21_in[223:216]; // 8 bits
    connection[589] <= line_21_in[215:208]; // 8 bits
    connection[590] <= line_21_in[207:200]; // 8 bits
    connection[591] <= line_21_in[199:192]; // 8 bits
    connection[592] <= line_21_in[191:184]; // 8 bits
    connection[593] <= line_21_in[183:176]; // 8 bits
    connection[594] <= line_21_in[175:168]; // 8 bits
    connection[595] <= line_21_in[167:160]; // 8 bits
    connection[596] <= line_21_in[159:152]; // 8 bits
    connection[597] <= line_21_in[151:144]; // 8 bits
    connection[598] <= line_21_in[143:136]; // 8 bits
    connection[599] <= line_21_in[135:128]; // 8 bits
    connection[600] <= line_21_in[127:120]; // 8 bits
    connection[601] <= line_21_in[119:112]; // 8 bits
    connection[602] <= line_21_in[111:104]; // 8 bits
    connection[603] <= line_21_in[103:96]; // 8 bits
    connection[604] <= line_21_in[95:88]; // 8 bits
    connection[605] <= line_21_in[87:80]; // 8 bits
    connection[606] <= line_21_in[79:72]; // 8 bits
    connection[607] <= line_21_in[71:64]; // 8 bits
    connection[608] <= line_21_in[63:56]; // 8 bits
    connection[609] <= line_21_in[55:48]; // 8 bits
    connection[610] <= line_21_in[47:40]; // 8 bits
    connection[611] <= line_21_in[39:32]; // 8 bits
    connection[612] <= line_21_in[31:24]; // 8 bits
    connection[613] <= line_21_in[23:16]; // 8 bits
    connection[614] <= line_21_in[15:8]; // 8 bits
    connection[615] <= line_21_in[7:0]; // 8 bits
    // row 23 of 28 pixels
    connection[616] <= line_22_in[223:216]; // 8 bits
    connection[617] <= line_22_in[215:208]; // 8 bits
    connection[618] <= line_22_in[207:200]; // 8 bits
    connection[619] <= line_22_in[199:192]; // 8 bits
    connection[620] <= line_22_in[191:184]; // 8 bits
    connection[621] <= line_22_in[183:176]; // 8 bits
    connection[622] <= line_22_in[175:168]; // 8 bits
    connection[623] <= line_22_in[167:160]; // 8 bits
    connection[624] <= line_22_in[159:152]; // 8 bits
    connection[625] <= line_22_in[151:144]; // 8 bits
    connection[626] <= line_22_in[143:136]; // 8 bits
    connection[627] <= line_22_in[135:128]; // 8 bits
    connection[628] <= line_22_in[127:120]; // 8 bits
    connection[629] <= line_22_in[119:112]; // 8 bits
    connection[630] <= line_22_in[111:104]; // 8 bits
    connection[631] <= line_22_in[103:96]; // 8 bits
    connection[632] <= line_22_in[95:88]; // 8 bits
    connection[633] <= line_22_in[87:80]; // 8 bits
    connection[634] <= line_22_in[79:72]; // 8 bits
    connection[635] <= line_22_in[71:64]; // 8 bits
    connection[636] <= line_22_in[63:56]; // 8 bits
    connection[637] <= line_22_in[55:48]; // 8 bits
    connection[638] <= line_22_in[47:40]; // 8 bits
    connection[639] <= line_22_in[39:32]; // 8 bits
    connection[640] <= line_22_in[31:24]; // 8 bits
    connection[641] <= line_22_in[23:16]; // 8 bits
    connection[642] <= line_22_in[15:8]; // 8 bits
    connection[643] <= line_22_in[7:0]; // 8 bits
    // row 24 of 28 pixels
    connection[644] <= line_23_in[223:216]; // 8 bits
    connection[645] <= line_23_in[215:208]; // 8 bits
    connection[646] <= line_23_in[207:200]; // 8 bits
    connection[647] <= line_23_in[199:192]; // 8 bits
    connection[648] <= line_23_in[191:184]; // 8 bits
    connection[649] <= line_23_in[183:176]; // 8 bits
    connection[650] <= line_23_in[175:168]; // 8 bits
    connection[651] <= line_23_in[167:160]; // 8 bits
    connection[652] <= line_23_in[159:152]; // 8 bits
    connection[653] <= line_23_in[151:144]; // 8 bits
    connection[654] <= line_23_in[143:136]; // 8 bits
    connection[655] <= line_23_in[135:128]; // 8 bits
    connection[656] <= line_23_in[127:120]; // 8 bits
    connection[657] <= line_23_in[119:112]; // 8 bits
    connection[658] <= line_23_in[111:104]; // 8 bits
    connection[659] <= line_23_in[103:96]; // 8 bits
    connection[660] <= line_23_in[95:88]; // 8 bits
    connection[661] <= line_23_in[87:80]; // 8 bits
    connection[662] <= line_23_in[79:72]; // 8 bits
    connection[663] <= line_23_in[71:64]; // 8 bits
    connection[664] <= line_23_in[63:56]; // 8 bits
    connection[665] <= line_23_in[55:48]; // 8 bits
    connection[666] <= line_23_in[47:40]; // 8 bits
    connection[667] <= line_23_in[39:32]; // 8 bits
    connection[668] <= line_23_in[31:24]; // 8 bits
    connection[669] <= line_23_in[23:16]; // 8 bits
    connection[670] <= line_23_in[15:8]; // 8 bits
    connection[671] <= line_23_in[7:0]; // 8 bits
    // row 25 of 28 pixels
    connection[672] <= line_24_in[223:216]; // 8 bits
    connection[673] <= line_24_in[215:208]; // 8 bits
    connection[674] <= line_24_in[207:200]; // 8 bits
    connection[675] <= line_24_in[199:192]; // 8 bits
    connection[676] <= line_24_in[191:184]; // 8 bits
    connection[677] <= line_24_in[183:176]; // 8 bits
    connection[678] <= line_24_in[175:168]; // 8 bits
    connection[679] <= line_24_in[167:160]; // 8 bits
    connection[680] <= line_24_in[159:152]; // 8 bits
    connection[681] <= line_24_in[151:144]; // 8 bits
    connection[682] <= line_24_in[143:136]; // 8 bits
    connection[683] <= line_24_in[135:128]; // 8 bits
    connection[684] <= line_24_in[127:120]; // 8 bits
    connection[685] <= line_24_in[119:112]; // 8 bits
    connection[686] <= line_24_in[111:104]; // 8 bits
    connection[687] <= line_24_in[103:96]; // 8 bits
    connection[688] <= line_24_in[95:88]; // 8 bits
    connection[689] <= line_24_in[87:80]; // 8 bits
    connection[690] <= line_24_in[79:72]; // 8 bits
    connection[691] <= line_24_in[71:64]; // 8 bits
    connection[692] <= line_24_in[63:56]; // 8 bits
    connection[693] <= line_24_in[55:48]; // 8 bits
    connection[694] <= line_24_in[47:40]; // 8 bits
    connection[695] <= line_24_in[39:32]; // 8 bits
    connection[696] <= line_24_in[31:24]; // 8 bits
    connection[697] <= line_24_in[23:16]; // 8 bits
    connection[698] <= line_24_in[15:8]; // 8 bits
    connection[699] <= line_24_in[7:0]; // 8 bits
    // row 26 of 28 pixels
    connection[700] <= line_25_in[223:216]; // 8 bits
    connection[701] <= line_25_in[215:208]; // 8 bits
    connection[702] <= line_25_in[207:200]; // 8 bits
    connection[703] <= line_25_in[199:192]; // 8 bits
    connection[704] <= line_25_in[191:184]; // 8 bits
    connection[705] <= line_25_in[183:176]; // 8 bits
    connection[706] <= line_25_in[175:168]; // 8 bits
    connection[707] <= line_25_in[167:160]; // 8 bits
    connection[708] <= line_25_in[159:152]; // 8 bits
    connection[709] <= line_25_in[151:144]; // 8 bits
    connection[710] <= line_25_in[143:136]; // 8 bits
    connection[711] <= line_25_in[135:128]; // 8 bits
    connection[712] <= line_25_in[127:120]; // 8 bits
    connection[713] <= line_25_in[119:112]; // 8 bits
    connection[714] <= line_25_in[111:104]; // 8 bits
    connection[715] <= line_25_in[103:96]; // 8 bits
    connection[716] <= line_25_in[95:88]; // 8 bits
    connection[717] <= line_25_in[87:80]; // 8 bits
    connection[718] <= line_25_in[79:72]; // 8 bits
    connection[719] <= line_25_in[71:64]; // 8 bits
    connection[720] <= line_25_in[63:56]; // 8 bits
    connection[721] <= line_25_in[55:48]; // 8 bits
    connection[722] <= line_25_in[47:40]; // 8 bits
    connection[723] <= line_25_in[39:32]; // 8 bits
    connection[724] <= line_25_in[31:24]; // 8 bits
    connection[725] <= line_25_in[23:16]; // 8 bits
    connection[726] <= line_25_in[15:8]; // 8 bits
    connection[727] <= line_25_in[7:0]; // 8 bits
    // row 27 of 28 pixels
    connection[728] <= line_26_in[223:216]; // 8 bits
    connection[729] <= line_26_in[215:208]; // 8 bits
    connection[730] <= line_26_in[207:200]; // 8 bits
    connection[731] <= line_26_in[199:192]; // 8 bits
    connection[732] <= line_26_in[191:184]; // 8 bits
    connection[733] <= line_26_in[183:176]; // 8 bits
    connection[734] <= line_26_in[175:168]; // 8 bits
    connection[735] <= line_26_in[167:160]; // 8 bits
    connection[736] <= line_26_in[159:152]; // 8 bits
    connection[737] <= line_26_in[151:144]; // 8 bits
    connection[738] <= line_26_in[143:136]; // 8 bits
    connection[739] <= line_26_in[135:128]; // 8 bits
    connection[740] <= line_26_in[127:120]; // 8 bits
    connection[741] <= line_26_in[119:112]; // 8 bits
    connection[742] <= line_26_in[111:104]; // 8 bits
    connection[743] <= line_26_in[103:96]; // 8 bits
    connection[744] <= line_26_in[95:88]; // 8 bits
    connection[745] <= line_26_in[87:80]; // 8 bits
    connection[746] <= line_26_in[79:72]; // 8 bits
    connection[747] <= line_26_in[71:64]; // 8 bits
    connection[748] <= line_26_in[63:56]; // 8 bits
    connection[749] <= line_26_in[55:48]; // 8 bits
    connection[750] <= line_26_in[47:40]; // 8 bits
    connection[751] <= line_26_in[39:32]; // 8 bits
    connection[752] <= line_26_in[31:24]; // 8 bits
    connection[753] <= line_26_in[23:16]; // 8 bits
    connection[754] <= line_26_in[15:8]; // 8 bits
    connection[755] <= line_26_in[7:0]; // 8 bits
    // row 28 of 28 pixels
    connection[756] <= line_27_in[223:216]; // 8 bits
    connection[757] <= line_27_in[215:208]; // 8 bits
    connection[758] <= line_27_in[207:200]; // 8 bits
    connection[759] <= line_27_in[199:192]; // 8 bits
    connection[760] <= line_27_in[191:184]; // 8 bits
    connection[761] <= line_27_in[183:176]; // 8 bits
    connection[762] <= line_27_in[175:168]; // 8 bits
    connection[763] <= line_27_in[167:160]; // 8 bits
    connection[764] <= line_27_in[159:152]; // 8 bits
    connection[765] <= line_27_in[151:144]; // 8 bits
    connection[766] <= line_27_in[143:136]; // 8 bits
    connection[767] <= line_27_in[135:128]; // 8 bits
    connection[768] <= line_27_in[127:120]; // 8 bits
    connection[769] <= line_27_in[119:112]; // 8 bits
    connection[770] <= line_27_in[111:104]; // 8 bits
    connection[771] <= line_27_in[103:96]; // 8 bits
    connection[772] <= line_27_in[95:88]; // 8 bits
    connection[773] <= line_27_in[87:80]; // 8 bits
    connection[774] <= line_27_in[79:72]; // 8 bits
    connection[775] <= line_27_in[71:64]; // 8 bits
    connection[776] <= line_27_in[63:56]; // 8 bits
    connection[777] <= line_27_in[55:48]; // 8 bits
    connection[778] <= line_27_in[47:40]; // 8 bits
    connection[779] <= line_27_in[39:32]; // 8 bits
    connection[780] <= line_27_in[31:24]; // 8 bits
    connection[781] <= line_27_in[23:16]; // 8 bits
    connection[782] <= line_27_in[15:8]; // 8 bits
    connection[783] <= line_27_in[7:0]; // 8 bits

    symbol_0 <= connection[976];
    symbol_1 <= connection[977];
    symbol_2 <= connection[978];
    symbol_3 <= connection[979];
    symbol_4 <= connection[980];
    symbol_5 <= connection[981];
    symbol_6 <= connection[982];
    symbol_7 <= connection[983];
    symbol_8 <= connection[984];
    symbol_9 <= connection[985];

    
end

endmodule
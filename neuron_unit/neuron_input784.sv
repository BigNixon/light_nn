
module neuron_input784 #(
    parameter integer weigths [784:0] = '{
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785
    } // 784 weigth + 1 bias
) (
    input logic clk,
    input integer input_in [783:0],
    output integer output_out
);

    logic [15:0] sumAdress;
    logic [7:0] afterActivation;
    integer sumForActivation = 0;

    integer accumulate [783:0];

    integer sum;

    genvar i;
    generate
        for (i = 0; i<784; i++) begin : gen_multipliers
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
        sum <= accumulate[0] + accumulate[1] + accumulate[2] + accumulate[3] + accumulate[4] + accumulate[5] + accumulate[6] + accumulate[7] + accumulate[8] + accumulate[9] + accumulate[10] + accumulate[11] + accumulate[12] + accumulate[13] + accumulate[14] + accumulate[15] + accumulate[16] + accumulate[17] + accumulate[18] + accumulate[19] + accumulate[20] + accumulate[21] + accumulate[22] + accumulate[23] + accumulate[24] + accumulate[25] + accumulate[26] + accumulate[27] + accumulate[28] + accumulate[29] + accumulate[30] + accumulate[31] + accumulate[32] + accumulate[33] + accumulate[34] + accumulate[35] + accumulate[36] + accumulate[37] + accumulate[38] + accumulate[39] + accumulate[40] + accumulate[41] + accumulate[42] + accumulate[43] + accumulate[44] + accumulate[45] + accumulate[46] + accumulate[47] + accumulate[48] + accumulate[49] + accumulate[50] + accumulate[51] + accumulate[52] + accumulate[53] + accumulate[54] + accumulate[55] + accumulate[56] + accumulate[57] + accumulate[58] + accumulate[59] + accumulate[60] + accumulate[61] + accumulate[62] + accumulate[63] + accumulate[64] + accumulate[65] + accumulate[66] + accumulate[67] + accumulate[68] + accumulate[69] + accumulate[70] + accumulate[71] + accumulate[72] + accumulate[73] + accumulate[74] + accumulate[75] + accumulate[76] + accumulate[77] + accumulate[78] + accumulate[79] + accumulate[80] + accumulate[81] + accumulate[82] + accumulate[83] + accumulate[84] + accumulate[85] + accumulate[86] + accumulate[87] + accumulate[88] + accumulate[89] + accumulate[90] + accumulate[91] + accumulate[92] + accumulate[93] + accumulate[94] + accumulate[95] + accumulate[96] + accumulate[97] + accumulate[98] + accumulate[99] + accumulate[100] + accumulate[101] + accumulate[102] + accumulate[103] + accumulate[104] + accumulate[105] + accumulate[106] + accumulate[107] + accumulate[108] + accumulate[109] + accumulate[110] + accumulate[111] + accumulate[112] + accumulate[113] + accumulate[114] + accumulate[115] + accumulate[116] + accumulate[117] + accumulate[118] + accumulate[119] + accumulate[120] + accumulate[121] + accumulate[122] + accumulate[123] + accumulate[124] + accumulate[125] + accumulate[126] + accumulate[127] + accumulate[128] + accumulate[129] + accumulate[130] + accumulate[131] + accumulate[132] + accumulate[133] + accumulate[134] + accumulate[135] + accumulate[136] + accumulate[137] + accumulate[138] + accumulate[139] + accumulate[140] + accumulate[141] + accumulate[142] + accumulate[143] + accumulate[144] + accumulate[145] + accumulate[146] + accumulate[147] + accumulate[148] + accumulate[149] + accumulate[150] + accumulate[151] + accumulate[152] + accumulate[153] + accumulate[154] + accumulate[155] + accumulate[156] + accumulate[157] + accumulate[158] + accumulate[159] + accumulate[160] + accumulate[161] + accumulate[162] + accumulate[163] + accumulate[164] + accumulate[165] + accumulate[166] + accumulate[167] + accumulate[168] + accumulate[169] + accumulate[170] + accumulate[171] + accumulate[172] + accumulate[173] + accumulate[174] + accumulate[175] + accumulate[176] + accumulate[177] + accumulate[178] + accumulate[179] + accumulate[180] + accumulate[181] + accumulate[182] + accumulate[183] + accumulate[184] + accumulate[185] + accumulate[186] + accumulate[187] + accumulate[188] + accumulate[189] + accumulate[190] + accumulate[191] + accumulate[192] + accumulate[193] + accumulate[194] + accumulate[195] + accumulate[196] + accumulate[197] + accumulate[198] + accumulate[199] + accumulate[200] + accumulate[201] + accumulate[202] + accumulate[203] + accumulate[204] + accumulate[205] + accumulate[206] + accumulate[207] + accumulate[208] + accumulate[209] + accumulate[210] + accumulate[211] + accumulate[212] + accumulate[213] + accumulate[214] + accumulate[215] + accumulate[216] + accumulate[217] + accumulate[218] + accumulate[219] + accumulate[220] + accumulate[221] + accumulate[222] + accumulate[223] + accumulate[224] + accumulate[225] + accumulate[226] + accumulate[227] + accumulate[228] + accumulate[229] + accumulate[230] + accumulate[231] + accumulate[232] + accumulate[233] + accumulate[234] + accumulate[235] + accumulate[236] + accumulate[237] + accumulate[238] + accumulate[239] + accumulate[240] + accumulate[241] + accumulate[242] + accumulate[243] + accumulate[244] + accumulate[245] + accumulate[246] + accumulate[247] + accumulate[248] + accumulate[249] + accumulate[250] + accumulate[251] + accumulate[252] + accumulate[253] + accumulate[254] + accumulate[255] + accumulate[256] + accumulate[257] + accumulate[258] + accumulate[259] + accumulate[260] + accumulate[261] + accumulate[262] + accumulate[263] + accumulate[264] + accumulate[265] + accumulate[266] + accumulate[267] + accumulate[268] + accumulate[269] + accumulate[270] + accumulate[271] + accumulate[272] + accumulate[273] + accumulate[274] + accumulate[275] + accumulate[276] + accumulate[277] + accumulate[278] + accumulate[279] + accumulate[280] + accumulate[281] + accumulate[282] + accumulate[283] + accumulate[284] + accumulate[285] + accumulate[286] + accumulate[287] + accumulate[288] + accumulate[289] + accumulate[290] + accumulate[291] + accumulate[292] + accumulate[293] + accumulate[294] + accumulate[295] + accumulate[296] + accumulate[297] + accumulate[298] + accumulate[299] + accumulate[300] + accumulate[301] + accumulate[302] + accumulate[303] + accumulate[304] + accumulate[305] + accumulate[306] + accumulate[307] + accumulate[308] + accumulate[309] + accumulate[310] + accumulate[311] + accumulate[312] + accumulate[313] + accumulate[314] + accumulate[315] + accumulate[316] + accumulate[317] + accumulate[318] + accumulate[319] + accumulate[320] + accumulate[321] + accumulate[322] + accumulate[323] + accumulate[324] + accumulate[325] + accumulate[326] + accumulate[327] + accumulate[328] + accumulate[329] + accumulate[330] + accumulate[331] + accumulate[332] + accumulate[333] + accumulate[334] + accumulate[335] + accumulate[336] + accumulate[337] + accumulate[338] + accumulate[339] + accumulate[340] + accumulate[341] + accumulate[342] + accumulate[343] + accumulate[344] + accumulate[345] + accumulate[346] + accumulate[347] + accumulate[348] + accumulate[349] + accumulate[350] + accumulate[351] + accumulate[352] + accumulate[353] + accumulate[354] + accumulate[355] + accumulate[356] + accumulate[357] + accumulate[358] + accumulate[359] + accumulate[360] + accumulate[361] + accumulate[362] + accumulate[363] + accumulate[364] + accumulate[365] + accumulate[366] + accumulate[367] + accumulate[368] + accumulate[369] + accumulate[370] + accumulate[371] + accumulate[372] + accumulate[373] + accumulate[374] + accumulate[375] + accumulate[376] + accumulate[377] + accumulate[378] + accumulate[379] + accumulate[380] + accumulate[381] + accumulate[382] + accumulate[383] + accumulate[384] + accumulate[385] + accumulate[386] + accumulate[387] + accumulate[388] + accumulate[389] + accumulate[390] + accumulate[391] + accumulate[392] + accumulate[393] + accumulate[394] + accumulate[395] + accumulate[396] + accumulate[397] + accumulate[398] + accumulate[399] + accumulate[400] + accumulate[401] + accumulate[402] + accumulate[403] + accumulate[404] + accumulate[405] + accumulate[406] + accumulate[407] + accumulate[408] + accumulate[409] + accumulate[410] + accumulate[411] + accumulate[412] + accumulate[413] + accumulate[414] + accumulate[415] + accumulate[416] + accumulate[417] + accumulate[418] + accumulate[419] + accumulate[420] + accumulate[421] + accumulate[422] + accumulate[423] + accumulate[424] + accumulate[425] + accumulate[426] + accumulate[427] + accumulate[428] + accumulate[429] + accumulate[430] + accumulate[431] + accumulate[432] + accumulate[433] + accumulate[434] + accumulate[435] + accumulate[436] + accumulate[437] + accumulate[438] + accumulate[439] + accumulate[440] + accumulate[441] + accumulate[442] + accumulate[443] + accumulate[444] + accumulate[445] + accumulate[446] + accumulate[447] + accumulate[448] + accumulate[449] + accumulate[450] + accumulate[451] + accumulate[452] + accumulate[453] + accumulate[454] + accumulate[455] + accumulate[456] + accumulate[457] + accumulate[458] + accumulate[459] + accumulate[460] + accumulate[461] + accumulate[462] + accumulate[463] + accumulate[464] + accumulate[465] + accumulate[466] + accumulate[467] + accumulate[468] + accumulate[469] + accumulate[470] + accumulate[471] + accumulate[472] + accumulate[473] + accumulate[474] + accumulate[475] + accumulate[476] + accumulate[477] + accumulate[478] + accumulate[479] + accumulate[480] + accumulate[481] + accumulate[482] + accumulate[483] + accumulate[484] + accumulate[485] + accumulate[486] + accumulate[487] + accumulate[488] + accumulate[489] + accumulate[490] + accumulate[491] + accumulate[492] + accumulate[493] + accumulate[494] + accumulate[495] + accumulate[496] + accumulate[497] + accumulate[498] + accumulate[499] + accumulate[500] + accumulate[501] + accumulate[502] + accumulate[503] + accumulate[504] + accumulate[505] + accumulate[506] + accumulate[507] + accumulate[508] + accumulate[509] + accumulate[510] + accumulate[511] + accumulate[512] + accumulate[513] + accumulate[514] + accumulate[515] + accumulate[516] + accumulate[517] + accumulate[518] + accumulate[519] + accumulate[520] + accumulate[521] + accumulate[522] + accumulate[523] + accumulate[524] + accumulate[525] + accumulate[526] + accumulate[527] + accumulate[528] + accumulate[529] + accumulate[530] + accumulate[531] + accumulate[532] + accumulate[533] + accumulate[534] + accumulate[535] + accumulate[536] + accumulate[537] + accumulate[538] + accumulate[539] + accumulate[540] + accumulate[541] + accumulate[542] + accumulate[543] + accumulate[544] + accumulate[545] + accumulate[546] + accumulate[547] + accumulate[548] + accumulate[549] + accumulate[550] + accumulate[551] + accumulate[552] + accumulate[553] + accumulate[554] + accumulate[555] + accumulate[556] + accumulate[557] + accumulate[558] + accumulate[559] + accumulate[560] + accumulate[561] + accumulate[562] + accumulate[563] + accumulate[564] + accumulate[565] + accumulate[566] + accumulate[567] + accumulate[568] + accumulate[569] + accumulate[570] + accumulate[571] + accumulate[572] + accumulate[573] + accumulate[574] + accumulate[575] + accumulate[576] + accumulate[577] + accumulate[578] + accumulate[579] + accumulate[580] + accumulate[581] + accumulate[582] + accumulate[583] + accumulate[584] + accumulate[585] + accumulate[586] + accumulate[587] + accumulate[588] + accumulate[589] + accumulate[590] + accumulate[591] + accumulate[592] + accumulate[593] + accumulate[594] + accumulate[595] + accumulate[596] + accumulate[597] + accumulate[598] + accumulate[599] + accumulate[600] + accumulate[601] + accumulate[602] + accumulate[603] + accumulate[604] + accumulate[605] + accumulate[606] + accumulate[607] + accumulate[608] + accumulate[609] + accumulate[610] + accumulate[611] + accumulate[612] + accumulate[613] + accumulate[614] + accumulate[615] + accumulate[616] + accumulate[617] + accumulate[618] + accumulate[619] + accumulate[620] + accumulate[621] + accumulate[622] + accumulate[623] + accumulate[624] + accumulate[625] + accumulate[626] + accumulate[627] + accumulate[628] + accumulate[629] + accumulate[630] + accumulate[631] + accumulate[632] + accumulate[633] + accumulate[634] + accumulate[635] + accumulate[636] + accumulate[637] + accumulate[638] + accumulate[639] + accumulate[640] + accumulate[641] + accumulate[642] + accumulate[643] + accumulate[644] + accumulate[645] + accumulate[646] + accumulate[647] + accumulate[648] + accumulate[649] + accumulate[650] + accumulate[651] + accumulate[652] + accumulate[653] + accumulate[654] + accumulate[655] + accumulate[656] + accumulate[657] + accumulate[658] + accumulate[659] + accumulate[660] + accumulate[661] + accumulate[662] + accumulate[663] + accumulate[664] + accumulate[665] + accumulate[666] + accumulate[667] + accumulate[668] + accumulate[669] + accumulate[670] + accumulate[671] + accumulate[672] + accumulate[673] + accumulate[674] + accumulate[675] + accumulate[676] + accumulate[677] + accumulate[678] + accumulate[679] + accumulate[680] + accumulate[681] + accumulate[682] + accumulate[683] + accumulate[684] + accumulate[685] + accumulate[686] + accumulate[687] + accumulate[688] + accumulate[689] + accumulate[690] + accumulate[691] + accumulate[692] + accumulate[693] + accumulate[694] + accumulate[695] + accumulate[696] + accumulate[697] + accumulate[698] + accumulate[699] + accumulate[700] + accumulate[701] + accumulate[702] + accumulate[703] + accumulate[704] + accumulate[705] + accumulate[706] + accumulate[707] + accumulate[708] + accumulate[709] + accumulate[710] + accumulate[711] + accumulate[712] + accumulate[713] + accumulate[714] + accumulate[715] + accumulate[716] + accumulate[717] + accumulate[718] + accumulate[719] + accumulate[720] + accumulate[721] + accumulate[722] + accumulate[723] + accumulate[724] + accumulate[725] + accumulate[726] + accumulate[727] + accumulate[728] + accumulate[729] + accumulate[730] + accumulate[731] + accumulate[732] + accumulate[733] + accumulate[734] + accumulate[735] + accumulate[736] + accumulate[737] + accumulate[738] + accumulate[739] + accumulate[740] + accumulate[741] + accumulate[742] + accumulate[743] + accumulate[744] + accumulate[745] + accumulate[746] + accumulate[747] + accumulate[748] + accumulate[749] + accumulate[750] + accumulate[751] + accumulate[752] + accumulate[753] + accumulate[754] + accumulate[755] + accumulate[756] + accumulate[757] + accumulate[758] + accumulate[759] + accumulate[760] + accumulate[761] + accumulate[762] + accumulate[763] + accumulate[764] + accumulate[765] + accumulate[766] + accumulate[767] + accumulate[768] + accumulate[769] + accumulate[770] + accumulate[771] + accumulate[772] + accumulate[773] + accumulate[774] + accumulate[775] + accumulate[776] + accumulate[777] + accumulate[778] + accumulate[779] + accumulate[780] + accumulate[781] + accumulate[782] + accumulate[783];
        sumForActivation <= sum + weigths[784];
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
    
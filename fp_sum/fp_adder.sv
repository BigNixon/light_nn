module fp_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [31:0]  a_operand, b_operand;
    wire [23:0]  significand_a, significand_b;
    wire [7:0] exponent_diff;

    wire [23:0] shifted_b_significand;
    wire [7:0]  exponent_shifted_b;

    wire perform;

    wire [24:0] significand_add;
    wire [30:0] add_sum;


    wire [23:0] significand_sub_complement;
    wire [24:0] significand_sub;
    wire [30:0] sub_diff;
    wire [24:0] subtraction_diff; 
    wire [7:0] exponent_sub;

    wire signos_iguales;

    //a siempre es mayor o igual que b
    assign {a_operand, b_operand} = (a<b)? {b,a} : {a,b};

    //Assigining significand values according to Hidden Bit.
    //If exponent is equal to zero then hidden bit will be 0 for that respective significand else it will be 1
    assign significand_a = (|a_operand[30:23]) ? {1'b1,a_operand[22:0]} : {1'b0,a_operand[22:0]};
    assign significand_b = (|b_operand[30:23]) ? {1'b1,b_operand[22:0]} : {1'b0,b_operand[22:0]};


    //shifting the significand of b to right by exponent difference
    assign exponent_diff = a_operand[30:23] - b_operand[30:23];
    assign shifted_b_significand = significand_b >> exponent_diff;
    assign exponent_shifted_b = b_operand[30:23] + exponent_diff;

    //verify operand_a and operand_b are equal
    assign perform = (a_operand[30:23] == exponent_shifted_b);

    assign signos_iguales = ~(a_operand[31] ^ b_operand[31]);

    //=======================SUM BLOBCK =====================
    assign significand_add = (perform & signos_iguales)? significand_a + shifted_b_significand : 25'b0;

    assign add_sum[22:0] = significand_add[24]? significand_add[23:1] : significand_add[22:0];
    assign add_sum[30:23] = significand_add[24]? a_operand[30:23] + 1'b1 : a_operand[30:23];

    // ===================== SUB BLOCK =======================
    assign significand_sub_complement = (perform & ~(signos_iguales))? ~(shifted_b_significand) + 24'b1 : 24'b0;
    assign significand_sub = perform ? (significand_a + significand_sub_complement) : 25'b0;
    
    priority_encoder pe(significand_sub,a_operand[30:23],subtraction_diff,exponent_sub);

    assign sub_diff[30:23] = exponent_sub;
    assign sub_diff[22:0] = subtraction_diff[22:0];



    assign sum = ~(signos_iguales) ? {a_operand[31],sub_diff} : {a_operand[31],add_sum};
 
endmodule
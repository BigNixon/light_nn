module floating_point_multiplier(
    input wire [31:0] b,
    output wire [31:0] p,
    input wire [31:0] a
);

    wire sign,product_round,normalised;
    wire [8:0] exponent,sum_exponent;
    wire [22:0] product_mantissa;
    wire [23:0] operand_a,operand_b;
    wire [47:0] product,product_normalised; //48 Bits


    assign sign = a[31] ^ b[31];
    assign operand_a = (|a[30:23]) ? {1'b1,a[22:0]} : {1'b0,a[22:0]};
    assign operand_b = (|b[30:23]) ? {1'b1,b[22:0]} : {1'b0,b[22:0]};
    
    assign product = operand_a * operand_b;			//Calculating Product
    assign sum_exponent = a[30:23] + b[30:23];
    
    assign normalised = product[47] ? 1'b1 : 1'b0;

    assign exponent = sum_exponent - 8'd127 + normalised;

    assign product_normalised = normalised ? product : product << 1;	//Assigning Normalised value based on 48th bit

    assign product_round = |product_normalised[22:0];  //Ending 22 bits are OR'ed for rounding operation.

    //Final Manitssa.
    assign product_mantissa = product_normalised[46:24] + (product_normalised[23] & product_round); 


    assign p = {sign,exponent[7:0],product_mantissa};

endmodule

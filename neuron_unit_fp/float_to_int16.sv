module float_to_int16(input [31:0] a, output reg [15:0] out, input wire clk);
    
    wire [31:0] add_out, mul_out;

    // Instance of fp_adder
    fp_adder add_f2i(
        .a(32'h44800000),
        .b(a), // constant for offset (1024.00 in IEEE 754)
        .sum(add_out)
    );

    // Instance of floating_point_multiplier
    floating_point_multiplier mul_f2i(
        .a(add_out),
        .b(32'h42000000), // constant for scaling (32.00 in IEEE 754)
        .p(mul_out),
        .clk(clk)
    );

    integer exp;
    wire [22:0] mantissa = mul_out[22:0];

    always @(*) begin
        exp = mul_out[30:23];
        if(exp <127)begin
            $display("CUMPLE MENOR");
            out = 0;
        end else if (exp>(127+15)) begin
            $display("CUMPLE MAYOR");
            out = ~0;
        end else if (exp == 127) begin
            $display("CUMPLE 127");
            out = 16'd1;
        end else if(exp ==128 ) begin
            out = {{14{1'b0}},1'b1, mantissa[22:22]};
            $display("CUMPLE 128");
        end else if(exp ==129 ) begin
            $display("CUMPLE 129");
            out = {{13{1'b0}},1'b1, mantissa[22:21]};
        end else if( exp ==130 ) begin
            $display("CUMPLE 130");
            out = {{12{1'b0}},1'b1, mantissa[22:20]};
        end else if( exp ==131 ) begin
            $display("CUMPLE 131");
            out = {{11{1'b0}},1'b1, mantissa[22:19]};
        end else if( exp ==132 ) begin
            $display("CUMPLE 132");
            out = {{10{1'b0}},1'b1, mantissa[22:18]};
        end else if( exp ==133 ) begin
            $display("CUMPLE 133");
            out = {{9{1'b0}},1'b1, mantissa[22:17]};
        end else if( exp ==134 ) begin
            $display("CUMPLE 134");
            out = {{8{1'b0}},1'b1, mantissa[22:16]};
        end else if( exp ==135 ) begin
            $display("CUMPLE 135");
            out = {{7{1'b0}},1'b1, mantissa[22:15]};
        end else if( exp ==136 ) begin
            $display("CUMPLE 136");
            out = {{6{1'b0}},1'b1, mantissa[22:14]};
        end else if( exp ==137 ) begin
            $display("CUMPLE 137");
            out = {{5{1'b0}},1'b1, mantissa[22:13]};
        end else if( exp ==138 ) begin
            $display("CUMPLE 138");
            out = {{4{1'b0}},1'b1, mantissa[22:12]};
        end else if( exp ==139 ) begin
            $display("CUMPLE 139");
            out = {{3{1'b0}},1'b1, mantissa[22:11]};
        end else if( exp ==140 ) begin
            $display("CUMPLE 140");
            out = {{2{1'b0}},1'b1, mantissa[22:10]};
        end else if( exp ==141 ) begin
            $display("CUMPLE 141");
            out = {1'b0,1'b1, mantissa[22:9]};
        end else if( exp ==142 ) begin
            $display("CUMPLE 142");
            out = {1'b1, mantissa[22:8]};
        end
    end
    
    
endmodule
module memory_line (
    input logic clk,
    input logic rst,
    input logic data_en,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);
    reg [7:0] memory_array [0:1279]; // 1280 * 8 bits memory

    integer wr_addr = 0;
    integer rd_addr = 0;

    always @(posedge clk or posedge rst) begin
        
//        if (data_en == 1'b1) begin
//            
//        end

        if (rst == 1'b1) begin
            wr_addr = 0;
            rd_addr = 1;
        end else if (data_en == 1'b1) begin
            wr_addr = rd_addr;
            if (rd_addr == 1279) begin
                rd_addr = 0;
            end else begin
                rd_addr = rd_addr + 1;
            end
				data_out <= memory_array[rd_addr];
            memory_array[wr_addr] <= data_in;
        end
    end

endmodule


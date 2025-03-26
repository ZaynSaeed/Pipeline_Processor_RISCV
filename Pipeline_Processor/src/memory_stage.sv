module memory_stage (
    input wire rst,
    input wire load,
    input wire store,
    input wire [31:0] op_b,
    input wire [31:0] instruction,
    input wire [31:0] alu_out_address,
    input wire [31:0] wrap_load_in,
    input wire [3:0] mask,
    input wire data_valid,
    input wire valid,
    input wire we_re,
    input wire request,

    output wire [31:0] store_data_out,
    output wire [31:0] wrap_load_out
);

    reg [31:0] store_data_reg;
    reg [31:0] wrap_load_reg;

    always @(*) begin
        if (rst) begin
            store_data_reg = 32'b0;
            wrap_load_reg = 32'b0;
        end 
        else begin
            if (store) begin
                store_data_reg = op_b; // Store data comes from op_b
            end
            if (load) begin
                wrap_load_reg = wrap_load_in; // Load data from memory
            end
        end
    end

    assign store_data_out = store_data_reg;
    assign wrap_load_out = wrap_load_reg;

endmodule

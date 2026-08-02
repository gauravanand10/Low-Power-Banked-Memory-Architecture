/*
 * 2-to-4 DECODER
 * Converts 2-bit bank select to one-hot chip select
 */

module decoder (
    input [1:0] bank_select,    // 00, 01, 10, 11
    output reg [3:0] chip_select // one-hot output
);

    always @(*) begin
        case (bank_select)
            2'b00: chip_select = 4'b0001;  // Bank 0
            2'b01: chip_select = 4'b0010;  // Bank 1
            2'b10: chip_select = 4'b0100;  // Bank 2
            2'b11: chip_select = 4'b1000;  // Bank 3
            default: chip_select = 4'b0000;
        endcase
    end

endmodule

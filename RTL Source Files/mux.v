/*
 * 4-to-1 MULTIPLEXER
 * Selects read data from active bank
 */

module mux (
    input [7:0] bank0_rdata,
    input [7:0] bank1_rdata,
    input [7:0] bank2_rdata,
    input [7:0] bank3_rdata,
    input [1:0] bank_select,
    output reg [7:0] final_rdata
);

    always @(*) begin
        case (bank_select)
            2'b00: final_rdata = bank0_rdata;
            2'b01: final_rdata = bank1_rdata;
            2'b10: final_rdata = bank2_rdata;
            2'b11: final_rdata = bank3_rdata;
            default: final_rdata = 8'h00;
        endcase
    end

endmodule

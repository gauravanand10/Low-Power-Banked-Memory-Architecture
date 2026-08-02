/*
 * TOP LEVEL BANKED MEMORY
 * 4 banks × 64 bytes = 256 bytes total
 */

module banked_memory (
    input clk,
    input [1:0] bank_select,
    input we,
    input [5:0] addr,
    input [7:0] wdata,
    output [7:0] rdata
);

    // Internal signals
    wire [3:0] cs;
    wire [7:0] bank0_rdata, bank1_rdata, bank2_rdata, bank3_rdata;

    // Decoder instance
    decoder u_decoder (
        .bank_select(bank_select),
        .chip_select(cs)
    );

    // Bank 0
    memory_bank u_bank0 (
        .clk(clk),
        .cs(cs[0]),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(bank0_rdata)
    );

    // Bank 1
    memory_bank u_bank1 (
        .clk(clk),
        .cs(cs[1]),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(bank1_rdata)
    );

    // Bank 2
    memory_bank u_bank2 (
        .clk(clk),
        .cs(cs[2]),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(bank2_rdata)
    );

    // Bank 3
    memory_bank u_bank3 (
        .clk(clk),
        .cs(cs[3]),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(bank3_rdata)
    );

    // Multiplexer
    mux u_mux (
        .bank0_rdata(bank0_rdata),
        .bank1_rdata(bank1_rdata),
        .bank2_rdata(bank2_rdata),
        .bank3_rdata(bank3_rdata),
        .bank_select(bank_select),
        .final_rdata(rdata)
    );

endmodule

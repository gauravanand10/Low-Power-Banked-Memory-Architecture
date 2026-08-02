/*
 * TESTBENCH FOR TOP LEVEL BANKED MEMORY
 */

module tb_banked_memory();

    reg clk;
    reg [1:0] bank_select;
    reg we;
    reg [5:0] addr;
    reg [7:0] wdata;
    wire [7:0] rdata;

    // Correct instantiation of banked_memory
    banked_memory uut (
        .clk(clk),
        .bank_select(bank_select),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Dump waveforms
        $dumpfile("banked_memory.vcd");
        $dumpvars(0, tb_banked_memory);

        // Initialize
        bank_select = 0;
        we = 0;
        addr = 0;
        wdata = 0;

        #10;

        // Test 1: Write to Bank 0
        $display("Writing AA to Bank0[10]");
        bank_select = 0;
        we = 1;
        addr = 10;
        wdata = 8'hAA;
        #10 we = 0;

        // Read Bank 0
        #10;
        $display("Bank0[10] = %h", rdata);

        // Test 2: Write to Bank 2
        #20;
        $display("Writing 55 to Bank2[20]");
        bank_select = 2;
        we = 1;
        addr = 20;
        wdata = 8'h55;
        #10 we = 0;

        // Read Bank 2
        #10;
        $display("Bank2[20] = %h", rdata);

        // Test 3: Read Bank 0 (should still be AA)
        #20;
        bank_select = 0;
        addr = 10;
        #10;
        $display("Bank0[10] = %h", rdata);

        #50;
        $display("Simulation complete");
        $finish;
    end

endmodule

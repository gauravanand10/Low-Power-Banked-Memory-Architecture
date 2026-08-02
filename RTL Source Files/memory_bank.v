/*
 * BANK MEMORY WITH POWER FSM
 * States: ACTIVE, IDLE, SLEEP
 */

module memory_bank (
    input         clk,
    input         cs,
    input         we,
    input  [5:0]  addr,
    input  [7:0]  wdata,
    output reg [7:0] rdata
);

    // Power states
    localparam ACTIVE = 2'b00;
    localparam IDLE   = 2'b01;
    localparam SLEEP  = 2'b10;

    reg [1:0] state, next_state;
    reg [7:0] mem [0:63];
    reg [4:0] idle_count;  // 5-bit counter

    // Clock gating
    wire bank_clk = clk & (state != SLEEP);

    // FSM: State update
    always @(posedge clk) begin
        case (state)
            ACTIVE: begin
                if (!cs) begin
                    idle_count <= idle_count + 1;
                    if (idle_count > 20) next_state <= IDLE;
                end else begin
                    idle_count <= 0;
                end
            end

            IDLE: begin
                if (cs) next_state <= ACTIVE;
                else begin
                    idle_count <= idle_count + 1;
                    if (idle_count > 50) next_state <= SLEEP;
                end
            end

            SLEEP: begin
                if (cs) next_state <= ACTIVE;
            end
        endcase
    end

    always @(posedge clk) begin
        state <= next_state;
    end

    // Memory operations (clock gated)
    always @(posedge bank_clk) begin
        if (cs && we) mem[addr] <= wdata;
        if (cs && !we) rdata <= mem[addr];
    end

endmodule

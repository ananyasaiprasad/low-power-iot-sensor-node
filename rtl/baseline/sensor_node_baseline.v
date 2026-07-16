//======================================================
// Ultra Low Power IoT Sensor Node
// Optimized Single-Module ASIC RTL
//======================================================
module ulp_iot_sensor_node (
    input  wire clk_aon,        // Always-ON clock (RTC domain)
    input  wire rst_n,

    input  wire sensor_event,    // Sensor interrupt
    input  wire ext_wakeup,      // External wake-up

    output reg  pg_en,           // Power gate enable (1 = OFF)
    output reg  [1:0] vsel,      // Voltage select
    output reg  clk_en           // Clock enable (for ICG)
);

    //==================================================
    // FSM State Encoding (low-toggle, tool-friendly)
    //==================================================
    localparam S_ACTIVE      = 2'b00;
    localparam S_IDLE        = 2'b01;
    localparam S_LIGHT_SLEEP = 2'b10;
    localparam S_DEEP_SLEEP  = 2'b11;

    reg [1:0] state, next_state;

    //==================================================
    // Activity Monitor
    //==================================================
    reg [7:0] idle_cnt;
    wire      idle_timeout;

    // Idle counter only active when meaningful
    always @(posedge clk_aon or negedge rst_n) begin
        if (!rst_n)
            idle_cnt <= 8'd0;
        else if (state == S_ACTIVE || state == S_IDLE) begin
            if (sensor_event)
                idle_cnt <= 8'd0;
            else
                idle_cnt <= idle_cnt + 1'b1;
        end
        else
            idle_cnt <= 8'd0;
    end

    assign idle_timeout = (idle_cnt == 8'hFF);

    //==================================================
    // FSM: State Register
    //==================================================
    always @(posedge clk_aon or negedge rst_n) begin
        if (!rst_n)
            state <= S_DEEP_SLEEP;
        else
            state <= next_state;
    end

    //==================================================
    // FSM: Next-State Logic (combinational)
    //==================================================
    always @(*) begin
        next_state = state;

        case (state)
            S_ACTIVE: begin
                if (idle_timeout)
                    next_state = S_IDLE;
            end

            S_IDLE: begin
                if (sensor_event)
                    next_state = S_ACTIVE;
                else
                    next_state = S_LIGHT_SLEEP;
            end

            S_LIGHT_SLEEP: begin
                if (sensor_event || ext_wakeup)
                    next_state = S_ACTIVE;
                else
                    next_state = S_DEEP_SLEEP;
            end

            S_DEEP_SLEEP: begin
                if (sensor_event || ext_wakeup)
                    next_state = S_ACTIVE;
            end

            default:
                next_state = S_ACTIVE;
        endcase
    end

    //==================================================
    // Power / Voltage / Clock Control (Moore-style)
    //==================================================
    always @(*) begin
        // Safe defaults
        pg_en  = 1'b0;
        vsel   = 2'b00;
        clk_en = 1'b1;

        case (state)
            S_ACTIVE: begin
                pg_en  = 1'b0;      // Core ON
                vsel   = 2'b00;     // 1.0 V
                clk_en = 1'b1;
            end

            S_IDLE: begin
                pg_en  = 1'b0;
                vsel   = 2'b01;     // 0.8 V
                clk_en = 1'b1;
            end

            S_LIGHT_SLEEP: begin
                pg_en  = 1'b0;
                vsel   = 2'b10;     // 0.6 V
                clk_en = 1'b0;      // Clock gated
            end

            S_DEEP_SLEEP: begin
                pg_en  = 1'b1;      // Power gated
                vsel   = 2'b11;     // Regulator OFF
                clk_en = 1'b0;
            end
        endcase
    end

endmodule

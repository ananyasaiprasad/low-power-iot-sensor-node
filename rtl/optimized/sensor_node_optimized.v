module legacy_high_power_sensor_node (
    input  wire        clk,
    input  wire        rst,
    input  wire [11:0] sensor_data,
    output reg  [15:0] tx_data
);

   
    reg [31:0] free_run_counter;
    reg [31:0] accum_0, accum_1, accum_2, accum_3;
    reg [15:0] filter_stage_0, filter_stage_1, filter_stage_2;
    reg [7:0]  lfsr;
    reg [3:0]  state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            free_run_counter <= 32'h0;
            accum_0 <= 32'h0;
            accum_1 <= 32'h0;
            accum_2 <= 32'h0;
            accum_3 <= 32'h0;
            filter_stage_0 <= 16'h0;
            filter_stage_1 <= 16'h0;
            filter_stage_2 <= 16'h0;
            lfsr <= 8'h1;
            state <= 4'h0;
            tx_data <= 16'h0;
        end else begin
            free_run_counter <= free_run_counter + 1;

            accum_0 <= accum_0 + sensor_data;
            accum_1 <= accum_1 + accum_0[11:0];
            accum_2 <= accum_2 + accum_1[11:0];
            accum_3 <= accum_3 + accum_2[11:0];

            filter_stage_0 <= (accum_3[15:0] >> 1) + filter_stage_0;
            filter_stage_1 <= (filter_stage_0 >> 1) + filter_stage_1;
            filter_stage_2 <= (filter_stage_1 >> 1) + filter_stage_2;

            lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5]};

            case (state)
                4'h0: state <= 4'h1;
                4'h1: state <= 4'h2;
                4'h2: state <= 4'h3;
                4'h3: state <= 4'h4;
                4'h4: state <= 4'h5;
                4'h5: state <= 4'h6;
                4'h6: state <= 4'h7;
                4'h7: state <= 4'h8;
                default: state <= 4'h0;
            endcase

            tx_data <= filter_stage_2 ^ {12'd0, state};
        end
    end

endmodule
            

module traffic_light(
    input clk,
    input rst,
    output reg NS_G,
    output reg NS_Y,
    output reg NS_R,
    output reg EW_G,
    output reg EW_Y,
    output reg EW_R
);

    // State encoding
    parameter S_NS_GREEN  = 2'b00;
    parameter S_NS_YELLOW = 2'b01;
    parameter S_EW_GREEN  = 2'b10;
    parameter S_EW_YELLOW = 2'b11;

    reg [1:0] state, next_state;

    // State transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S_NS_GREEN;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case(state)
            S_NS_GREEN: next_state = S_NS_YELLOW;
            S_NS_YELLOW: next_state = S_EW_GREEN;
            S_EW_GREEN: next_state = S_EW_YELLOW;
            S_EW_YELLOW: next_state = S_NS_GREEN;
            default: next_state = S_NS_GREEN;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default all outputs to 0
        NS_G = 0; NS_Y = 0; NS_R = 0;
        EW_G = 0; EW_Y = 0; EW_R = 0;

        case(state)
            S_NS_GREEN: begin
                NS_G = 1;
                NS_Y = 0;
                NS_R = 0;
                EW_G = 0;
                EW_Y = 0;
                EW_R = 1;
            end
            S_NS_YELLOW: begin
                NS_G = 0;
                NS_Y = 1;
                NS_R = 0;
                EW_G = 0;
                EW_Y = 0;
                EW_R = 1;
            end
            S_EW_GREEN: begin
                NS_G = 0;
                NS_Y = 0;
                NS_R = 1;
                EW_G = 1;
                EW_Y = 0;
                EW_R = 0;
            end
            S_EW_YELLOW: begin
                NS_G = 0;
                NS_Y = 0;
                NS_R = 1;
                EW_G = 0;
                EW_Y = 1;
                EW_R = 0;
            end
            default: begin
                NS_G = 0; NS_Y = 0; NS_R = 1;
                EW_G = 0; EW_Y = 0; EW_R = 1;
            end
        endcase
    end

endmodule



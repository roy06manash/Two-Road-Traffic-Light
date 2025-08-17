// Tick Prescaler (hardware-friendly)
module tick_prescaler #(
    parameter integer CLK_FREQ_HZ = 50_000_000,
    parameter integer TICK_HZ     = 1
)(
    input wire clk,
    input wire rst,
    output reg tick
);

    // Implementation: counter that asserts tick for 1 clock cycle
    // Max count = CLK_FREQ_HZ/TICK_HZ - 1
    // Student can implement for real hardware
endmodule

`timescale 1ns/1ps

module tb_traffic_light;

    // Testbench signals
    reg clk;
    reg rst;
    wire north_green, north_yellow, north_red;
    wire east_green, east_yellow, east_red;

    // Instantiate the traffic light module
    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .north_green(north_green),
        .north_yellow(north_yellow),
        .north_red(north_red),
        .east_green(east_green),
        .east_yellow(east_yellow),
        .east_red(east_red)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns half-period
    end

    // Reset and test sequence
    initial begin
        rst = 1;      // Assert reset
        #20;
        rst = 0;      // De-assert reset

        // Run simulation for 500 ns (adjust as needed)
        #500;

        $finish;
    end

    // Waveform generation
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
    end

endmodule

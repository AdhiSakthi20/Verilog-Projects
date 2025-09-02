`timescale 1ns/1ps
module counter_basic_tb;

    reg clk;
    reg rst;
    wire [7:0] count;

    // Instantiate DUT
    counter_basic uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generator: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 0;

        // Apply reset
        $display("Applying reset...");
        #12 rst = 1;   // release reset

        // Run counter
        #100;

        // Apply reset again
        $display("Resetting again...");
        rst = 0;
        #10 rst = 1;

        // Run more cycles
        #100;

        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | rst=%b | count=%d", $time, rst, count);
    end

    // Dump for GTKWave
    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_basic_tb);
    end

endmodule

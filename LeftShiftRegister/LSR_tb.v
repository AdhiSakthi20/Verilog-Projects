`timescale 1ns/1ps

module tb_SR_LS;
    reg clk, rst, si;
    wire so;

    // Instantiate DUT (Device Under Test)
    SR_LS uut (
        .so(so),
        .clk(clk),
        .rst(rst),
        .si(si)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 0;
        si = 0;

        // Apply reset
        #10 rst = 1;

        // Apply serial inputs
        #10 si = 1;
        #10 si = 0;
        #10 si = 1;
        #10 si = 1;
        #10 si = 0;

        // Extra clocks to observe shifts
        #50 $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time=%0t | rst=%b | si=%b | sr=%b | so=%b",
                  $time, rst, si, uut.sr, so);
    end
endmodule

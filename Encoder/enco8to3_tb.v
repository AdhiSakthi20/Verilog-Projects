module enco8to3_tb;
    reg  [7:0] I;        // Test input
    wire [2:0] Y;        // Encoder output

    // Instantiate the design
    enco8to3 uut (.I(I), .Y(Y));

    initial begin
        $monitor("Time=%0t | I=%b | Y=%b", $time, I, Y);

        I = 8'b00000001; #10;  // I0 active → 000
        I = 8'b00000010; #10;  // I1 active → 001
        I = 8'b00000100; #10;  // I2 active → 010
        I = 8'b00001000; #10;  // I3 active → 011
        I = 8'b00010000; #10;  // I4 active → 100
        I = 8'b00100000; #10;  // I5 active → 101
        I = 8'b01000000; #10;  // I6 active → 110
        I = 8'b10000000; #10;  // I7 active → 111
        $finish;
    end
endmodule

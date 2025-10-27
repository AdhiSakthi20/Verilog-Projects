// Testbench for 4:1 Multiplexer
module tb_mux4to1;
    reg I0, I1, I2, I3;
    reg [1:0] S;
    wire Y;

    mux4to1 uut (I0, I1, I2, I3, S, Y);

    initial begin
        $display("S1 S0 | I0 I1 I2 I3 | Y");
        $monitor("%b  %b  |  %b  %b  %b  %b | %b",
                 S[1], S[0], I0, I1, I2, I3, Y);
        
        I0=0; I1=1; I2=0; I3=1;

        S=2'b00; #10;
        S=2'b01; #10;
        S=2'b10; #10;
        S=2'b11; #10;

        $finish;
    end
endmodule


module tb_alu4bit;
    reg [3:0] a, b, opcode;
    wire [3:0] x, y;

    // Instantiate ALU
    alu4bit uut (
        .x(x),
        .y(y),
        .a(a),
        .b(b),
        .opcode(opcode)
    );

    initial begin
        // dump for GTKWave
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu4bit);

        $monitor("T=%0t | Opcode=%b | A=%d | B=%d | Y=%b | X=%b ",
                  $time, opcode, a, b, y,x);

        a = 4'b1010; b = 4'b0101;
        
        opcode = 4'b0000; #10;
        opcode = 4'b0001; #10;
        opcode = 4'b0010; #10;
        opcode = 4'b0011; #10;
        opcode = 4'b0100; #10;
        opcode = 4'b0101; #10;
        opcode = 4'b0110; #10;
        opcode = 4'b0111; #10;
        opcode = 4'b1000; #10;
        opcode = 4'b1001; #10;
        opcode = 4'b1010; #10;
        opcode = 4'b1011; #10;
        opcode = 4'b1100; #10;
        opcode = 4'b1101; #10;
        opcode = 4'b1110; #10;
        opcode = 4'b1111; #10;

        $finish;
    end
endmodule

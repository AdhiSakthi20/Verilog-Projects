module alu4bit(x, y, a, b, opcode);
    input [3:0] a, b, opcode;
    output reg [3:0] x, y;

    always @(*) begin
        y = 4'b0000;   // default
        x = 4'b0000;   // default
        case (opcode)
            4'b0000: x = {3'b000, |a};      // OR-reduction
            4'b0001: x = {3'b000, &a};      // AND-reduction
            4'b0010: x = {3'b000, ^a};      // XOR-reduction
            4'b0011: x = a & b;
            4'b0100: x = a | b;
            4'b0101: x = a ^ b;
            4'b0110: x = {3'b000, (a > b)};
            4'b0111: x = {3'b000, (a < b)};
            4'b1000: x = {3'b000, !a};
            4'b1001: x = {3'b000, (a == b)};
            4'b1010: {y[0], x} = a + b;
            4'b1011: x = a - b;
            4'b1100: {y, x} = a * b;
            4'b1101: {y, x} = a >> b;
            4'b1110: {y, x} = a << b;
            4'b1111: x = ~a;
            default: $display("Error: Invalid opcode");
        endcase
    end
endmodule

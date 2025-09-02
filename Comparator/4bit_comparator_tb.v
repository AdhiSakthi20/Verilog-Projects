module comparator_df_tb;
reg [3:0]A,B;
wire gt,eq,sm;
comparator_df uut(
    .A(A),
    .B(B),
    .gt(gt),
    .eq(eq),
    .sm(sm)
);
initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0,comparator_df_tb);
    A=4'b0000;B=4'b0000;#10;
    A=4'b0101;B=4'b0011;#10;
    A=4'b0010;B=4'b1000;#10;
    A=4'b1111;B=4'b1111;#10;
    A=4'b0110;B=4'b0111;#10;
    A=4'b1010;B=4'b0101;#10;

    $finish;
end
initial begin
    $monitor("Time=%0t | A=%b | B=%b | gt=%b | eq=%b | sm=%b ",$time,A,B,gt,eq,sm);
end
endmodule
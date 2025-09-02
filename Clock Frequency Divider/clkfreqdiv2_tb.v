module freq_div_2_tb;
reg clk;
reg rst;
wire clk_out;
freq_div_2 uut(
    .clk_out(clk_out),
    .clk(clk),
    .rst(rst)
);
always #5 clk=~clk;
initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    #100 $finish;
end
initial begin
    $monitor("Tme=%0t | clk=%b | clk_out=%b",$time,clk,rst,clk_out);

end
endmodule
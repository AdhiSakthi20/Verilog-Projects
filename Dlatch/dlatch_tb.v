module dlatch_df_tb;
reg d,en;
wire q;
dlatch_df dut(
    .q(q),
    .d(d),
    .en(en)
);
initial begin
    $dumpfile("dlatch_df.vcd");
    $dumpvars(0,dlatch_df_tb);
    $monitor("time=%0t | en=%d -> q=%b",$time,en,d,q);
    en=0;d=0;
    #10 d=1;
    #10 en=1;
    #10 d=0;
    #10 en=0;d=1;
    #10 en=1;
    #10 d=0;
    #10 $finish;

end
endmodule
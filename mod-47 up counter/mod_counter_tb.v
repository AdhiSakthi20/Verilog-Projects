module counter_mod47_up_tb;
    reg [7:0]data ;
    reg clk,rst;
    wire [7:0]count ;

    counter_mod47_up uut(
        .data(data),
        .rst(rst),
        .clk(clk),
        .count(count)

    );
    always #5 clk=~clk;
    initial
    
    begin
        clk=0;
        rst=0;
        data=8'd0;
        #12 rst=1;
        #500;
        rst=0;
        #10 rst=1;
        #200;
        $finish;
    end
    initial begin
        $monitor("Time=%0t | rst=%b | count=%d",$time,rst,count);

    end
    endmodule
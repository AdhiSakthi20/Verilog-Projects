module counter_up_load_tb;
reg [7:0]data;
reg clk,rst,load;
wire  [7:0]count;


 // Instantiate DUT
    counter_up_load uut (
        .count(count),
        .clk(clk),
        .rst(rst),
        .load(load),
        .data(data)
    );
always #5 clk=~clk;



    initial begin
         clk=0;
         
        rst=0;load=0;data=8'd0;
        #12 rst=1;
        #50;
        load=1;data=8'd50;
        #10 load=0;
        #50;
        load=1;data=8'd200;
        #10 load=0;
        #50;
        rst=0;
        #10 rst=1;
        #50;
        $finish;
    end
    initial begin
        $monitor("Time =%0t | rst=%b | data=%d | count=%d",$time,rst,load,data,count);

    end
    endmodule
    

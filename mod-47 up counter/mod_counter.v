module counter_mod47_up(count,clk,rst,data);
input [7:0]data;
input clk,rst;
output [7:0]count;

reg [7:0]count_temp;

always @(posedge clk )
begin
    if(!rst  | count_temp>=8'd46)
        count_temp<=8'd0;
    else 
        count_temp<=count_temp+1; 
end
assign count=count_temp;
endmodule
module comparator_df(gt,sm,eq,A,B) ;
input [3:0]A,B;
output gt,eq,sm;
assign gt=(A>B);
assign eq=(A==B);
assign sm=(A<B);


endmodule
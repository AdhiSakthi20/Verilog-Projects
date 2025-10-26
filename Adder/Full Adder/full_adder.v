module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output reg sum,cout;
reg x,y,z;

always @(a or b or cin)
begin
    sum=(a^b)^cin;
    x=a&b;
    y=a&cin;
    z=b&cin;
    cout=(x|y|z);
end
endmodule

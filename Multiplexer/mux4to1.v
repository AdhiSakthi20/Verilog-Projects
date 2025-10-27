module  mux4to1 (
    input I0,I1,I2,I3,
    input [1:0]S,
    output Y
);
assign Y=   (~S[1]&~S[0]& I0)|
            (~S[1]&S[0]& I1)|   
            (S[1]&~S[0]& I2)|
            (S[1]&S[0]& I3);

    
endmodule
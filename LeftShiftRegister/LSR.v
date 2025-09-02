module SR_LS (
    output so,
    input clk, rst, si
);
    reg [4:0] sr;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            sr <= 5'd0;               // async reset clears shift register
        else
            sr <= {sr[3:0], si};      // left shift
    end

    assign so = sr[4];                // MSB as serial out
endmodule

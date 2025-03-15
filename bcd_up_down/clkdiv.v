module clkdiv(
    input  clk,
    input  rst,
    output reg clk_div
);
    localparam CONSTANT = 50000000; 
    reg [31:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 32'b0;
        else if (count == CONSTANT - 1)
            count <= 32'b0;
        else 
            count <= count + 1;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk_div <= 1'b0;
        else if (count == CONSTANT - 1)
            clk_div <= ~clk_div; 
    end
endmodule

module clkdiv #(
    parameter CONSTANT = 25000
)(
    input  wire clk,
    input  wire rst,
    output reg  clk_div
);
    reg [31:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 32'd0;
        else if (count == CONSTANT - 1)
            count <= 32'd0;
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
module counter_ms (
    input  wire clk, 
    input  wire rst, 
    input  wire stop,
    output reg [16:0] count  
);
    always @(posedge clk or posedge rst) begin 
        if (rst)
            count <= 17'd0;
        else if (!stop) begin
            if (count < 17'd59999)  
                count <= count + 1;
            else 
                count <= 17'd0;
        end
    end
endmodule

module counter_updown (
    input clk, 
    input rst, 
    input enable,    
    input up_down, 
    input load,
    input [3:0] data_in, 
    output reg [3:0] count
);
    always @(posedge clk or posedge rst) begin 
        if (rst)
            count <= 4'b0000;  
        else if (enable) begin   
            if (load)
                count <= data_in;  
            else if (up_down)
                count <= count + 1; 
            else
                count <= count - 1; 
        end
    end
endmodule

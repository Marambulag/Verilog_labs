module edge_detector (
    input clk,
    input rst_n,
    input [9:0] sw_clean,
    output reg [9:0] sw_rise
);
    reg [9:0] sw_prev;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sw_prev <= 0;
            sw_rise <= 0;
        end else begin
            sw_prev <= sw_clean;
            sw_rise <= sw_clean & ~sw_prev;
        end
    end
endmodule
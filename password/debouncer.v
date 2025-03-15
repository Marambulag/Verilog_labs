module debounce (
    input clk,
    input rst_n,
    input [9:0] sw,
    output reg [9:0] sw_clean
);
    reg [19:0] counter;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            sw_clean <= 0;
        end else begin
            if (counter == 20'd1_000_000) begin
                sw_clean <= sw;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
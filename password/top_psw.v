module top_psw (
    input [9:0] sw,
    input clk,
    input rst_n,
    output [6:0] HEX4, HEX3, HEX2, HEX1, HEX0
);
    
    wire [9:0] sw_clean;
    wire [9:0] sw_rise;
    wire [2:0] current_state;

   
    debounce debounce_inst(
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .sw_clean(sw_clean)
    );

    edge_detector edge_inst(
        .clk(clk),
        .rst_n(rst_n),
        .sw_clean(sw_clean),
        .sw_rise(sw_rise)
    );

    fsm_controller fsm_inst(
        .clk(clk),
        .rst_n(rst_n),
        .sw_rise(sw_rise),
        .state(current_state)
    );

    display display_inst(
        .state(current_state),
        .HEX4(HEX4),
        .HEX3(HEX3),
        .HEX2(HEX2),
        .HEX1(HEX1),
        .HEX0(HEX0)
    );
endmodule



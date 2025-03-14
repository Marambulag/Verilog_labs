module counter_div (
    input  clk,
    input  rst,
    input  up_down,
    input  load,
    input  enable,
    input  [3:0] data_in,
    output [6:0] decoder
);
    wire clkdiv;
    wire [3:0] count;
   
    clkdiv clk_div_inst (  
        .clk(clk),
        .rst(rst),
        .clk_div(clkdiv)
    );

    
    counter_updown counter_inst (
        .clk(clkdiv),
        .rst(rst),
        .enable(enable),        
        .up_down(up_down),
        .load(load),
        .data_in(data_in),      
        .count(count)
    );
	 
    decoder_7seg display_inst (
        .decoder_in(count),
        .decoder_out(decoder)
    );
endmodule
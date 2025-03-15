module chrono (
    input  wire clk,
    input  wire rst,
	 input wire stop,
    output wire [6:0] decoder_uni,  
    output wire [6:0] decoder_dec,  
    output wire [6:0] decoder_cent, 
    output wire [6:0] decoder_mil,
	 output wire [6:0] decoder_mill,
	 output wire [6:0] decoder_milll	 
);
    wire clk_ms;
    wire [16:0] ms_count;    

    
    clkdiv #(.CONSTANT(25000)) clk_div_ms_inst (  
        .clk(clk),
        .rst(rst),
        .clk_div(clk_ms)
    );
  
    counter_ms ms_counter_inst (
        .clk(clk_ms),
        .rst(rst),
        .count(ms_count),
		  .stop(stop)
    );
    
    wire [16:0] display_value;
    assign display_value = ms_count;
	 

    bcd display_bcd_inst (
        .A(display_value),
		  .decoder_milll(decoder_milll),
		  .decoder_mill(decoder_mill),
        .decoder_mil(decoder_mil),
        .decoder_cent(decoder_cent),
        .decoder_dec(decoder_dec),
        .decoder_uni(decoder_uni)
    );
endmodule
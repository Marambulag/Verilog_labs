module top_rom (
    input clk,
    input rst,         
    output [6:0] decoder_uni,  
    output [6:0] decoder_dec,  
    output [6:0] decoder_cent, 
    output [6:0] decoder_mil, 
    output [8:0] led           
);

    wire [15:0] max_value;     
    wire [8:0] max_index;      

  
    rom u_rom (
        .clk(clk),
        .rst(rst),
        .max_value(max_value),
        .max_index(max_index)
    );

    
    bcd display_inst (
        .A(max_value),
        .decoder_uni(decoder_uni),
        .decoder_dec(decoder_dec),
        .decoder_cent(decoder_cent),
        .decoder_mil(decoder_mil)
    );

  
    assign led = max_index;
	
endmodule
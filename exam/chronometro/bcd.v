module bcd (
    input  wire [15:0] A,  // 
    output wire [6:0] decoder_milll, 
	 output wire [6:0] decoder_mill, 
	 output wire [6:0] decoder_mil,  
    output wire [6:0] decoder_cent, 
    output wire [6:0] decoder_dec,  
    output wire [6:0] decoder_uni  
);
   wire [3:0] milll, mill, mil, cent, dec, uni;  // 

    assign uni  = A % 10;
    assign dec  = (A / 10) % 10;
    assign cent = (A / 100) % 10;
    assign mil  = (A / 1000) % 10;
    assign mill = (A / 10000) % 10; 
	 assign milll = (A / 100000) % 10;

    decoder_7seg DISPLAY_UNI (
        .decoder_in(uni),
        .decoder_out(decoder_uni)
    );
    decoder_7seg DISPLAY_DEC (
        .decoder_in(dec),
        .decoder_out(decoder_dec)
    );
    decoder_7seg DISPLAY_CENT (
        .decoder_in(cent),
        .decoder_out(decoder_cent)
    );
    decoder_7seg DISPLAY_MIL (
        .decoder_in(mil),
        .decoder_out(decoder_mil)
    );
    decoder_7seg DISPLAY_MILL ( 
        .decoder_in(mill),
        .decoder_out(decoder_mill)
    );
	 decoder_7seg DISPLAY_MILLL ( 
        .decoder_in(milll),
        .decoder_out(decoder_milll)
    );
endmodule
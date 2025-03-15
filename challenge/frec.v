module frec(
    input clk,
    input rst,       
    input signal_in, 
    output [6:0] decoder_uni, 
    output [6:0] decoder_dec, 
    output [6:0] decoder_cent, 
    output [6:0] decoder_mil, 
    output [6:0] decoder_mill, 
    output [6:0] decoder_milll  
);

    reg [31:0] contadorPulsos; 
    reg [31:0] contadorTiempo;
    reg [31:0] frecuencia;     
    reg estadoAnterior;  
	 
   
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            contadorPulsos <= 0;
            contadorTiempo <= 0;
            frecuencia <= 0;
            estadoAnterior <= 0;
        end else begin
            if (contadorTiempo < 50_000_000) begin  
                contadorTiempo <= contadorTiempo + 1;
                if (signal_in && !estadoAnterior) begin  
                    contadorPulsos <= contadorPulsos + 1;
                end
                estadoAnterior <= signal_in;
            end else begin
                frecuencia <= contadorPulsos * 11 / 10; 
                contadorPulsos <= 0;
                contadorTiempo <= 0;
            end
        end
    end

  
    bcd display_bcd (
        .frecuencia(frecuencia),
        .decoder_uni(decoder_uni),
        .decoder_dec(decoder_dec),
        .decoder_cent(decoder_cent),
        .decoder_mil(decoder_mil),
        .decoder_mill(decoder_mill),
        .decoder_milll(decoder_milll)
    );

endmodule


module decoder_7seg (
    input [3:0] decoder_in,   
    output reg [6:0] decoder_out  
);

    always @(*) begin
        case (decoder_in) 
            4'b0000: decoder_out = 7'b0000001;  
            4'b0001: decoder_out = 7'b1001111; 
            4'b0010: decoder_out = 7'b0010010;  
            4'b0011: decoder_out = 7'b0000110;  
            4'b0100: decoder_out = 7'b1001100;  
            4'b0101: decoder_out = 7'b0100100; 
            4'b0110: decoder_out = 7'b0100000;  
            4'b0111: decoder_out = 7'b0001111;  
            4'b1000: decoder_out = 7'b0000000; 
            4'b1001: decoder_out = 7'b0000100;  
            4'b1010: decoder_out = 7'b0001000;  
            default: decoder_out = 7'b1111111;  
        endcase
    end
endmodule


module bcd (
    input [31:0] frecuencia,
    output [6:0] decoder_uni, 
    output [6:0] decoder_dec, 
    output [6:0] decoder_cent, 
    output [6:0] decoder_mil, 
    output [6:0] decoder_mill, 
    output [6:0] decoder_milll
);

 
    wire [3:0] uni, dec, cent, mil, mill, milll;
    
    assign uni   = frecuencia % 10;
    assign dec   = (frecuencia / 10) % 10;
    assign cent  = (frecuencia / 100) % 10;
    assign mil   = (frecuencia / 1000) % 10;
    assign mill  = (frecuencia / 10000) % 10; 
    assign milll = (frecuencia / 100000) % 10;

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

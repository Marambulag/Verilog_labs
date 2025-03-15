`timescale 1ns/1ps
module bcd_tb#(parameter N=10, ITERACIONES = 10)();

    reg [N-1:0] BCD_in_sw;
    wire [6:0] Display_unidad;
    wire [6:0] Display_decena;
    wire [6:0] Display_centena;
    wire [6:0] Display_miles;
	 
   bcd DUT (
        .A(BCD_in_sw),           
        .decoder_uni(Display_unidad),
        .decoder_dec(Display_decena),
        .decoder_cent(Display_centena),
        .decoder_mil(Display_miles)
    );

   
    task set_input();
        begin
            BCD_in_sw = $urandom_range(0, 2**N - 1);
            $display("Valor a probar = %d", BCD_in_sw);
            #10;
        end
    endtask

    integer i;

    initial begin
        for (i = 0; i < ITERACIONES; i = i + 1) begin
            set_input();
        end
    end

endmodule
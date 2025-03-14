`timescale 1ns / 1ps 
module counter_div_tb;

  
    reg clk;
    reg rst;
    reg up_down;
    reg load;
    reg enable;
    reg [3:0] data_in;
    wire [6:0] decoder;
    
   
    counter_div uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .load(load),
        .enable(enable),
        .data_in(data_in),
        .decoder(decoder)
    );
    
    
    always begin
        #5 clk = ~clk; 
    end

    initial begin
      
        clk = 0;
        rst = 0;
        up_down = 0;
        load = 0;
        enable = 0;
        data_in = 4'b0000;
        
       
        rst = 1;
        #10;
        rst = 0;
        
       
        enable = 1;
        up_down = 1;
        load = 0;
        data_in = 4'b0000;
        
      
        #50;
        
    
        up_down = 0; 
        #50;
        
       
        load = 1;
        data_in = 4'b1010;
        #10;
        load = 0;
        
     
        up_down = 1; 
        #50;
        
        
        $finish;
    end

   
    always @(posedge clk) begin
        $display("At time %t, counter: %d, decoder: %b", $time, uut.count, decoder);
    end

endmodule


`timescale 1ns/1ps

module clkdiv_tb;
    reg clk;
    reg rst;
    wire clk_div;
    
    
    clkdiv DUT (
        .clk(clk),
        .rst(rst),
        .clk_div(clk_div)
    );
    
    
    always #5 clk = ~clk;  
    
    initial begin
       
        clk = 0;
        rst = 1;
        
       
        #20 rst = 0;  
        
        
        #20000; 
        
        $stop;
    end
    
    initial begin
        $monitor("Time=%0t clk=%b rst=%b clk_div=%b", $time, clk, rst, clk_div);
    end
endmodule

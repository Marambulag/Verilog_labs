`timescale 1ns/1ps


module debouncer(
    input clk,
    input rst_n,
    input [9:0] sw,
    output [9:0] sw_clean
);
    assign sw_clean = sw;
endmodule


module tb_top_psw;
    reg clk;
    reg rst_n;
    reg [9:0] sw;
    wire [6:0] HEX4, HEX3, HEX2, HEX1, HEX0;

    top_psw uut (
        .sw(sw),
        .clk(clk),
        .rst_n(rst_n),
        .HEX4(HEX4),
        .HEX3(HEX3),
        .HEX2(HEX2),
        .HEX1(HEX1),
        .HEX0(HEX0)
    );

   
    wire [2:0] current_state;
    assign current_state = uut.fsm_inst.state;


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

   
    initial begin
        $dumpfile("top_psw.vcd");
        $dumpvars(0, tb_top_psw);
    end


    initial begin
        // Initialize inputs
        rst_n = 0;
        sw = 10'b0;
        @(posedge clk);  
        @(posedge clk);
        rst_n = 1;      
        @(posedge clk);
        
      
        sw = 10'b00000100;
        @(posedge clk);
        sw = 10'b0;
        @(posedge clk);
        
        
        sw = 10'b00000001;
        @(posedge clk);
        sw = 10'b0;
        @(posedge clk);
        
       
        sw = 10'b00000010;
        @(posedge clk);
        sw = 10'b0;
        @(posedge clk);
        
        
        sw = 10'b01000000;
        @(posedge clk);
        sw = 10'b0;
        @(posedge clk);
        
      
        repeat (3) @(posedge clk);
        $finish;
    end

  
    initial begin
        $monitor("Time=%0t ns | sw=%b | current_state=%b | HEX4=%b HEX3=%b HEX2=%b HEX1=%b HEX0=%b",
                 $time, sw, current_state, HEX4, HEX3, HEX2, HEX1, HEX0);
    end
endmodule

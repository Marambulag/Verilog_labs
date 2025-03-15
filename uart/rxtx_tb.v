`timescale 1ns/1ps
module rxtx_tb;

  reg clk;
  reg rst;
  reg btn;
  reg [7:0] sw;
  wire [7:0] leds;
  wire serial_tx;
  
  wire serial_rx;

  assign serial_rx = serial_tx;

  top_loopback DUT (
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .sw(sw),
    .leds(leds),
    .serial_tx(serial_tx),
    .serial_rx(serial_rx)
  );

 
  initial begin
    clk = 0;
    forever #10 clk = ~clk; 
  end

 
  initial begin
    rst = 1;
    #100;
    rst = 0;
  end

 
  initial begin
    btn = 0;
    sw = 8'b10101010;

    #200;
    btn = 1;
    #20;
    btn = 0;

    #50000;
    $stop;
  end

  initial begin
    $dumpfile("rxtx_tb.vcd");
    $dumpvars(0, rxtx_tb);
  end

endmodule

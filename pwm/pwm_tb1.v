`timescale 1ns/1ps

module pwm_tb1;
    reg clk;
    reg btn_left;
    reg btn_right;
    reg rst;
    wire pwm_out;

    
    pwm DUT (
        .clk(clk),
        .btn_left(btn_left),
        .btn_right(btn_right),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

   
    task pulse_button(inout reg button);
        begin
            button = 1;
            #20;
            button = 0;
            #20;
        end
    endtask

   
    initial begin
        $monitor("Time=%t | rst=%b | btn_left=%b | btn_right=%b | target_pulse=%d | pwm_out=%b", 
                 $time, rst, btn_left, btn_right, DUT.target_pulse, pwm_out);
    end

    initial begin
        $dumpfile("pwm_tb1.vcd");
        $dumpvars(0, pwm_tb1);
    
        rst = 1;
        btn_left = 0;
        btn_right = 0;
        #50 rst = 0;

       
        pulse_button(btn_left);
        #200;
        
        
        pulse_button(btn_right);
        #200;
        
       
        pulse_button(btn_right);
        pulse_button(btn_right);
        #200;

     
        rst = 1;
        #50 rst = 0;
        
       
        #11000000; 
        $finish;
    end
endmodule

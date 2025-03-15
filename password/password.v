module fsm_controller (
    input clk,
    input rst_n,
    input [9:0] sw_rise,
    output reg [2:0] state
);
    localparam IDLE     = 3'b000,
               SW2      = 3'b001,
               SW0      = 3'b010,
               SW1      = 3'b011,
               SW6      = 3'b100,
               ERROR    = 3'b101,
               COMPLETE = 3'b110;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end
        else begin
            case(state)
                IDLE: begin
                    if (sw_rise[2]) begin
                        state <= SW2;
                    end
                    else if (|sw_rise) begin
                        state <= ERROR;
                    end
                    else begin
                        state <= IDLE;
                    end
                end
                
                SW2: begin
                    if (sw_rise[0]) begin
                        state <= SW0;
                    end
                    else if (|sw_rise) begin
                        state <= ERROR;
                    end
                    else begin
                        state <= SW2;
                    end
                end
                
                SW0: begin
                    if (sw_rise[1]) begin
                        state <= SW1;
                    end
                    else if (|sw_rise) begin
                        state <= ERROR;
                    end
                    else begin
                        state <= SW0;
                    end
                end
                
                SW1: begin
                    if (sw_rise[6]) begin
                        state <= COMPLETE;
                    end
                    else if (|sw_rise) begin
                        state <= ERROR;
                    end
                    else begin
                        state <= SW1;
                    end
                end
                
                ERROR: begin
                    state <= ERROR;
                end
                
                COMPLETE: begin
                    state <= COMPLETE;
                end
                
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

module display (
    input [2:0] state,
    output reg [6:0] HEX4, HEX3, HEX2, HEX1, HEX0
);
    always @(*) begin
        case(state)
            3'b110: begin  // COMPLETE
                HEX4 = 7'b1111111;  // Off
                HEX3 = 7'b0100001;  // d
                HEX2 = 7'b1000000;  // o
                HEX1 = 7'b1001000;  // n
                HEX0 = 7'b0000110;  // e
            end
            3'b101: begin  // ERROR
                HEX4 = 7'b0000110;  // E
                HEX3 = 7'b0101111;  // R
                HEX2 = 7'b0101111;  // R
                HEX1 = 7'b0100011;  // O
                HEX0 = 7'b0101111;  // R
            end
            default: begin  // Others
                HEX4 = 7'b1111111;  // Off
                HEX3 = 7'b1111111;  // Off
                HEX2 = 7'b1111111;  // Off
                HEX1 = 7'b1111111;  // Off
                HEX0 = 7'b1111111;  // Off
            end
        endcase
    end
endmodule

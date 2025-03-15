module rom (
    input clk,
    input rst,
    output reg [15:0] max_value,  
    output reg [7:0] max_index  
);
    reg [15:0] rom [0:255]; 
    reg [7:0] index;         

  
    initial begin
        $readmemh("Mem_hex.hex", rom);
    end

    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
           
            max_value <= 0;
            max_index <= 0;
            index <= 0;
        end 
        else begin
            if (index < 256) begin  
               
                if (rom[index] > max_value) begin
                    max_value <= rom[index];  
                    max_index <= index;     
                end
                index <= index + 1;
				    	 
            end
        end
    end
endmodule


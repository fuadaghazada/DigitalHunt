`timescale 1ns / 1ps

module ClockDivider(
                    input logic clk, reset,
                    output vgaClk, gateClock1, gateClock2, gateClock3, cursorClock
                    );
                    
    logic [26:0] count;
    logic [10:0] count2;
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if(reset)
            count <= 0;
        else
            count <= count + 1;     
    end
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if(reset)
            count2 <= 0;
        else
            count2 <= count2 + 1;     
    end
    
    assign vgaClk = count2[1];
    assign gateClock1 = count[22];
    assign gateClock2 = count[21];
    assign gateClock3 = count[20];
    assign cursorClock = count[20];
                        
endmodule
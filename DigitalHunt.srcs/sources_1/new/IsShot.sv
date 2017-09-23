`timescale 1ns / 1ps


module IsShot(
                input logic clk,
                input logic [9:0] gate_x,
                input logic [9:0] gate_y,
                input logic [9:0] gate_height,
                input logic [9:0] gate_width,
                input logic [9:0] cursor_x,
                input logic [9:0] cursor_y,
                input logic fire,
                output logic out
                );
   always_ff @(posedge clk)
        if(cursor_x > gate_x - gate_width/2 && cursor_x < gate_x + gate_width/2 && cursor_y > gate_y - (gate_height/2 + 5) && cursor_y < gate_y + (gate_height/2 + 5))
             out <= fire;
        else
            out <= 1'b0;       
    
                    
endmodule
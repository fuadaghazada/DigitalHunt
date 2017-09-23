`timescale 1ns / 1ps

module EndScreen(
                 input logic clk,
                 input logic [9:0] vga_x,
                 input logic [9:0] vga_y,
                 output logic [1:0] out
                );
    
    logic [1:0] screen;
    
    always_ff @(posedge clk)
    begin
        if(vga_x > 260 && vga_x < 300 && vga_y > 80 && vga_y < 120) //
            screen <= 2'b01;
        else if(vga_x > 360 && vga_x < 400 && vga_y > 80 && vga_y < 120) //
            screen <= 2'b01;
        else if(vga_x > 220 && vga_x < 260 && vga_y > 280 && vga_y < 320)
            screen <= 2'b00;
        else if(vga_x > 260 && vga_x < 400 && vga_y > 240 && vga_y < 280) //
            screen <= 2'b01;   
        else if(vga_x > 400 && vga_x < 440 && vga_y > 280 && vga_y < 320)
            screen <= 2'b00;    
        else if(vga_x > 220 && vga_x < 260 && vga_y > 200 && vga_y < 240)
            screen <= 2'b10;        
        else if(vga_x > 400 && vga_x < 440 && vga_y > 200 && vga_y < 240)
            screen <= 2'b10;        
        else
            screen <= 2'b11;               
    end 
    
    assign out = {screen};
                    
endmodule

`timescale 1ns / 1ps

module Background(
                    input logic clk, dir,
                    input logic [9:0] vga_x,
                    input logic [9:0] vga_y,
                    input logic [9:0] gate_x,
                    input logic [9:0] gate_y,
                    input logic [9:0] gate_height,
                    input logic [9:0] gate_width,
                    input logic [9:0] cursor_x,
                    input logic [9:0] cursor_y,
                    output logic [1:0] out 
                  );
    
    logic [1:0] background;
     
    always_ff @ (posedge clk)
    begin
        if(vga_x >= gate_x - gate_width/2 && vga_x <= gate_x + gate_width/2 && vga_y >= gate_y - gate_height/2 && vga_y <= gate_y + gate_height/2 )
            background <= 2'b00;
        
        else if(vga_x >= cursor_x - 1 &&  vga_y >= cursor_y - 1 && vga_y <= cursor_y + 1 && vga_x <= cursor_x + 1 )
            background <= 2'b01;
        else if(vga_x == cursor_x && vga_y <= cursor_y + 10 && vga_y >= cursor_y - 10)
            background <= 2'b10;  
        else if(vga_y == cursor_y && vga_x <= cursor_x + 10 && vga_x >= cursor_x - 10)
            background <= 2'b10;       
        else
            background <= 2'b11;    
        
        case(dir)
            1'b1:
                begin
                    if(vga_x >= gate_x + gate_width/2 && vga_x <= gate_x + 30 && vga_y <= gate_y + 10 && vga_y >= gate_y + 9)
                        background <= 2'b00;
                    if(vga_x >= gate_x + gate_width/2 && vga_x <= gate_x + 30 && vga_y >= gate_y - 10 && vga_y <= gate_y - 9)
                        background <= 2'b00;
                    if(vga_x <= gate_x + gate_width/2 && vga_x >= gate_x && vga_y <= gate_y + gate_height/2 + 5 && vga_y >= gate_y - gate_height/2 - 5)
                        background <= 2'b00;
                    if(vga_x <= gate_x && vga_x >= gate_x - gate_width/2 + 4 && vga_y <= gate_y + gate_height/2 + 4 && vga_y >= gate_y - gate_height/2 - 4)
                        background <= 2'b00;    
                    if(vga_x <= gate_x - 1 && vga_x >= gate_x - gate_width/2 + 3 && vga_y <= gate_y + gate_height/2 + 3 && vga_y >= gate_y - gate_height/2 - 3)
                        background <= 2'b00;
                    if(vga_x <= gate_x - 2 && vga_x >= gate_x - gate_width/2 + 2 && vga_y <= gate_y + gate_height/2 + 2 && vga_y >= gate_y - gate_height/2 - 2)
                        background <= 2'b00;
                    if(vga_x <= gate_x - 3 && vga_x >= gate_x - gate_width/2 + 1 && vga_y <= gate_y + gate_height/2 + 1 && vga_y >= gate_y - gate_height/2 - 1)
                        background <= 2'b00;
                     if(vga_x <= gate_x - 4 && vga_x >= gate_x - gate_width/2 && vga_y <= gate_y + gate_height/2 && vga_y >= gate_y - gate_height/2 )
                        background <= 2'b00;             
                                         
                end
            1'b0:
                begin
                    if(vga_x <= gate_x - gate_width/2 && vga_x >= gate_x - 30 && vga_y <= gate_y + 10 && vga_y >= gate_y + 9)
                        background <= 2'b00;
                    if(vga_x <= gate_x - gate_width/2 && vga_x >= gate_x - 30 && vga_y >= gate_y - 10 && vga_y <= gate_y - 9)
                        background <= 2'b00;
                    if(vga_x >= gate_x - gate_width/2 && vga_x <= gate_x && vga_y <= gate_y + gate_height/2 + 5 && vga_y >= gate_y - gate_height/2 - 5)
                        background <= 2'b00;
                    if(vga_x >= gate_x && vga_x <= gate_x + gate_width/2 - 4 && vga_y <= gate_y + gate_height/2 + 4 && vga_y >= gate_y - gate_height/2 - 4)
                        background <= 2'b00;    
                    if(vga_x >= gate_x + 1 && vga_x <= gate_x + gate_width/2 - 3 && vga_y <= gate_y + gate_height/2 + 3 && vga_y >= gate_y - gate_height/2 - 3)
                        background <= 2'b00;
                    if(vga_x >= gate_x + 2 && vga_x <= gate_x + gate_width/2 - 2 && vga_y <= gate_y + gate_height/2 + 2 && vga_y >= gate_y - gate_height/2 - 2)
                        background <= 2'b00;
                    if(vga_x >= gate_x + 3 && vga_x <= gate_x + gate_width/2 - 1 && vga_y <= gate_y + gate_height/2 + 1 && vga_y >= gate_y - gate_height/2 - 1)
                        background <= 2'b00;
                    if(vga_x >= gate_x + 4 && vga_x <= gate_x + gate_width/2 && vga_y <= gate_y + gate_height/2  && vga_y >= gate_y - gate_height/2 )
                        background <= 2'b00;                    
                                        
                end                         
        endcase    
            
    end
    
    assign out = background; 
                      
endmodule
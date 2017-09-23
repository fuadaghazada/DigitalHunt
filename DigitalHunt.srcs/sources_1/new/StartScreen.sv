`timescale 1ns / 1ps

module StartScreen(
                 input logic clk,
                 input logic [9:0] vga_x,
                 input logic [9:0] vga_y,
                 output logic [1:0] out
                );
    
    logic [1:0] screen;
    
    parameter letter_height = 100;
    parameter letter_width = 30;
    
    parameter a = 10;
    parameter gap = 10;
    
    parameter beginPoint = 60;
    parameter beginPoint1 = 80; //for D
    parameter beginPoint2 = beginPoint1 + gap + letter_width; //for I
    parameter beginPoint3 = beginPoint2 + gap + (letter_width/3); //for G
    parameter beginPoint4 = beginPoint3 + gap + letter_width; //for I
    parameter beginPoint5 = beginPoint4 + gap + (letter_width/3); //for T
    parameter beginPoint6 = beginPoint5 + gap + letter_width; //for A
    parameter beginPoint7 = beginPoint6 + gap + letter_width; //for L
    
    
    parameter beginPoint8 = beginPoint7 + letter_width + 50;
    parameter beginPoint9 = beginPoint8 + gap + letter_width;
    parameter beginPoint10 = beginPoint9 + gap + letter_width;
    parameter beginPoint11 = beginPoint10 + gap + letter_width;
    
    //play sign
    parameter beginPointP = 240;
    parameter beginXpoint = 260;
    parameter length = 80;
        
    
    
    always_ff @(posedge clk)
    begin
        if(vga_x >= beginPoint1 && vga_x <= beginPoint1 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint1 + a && vga_x <= beginPoint1 + 2*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00; 
        else if(vga_x >= beginPoint1 + a && vga_x <= beginPoint1 + 2*a && vga_y >= beginPoint + letter_height - a && vga_y <= beginPoint + letter_height  )
            screen <= 2'b00;
        else if(vga_x >= beginPoint1 + 2*a && vga_x <= beginPoint1 + 3*a && vga_y >= beginPoint + a && vga_y <= beginPoint + letter_height - a)
            screen <= 2'b00;
        //
        else if(vga_x >= beginPoint2 && vga_x <= beginPoint2 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        //
        else if(vga_x >= beginPoint3 && vga_x <= beginPoint3 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
                screen <= 2'b00;
        else if(vga_x >= beginPoint3 + a && vga_x <= beginPoint3 + 2*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
                screen <= 2'b00;                        
        else if(vga_x >= beginPoint3 + a && vga_x <= beginPoint3 + 2*a && vga_y >= beginPoint + 4*a && vga_y <= beginPoint + 5*a)
                screen <= 2'b00;
        else if(vga_x >= beginPoint3 + a && vga_x <= beginPoint3 + 2*a && vga_y >= beginPoint + letter_height - a && vga_y <= beginPoint + letter_height)
                screen <= 2'b00;
        else if(vga_x >= beginPoint3 + 2*a && vga_x <= beginPoint3 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
                screen <= 2'b00;
        else if(vga_x >= beginPoint3 + 2*a && vga_x <= beginPoint3 + 3*a && vga_y >= beginPoint + 4*a && vga_y <= beginPoint + letter_height)
                screen <= 2'b00;                                                         
        //
        else if(vga_x >= beginPoint4 && vga_x <= beginPoint4 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;           
        //
        else if(vga_x >= beginPoint5 && vga_x <= beginPoint5 + a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00;
        else if(vga_x >= beginPoint5 + a && vga_x <= beginPoint5 + 2*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint5 + 2*a && vga_x <= beginPoint5 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00;                          
        //
        else if(vga_x >= beginPoint6 && vga_x <= beginPoint6 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint6 + a && vga_x <= beginPoint6 + 2*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00;                        
        else if(vga_x >= beginPoint6 + a && vga_x <= beginPoint6 + 2*a && vga_y >= beginPoint + 4*a && vga_y <= beginPoint + 5*a)
            screen <= 2'b00;            
        else if(vga_x >= beginPoint6 + 2*a && vga_x <= beginPoint6 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;             
        //
        else if(vga_x >= beginPoint7 && vga_x <= beginPoint7 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;           
        else if(vga_x >= beginPoint7 + a && vga_x <= beginPoint7 + 3*a && vga_y >= beginPoint + letter_height - a && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;  
        //
        //
        //
        else if(vga_x >= beginPoint8 && vga_x <= beginPoint8 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint8 + a && vga_x <= beginPoint8 + 2*a && vga_y >= beginPoint + 4*a && vga_y <= beginPoint + 5*a)
            screen <= 2'b00;            
        else if(vga_x >= beginPoint8 + 2*a && vga_x <= beginPoint8 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        //     
        else if(vga_x >= beginPoint9 && vga_x <= beginPoint9 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint9 + a && vga_x <= beginPoint9 + 2*a && vga_y >= beginPoint + letter_height - a && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;            
        else if(vga_x >= beginPoint9 + 2*a && vga_x <= beginPoint9 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        //
        else if(vga_x >= beginPoint10 && vga_x <= beginPoint10 + a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint10 + a && vga_x <= beginPoint10 + 15 && vga_y >= beginPoint + 4*a && vga_y <= beginPoint + 5*a)
            screen <= 2'b00;
        else if(vga_x >= beginPoint10 + 15 && vga_x <= beginPoint10 + 2*a && vga_y >= beginPoint + 5*a && vga_y <= beginPoint + 6*a)
            screen <= 2'b00;                          
        else if(vga_x >= beginPoint10 + 2*a && vga_x <= beginPoint10 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;            
        //
        else if(vga_x >= beginPoint11 && vga_x <= beginPoint11 + a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00;
        else if(vga_x >= beginPoint11 + a && vga_x <= beginPoint11 + 2*a && vga_y >= beginPoint && vga_y <= beginPoint + letter_height)
            screen <= 2'b00;
        else if(vga_x >= beginPoint11 + 2*a && vga_x <= beginPoint11 + 3*a && vga_y >= beginPoint && vga_y <= beginPoint + a)
            screen <= 2'b00;   
        
        //
        else if(vga_x >= beginXpoint && vga_x <= beginXpoint + 10 && vga_y >= beginPointP && vga_y <= beginPointP + length)
            screen <= 2'b01;
        else if(vga_x >= beginXpoint + 10 && vga_x <= beginXpoint + 20 && vga_y >= beginPointP + 5 && vga_y <= beginPointP + length - 5)
            screen <= 2'b01;
        else if(vga_x >= beginXpoint + 20 && vga_x <= beginXpoint + 30 && vga_y >= beginPointP + 10 && vga_y <= beginPointP + length - 10)
            screen <= 2'b01;
        else if(vga_x >= beginXpoint + 30 && vga_x <= beginXpoint + 40 && vga_y >= beginPointP + 15 && vga_y <= beginPointP + length - 15)
            screen <= 2'b01;                    
        else if(vga_x >= beginXpoint + 40 && vga_x <= beginXpoint + 50 && vga_y >= beginPointP + 20 && vga_y <= beginPointP + length - 20)
            screen <= 2'b01;                                                   
        else if(vga_x >= beginXpoint + 50 && vga_x <= beginXpoint + 60 && vga_y >= beginPointP + 25 && vga_y <= beginPointP + length - 25)
            screen <= 2'b01;   
        else if(vga_x >= beginXpoint + 60 && vga_x <= beginXpoint + 70 && vga_y >= beginPointP + 30 && vga_y <= beginPointP + length - 30)
            screen <= 2'b01;                                                   
        else if(vga_x >= beginXpoint + 70 && vga_x <= beginXpoint + 80 && vga_y >= beginPointP + 35 && vga_y <= beginPointP + length - 35)
            screen <= 2'b01;   
                                                        
        else
            screen <= 2'b11;                               
    end 
    
    assign out = {screen};
                    
endmodule

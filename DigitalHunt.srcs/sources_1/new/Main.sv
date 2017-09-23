`timescale 1ns / 1ps

module Main(
            input logic clk, reset, right, left, up, down, fire, start,
            output logic hsync, vsync, tempLed, dp,
            output logic [3:0] red,
            output logic [3:0] green,
            output logic [3:0] blue,
            output logic [6:0] leds,
            output logic [3:0] anode,
            
            output  logic oe, 
            output logic  SH_CP, 
            output logic ST_CP, 
            output logic reset2, 
            output logic DS,
            output logic [7:0] rows 
            );
 
    logic vidOn;
    logic [9:0] pixelX;
    logic [9:0] pixelY;
    
    logic [9:0] width;
    logic [9:0] height;
    logic [9:0] X;
    logic [9:0] Y;
    logic dir;
    
    logic [9:0] width_cursor;
    logic [9:0] height_cursor;
    logic [9:0] X_cursor;
    logic [9:0] Y_cursor;
    logic fired;
    
    logic [1:0] background;
    logic [1:0] screen; //endscreen
    logic [1:0] screen2; //main screen
    
    logic vgaClk;
    logic gateClk1;
    logic gateClk2;
    logic gateClk3;
    logic gateClkOut;
    logic cursorClk;
    
    logic [3:0] score;
    logic [1:0] diffLevel;
    logic [2:0] missed;
    logic isGameOver;
    logic isWon;
    
    
    logic firstDigit;
    logic [3:0] secondDigit;
    always
    begin
        if(score < 10)
        begin
            firstDigit <= 0;
            secondDigit <= score;
        end    
        else
        begin
            firstDigit <= 1;
            secondDigit <= score - 10;
        end     
    end        
              
    always
        tempLed <= fired;    
   
    ClockDivider clkdvdr(clk, reset, vgaClk, gateClk1, gateClk2, gateClk3, cursorClk);
    
    SpeedOfGates sog(clk, gateClk1, gateClk2, gateClk3, diffLevel, gateClkOut);
    
    VGA_Monitor vga(vgaClk, reset, hsync, vsync, vidOn, pixelX, pixelY);
    
    IsShot is(cursorClk, X, Y, height, width, X_cursor, Y_cursor, fire, fired);
    
    GameState gs(gateClkOut, reset, fired, diffLevel, isWon, score);
    
    SevSeg_4digit svndgt(clk, diffLevel + 1, 7 - missed, firstDigit, secondDigit, leds[6], leds[5], leds[4], leds[3], leds[2], leds[1], leds[0], dp, anode);
    
    DotMatrix dm(clk, diffLevel, oe, SH_CP, ST_CP, reset2, DS, rows);
    
    Crosshair crs(cursorClk, reset,  X_cursor, Y_cursor, right, left, up, down, X_cursor, Y_cursor);
    
    FlyingGates gates(gateClkOut, reset, fired, isWon, start, X, Y, isGameOver, dir, missed, height, width, X, Y);
    
    Background bg(vgaClk, dir, pixelX, pixelY, X, Y, height, width, X_cursor, Y_cursor, background);
    
    EndScreen(vgaClk, pixelX, pixelY, screen);
      
    StartScreen(vgaClk, pixelX, pixelY, screen2);  
      
    Color c(clk, reset, start, background, vidOn, isGameOver, isWon, screen, screen2, red, green, blue);
     
                
            
endmodule
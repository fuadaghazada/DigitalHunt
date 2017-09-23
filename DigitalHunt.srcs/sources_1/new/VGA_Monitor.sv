`timescale 1ns / 1ps


module VGA_Monitor (
                      input logic vgaclk, //25Mhz
                      input logic reset, //asynchronus reset
                      output logic hsync,
                      output logic vsync,
                      output logic vidOn, //Looks when the screen is active
                      output logic [9:0]pixelX, //x goes up to 640 so we need 10 bits because 2^9=512 and 2^10=1024
                      output logic [9:0]pixelY);
                      
    parameter maximumHorizontalPixels = 800; //MAximum pixels in a line
    parameter hbp = 144; //End of the horizontal back porch time
    parameter hfp = 784; //Start of horizontal front porch time
    parameter hPulse = 96;
    
    parameter maximumVerticalLines = 521; //Maximum lines in the screen
    parameter vbp = 30; //End of the vertical back porch time
    parameter vfp = 511; //Start of vertical front porch time
    parameter vPulse = 2;   
    
    
    logic [9:0] hcnt;
    logic [9:0] vcnt;
    
    always @(posedge vgaclk, posedge reset)
        begin
            if (reset)
            begin
                hcnt <= 0;
                vcnt <= 0;
            end
            else
            begin
                if (hcnt < maximumHorizontalPixels - 1)
                    hcnt <= hcnt + 1;
                else
                begin
                    hcnt <= 0;
                    if (vcnt < maximumVerticalLines - 1)
                        vcnt <= vcnt + 1;
                    else
                        vcnt <= 0;
                end
                
            end
        end
        
    assign hsync = (hcnt < hPulse) ? 0:1;
    assign vsync = (vcnt < vPulse) ? 0:1;
    
  
    always_comb
    begin
        if (hcnt >= hbp && hcnt < hfp && vcnt >= vbp && vcnt < vfp)
        begin
            pixelX <= hcnt - hbp; // pixelX 
            pixelY <= vcnt - vbp; // pixelY 
            vidOn <= 1;           // active dýsplay
        end
        else
        begin
            pixelX <= 0;
            pixelY <= 0;
            vidOn <= 0; //ýnactýve dýsplay
        end
    end    
	 	
    
endmodule

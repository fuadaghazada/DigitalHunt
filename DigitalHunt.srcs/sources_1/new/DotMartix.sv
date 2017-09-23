`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 04:03:17 PM
// Design Name: 
// Module Name: DotMatrix
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DotMatrix(
                input clk,
                output  logic oe, //output enable
                
                output logic  SH_CP, // shift register clk pulse
                output logic ST_CP, // store register clk pulse
                output logic reset, // reset for the shift register
                /*output reg [7:0] blue2,*/
                output logic DS, // digital signal
                /*output reg [7:0] KATOT,*/
                output logic [7:0] rows      
);
            logic [24:1] message;
            logic [7:0] red;
            
             initial begin
                          red = 8'hFF;
                          rows  =  8'b00000000;

                       end
         
                
               assign message[24:17] = red;
               logic f;
               logic e;
               
               logic [1:0] counter;
               logic [8:0] i = 1; // --data signalin seri olarak iletilmesini kontrol eder.
               logic [2:0] a = 0;
               logic [9:0] d = 0;       
               
               
               always@(posedge clk)
                           begin
                               counter = counter+1;
                               f<= counter[1]; // clk signal for the shift register
                               e<= ~f;
                           end    
                               //------------------------------------------------------------
                           always@( posedge e)
                               begin    
                               //seri olarak datayý almak için her clk pulse tan sonra i bir arttýrýlýyor.
                                   i = i+9'b000000001;
                               end    
                       
                           always@(*)
                               begin
                                   if (i < 9'b000000100) // baþlangýçta i 4'e gelene kadar sisteme reset atýlýr.
                                       reset<=0;
                                   else
                                       reset<=1;
                                   if (i>9'b000000011 && i<9'b000011100) //4'le 27 arasýnda data akýþý seri olarak.
                                       DS<=message[i-9'b000000011];
                                   else 
                                       DS<=0;
                                       
                                   if (i<9'b000011100) //i 28'e geldiðinde data akýþý datamlanýyor.24 bit data alýnmýþ oluyor. bu sureden sonra clk durduluyor yeni data akýþýna kadar.
                                       begin
                                           SH_CP<=f;             
                                           ST_CP<=e;
                                       end
                                       
                                   else
                                       begin
                                           SH_CP<=0;
                                           ST_CP<=1;
                                       end
                       end
                       always @(posedge f)//clk un durduðu surede OE=0 yani output registerin çýkýþýnda aktif durumda.
                             begin
                               if (i>9'b000011100 && i<9'b110011101)
                                oe<=0;
                               else
                                      oe<=1;
                               end        
                              always @(posedge f) //bir satýr tamamlandýðýnda a bir arttýrýlýyor 2. satýra geçmek için.
                               begin    
                                       if (i==(9'b000011100 + 9'b110011101)/2)
                                        begin
                                   a = a;
                                    
                         end
                       end
                       
                       always @(posedge f) //satrlar ve sutunlar tamamlandýðýnda yeni görüntü için(ful ekran) d bir arttýrýlýyor.
                       begin    
                             if (i==9'b110011110)
                             if (a==7) 
                                               d=d+1;
                       end      
                       
                                logic[26:0] count=0;
                                logic clk_en;
                                always@(posedge clk)
                                begin
                                count<=count+1;
                                if(count==27'd50000000)
                                begin
                                clk_en=1;
                                count<=27'd0;
                                end
                                else
                                clk_en=0;
                                end  
                                
                            always@(a)
                               begin
                                
                                    if(clk_en)
                                    begin
                                    case(a)
                                    3'b000:begin
                                    rows<=8'b00010000;
                                    red<=8'b11011111;  
                                    end
                                    3'b001:begin
                                    rows<=8'b00000010;
                                    red<=8'b11011111;
                                    end
                                    3'b010:begin
                                    rows<=8'b00000100;
                                    red<=8'b11011111;
                                    end
                                    3'b011:begin
                                    rows<=8'b00001000;
                                    red<=8'b11011111;
                                    end
                                    3'b100:begin
                                    rows<=8'b00010000;
                                    red<=8'b11011111;
                                    end
                                    3'b101:begin
                                    rows<=8'b00100000;
                                    red<=8'b11011111;    
                                    end        
                                    3'b110:begin
                                    rows<=8'b01000000;   
                                    red<=8'b11011111; 
                                    end  
                                    3'b111:begin
                                    rows<=8'b10000000;   
                                    red<=8'b11011111; 
                                    end 
                                    endcase                         
                                    end
                                end
                       endmodule
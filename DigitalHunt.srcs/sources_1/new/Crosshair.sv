`timescale 1ns / 1ps


module Crosshair(
                input logic clk, reset,
                input logic [9:0] currentX,
                input logic [9:0] currentY,
                input logic right, left, up, down,
                output logic [9:0] X,
                output logic [9:0] Y                    
             );
    
    //internal variables
    parameter beginX = 320;            
    parameter beginY = 240;
       
    always_ff@(posedge clk, posedge reset)
       begin
           if(reset)
               begin
                    currentX <= beginX;        //reseting the positons to the beginning
                    currentY <= beginY;
               end
           else
               begin
                   if(right)
                   begin
                        if(currentX + 10 < 640)
                            begin                     //end of the monitor
                                currentX <= currentX + 10;
                                currentY <= currentY;
                            end
                        else
                           begin
                               begin
                                   currentX <= 0;
                                   currentY <= currentY;
                               end                         
                           end            
                   end
                   
                    else if(left)
                    begin
                      if(currentX - 10 > 0)   
                          begin   //end of the monitor
                                currentX <= currentX - 10;
                                currentY <= currentY;
                          end      
                      else
                         begin
                             begin
                                 currentX <= 640;
                                 currentY <= currentY;
                             end                         
                         end            
                    end 
                    
                     else if(up)
                      begin
                           if(currentY - 10 < 480)  
                               begin    //end of the monitor
                                    currentY <= currentY - 10;
                                    currentX <= currentX;
                               end     
                           else
                              begin
                                  begin
                                      currentX <= currentX;
                                      currentY <= 480;
                                  end                         
                              end            
                      end 
                      
                       else if(down)
                        begin
                             if(currentY + 10 > 0) 
                                begin     //end of the monitor
                                    currentY <= currentY + 10;
                                    currentX <= currentX;
                                end
                             else
                                begin
                                    begin
                                        currentX <= currentX;
                                        currentY <= 0;
                                    end                         
                                end            
                        end
                        
                        else
                            begin
                                currentX <= currentX;
                                currentY <= currentY;
                            end   
                end
        end
   
    //assigning outputs        
    assign X = currentX;
    assign Y = currentY;
             
endmodule
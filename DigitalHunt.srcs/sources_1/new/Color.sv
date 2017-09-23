`timescale 1ns / 1ps


module Color(
             input logic clk, reset, start,
             input logic [1:0] background, 
             input logic vidOn, isGameOver, isWon,  
             input logic [1:0] screen,
             input logic [1:0] screen2,
             output logic [3:0] red,
             output logic [3:0] green,
             output logic [3:0] blue     
             );
    
    always_ff @(posedge clk)
    begin
         if(vidOn)
                if(start)
                begin
                    if(~isGameOver && ~isWon)
                        case(background)
                            2'b00: 
                                begin
                                    red <= 4'b0000;
                                    green <= 4'b0000;
                                    blue <= 4'b1111;
                                end
                            2'b01:
                                begin
                                    red <= 4'b1111;
                                    green <= 4'b0000;
                                    blue <= 4'b0000;
                                end
                            2'b10:
                                begin
                                  red <= 4'b1111;
                                  green <= 4'b1111;
                                  blue <= 4'b1111;
                                end    
                            2'b11:
                                begin
                                 red <= 4'b0000;
                                 green <= 4'b0000;
                                 blue <= 4'b0000;
                                end          
                         endcase  
                    else if(isWon)
                        begin
                            case (screen)
                                2'b10:
                                    begin
                                        red <= 4'b0000;
                                        green <= 4'b1111;
                                        blue <= 4'b0000;
                                    end 
                                2'b01:
                                    begin
                                        red <= 4'b0000;
                                        green <= 4'b1111;
                                        blue <= 4'b0000;
                                    end        
                                2'b11:
                                    begin
                                        red <= 4'b0000;
                                        green <= 4'b0000;
                                        blue <= 4'b0000;
                                    end    
                            endcase    
                        end
                    else if(isGameOver)
                        begin
                            case (screen)
                                2'b00:
                                    begin
                                        red <= 4'b1111;
                                        green <= 4'b0000;
                                        blue <= 4'b0000;
                                    end 
                                2'b01:
                                    begin
                                        red <= 4'b1111;
                                        green <= 4'b0000;
                                        blue <= 4'b0000;
                                    end        
                                2'b11:
                                    begin
                                        red <= 4'b0000;
                                        green <= 4'b0000;
                                        blue <= 4'b0000;
                                    end    
                            endcase    
                        end
                 end
                 else
                 begin   
                    case(screen2)
                     2'b00:
                         begin
                             red <= 4'b1000;
                             green <= 4'b0000;
                             blue <= 4'b0000;
                         end
                     2'b01:
                         begin
                             red <= 4'b0000;
                             green <= 4'b1000;
                             blue <= 4'b0000;
                         end                         
                     2'b11:
                         begin
                             red <= 4'b0000;
                             green <= 4'b0000;
                             blue <= 4'b0000;
                         end                         
                 endcase
                 end                                     
        else
            begin
                red <= 4'b0000;
                green <= 4'b0000;
                blue <= 4'b0000;
            end     
    end            
endmodule
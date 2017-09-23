`timescale 1ns / 1ps


module FlyingGates(
                    input logic  clk, reset, fire, isWon, start,
                    input logic [9:0] currentX, 
                    input logic [9:0] currentY,                   
                    output logic isGameOver, direction,
                    output logic [2:0] miss,
                    output logic [9:0] height, 
                    output logic [9:0] width,
                    output logic [9:0] outX, 
                    output logic [9:0] outY
                  );
                             
    //internal variables
    parameter WIDTH =  10'b0000011110;
    parameter HEIGHT = 10'b0000011110;
    
    //beginning x position
    parameter beginX1 = 20;

    //assigning the dimensions of the logic blocks
    assign height = HEIGHT;
    assign width = WIDTH;

    //direction of the flying gate
    logic dir;
     
    //missed shots
    logic [2:0] missed;
       
     //internal constants for y
     parameter Y0 = 40;
     parameter Y1 = 100;
     parameter Y2 = 160;
     parameter Y3 = 220;
     parameter Y4 = 280;         
     parameter Y5 = 340;
     parameter Y6 = 400;
     parameter Y7 = 450;    
   
          
     logic [2:0] count;
     logic [2:0] select;

    
    //state regsiter
    always_ff@(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                 currentX <= beginX1;        //reseting the positons to the beginning
                 select <= count;
                 missed <= 0;
            end
        else
            begin                          
                if(count < 3'b111)
                    count <= count + 1; 
                else
                    count <= 0;
                
                if(start)
                    begin
                    
                    if(missed < 3'b111 && ~isWon)
                    begin
                        
                        isGameOver <= 0;    
                        
                        if(~fire)
                            case(dir)
                            1'b0:
                                begin
                                  if(currentX < 640)
                                    begin                           
                                        currentX <= currentX + 10;
                                                                        
                                        if(count < 3'b111)
                                            count <= count + 1; 
                                        else
                                            count <= 0;
                                    end
                                  else
                                    begin
                                        
                                        if(missed < 3'b111)
                                            missed <= missed + 1;  
                                        
                                        dir <= 1'b1;                   
                                        select <= count;
                                        
                                    end
                                end
                            1'b1:
                                begin
                                  if(currentX > 0)
                                    begin                           
                                        currentX <= currentX - 10;
                                        
                                        if(count < 3'b111)
                                            count <= count + 1; 
                                        else
                                            count <= 0;
                                    end
                                  else
                                    begin
                                        
                                        if(missed < 3'b111)
                                            missed <= missed + 1;  
         
                                        dir <= 1'b0;
                                        select <= count;
                                        
                                    end
                                end
                            endcase
                        else
                            begin
                                if(dir)
                                    currentX <= 640;
                                else
                                    currentX <= 0;    
                                select <= count;
                            end
                     end
                      else if(isWon)
                            begin
                                currentX <= currentX;
                                currentY <= currentY;
                            end
                         
                            else
                                begin
                                    currentX <= currentX;
                                    currentY <= currentY;
                                    isGameOver <= 1'b1;
                                end
                            end            
                else
                begin
                    currentX <= currentX;
                    currentY <= currentY;        //reseting the positons to the beginning
                    missed <= missed; 
                end
                end     
                
               
     end

     always_comb
        case(select)
             
            3'b000 :  currentY <= Y5;
            3'b001 :  currentY <= Y7;
            3'b010 :  currentY <= Y2;
            3'b011 :  currentY <= Y1;
            3'b100 :  currentY <= Y4;
            3'b101 :  currentY <= Y0;
            3'b110 :  currentY <= Y6;
            3'b111 :  currentY <= Y3;
                      
        endcase
    
    always_comb
        begin
            miss <= missed;
            direction <= dir;
        end

    //assigning outputs      
    assign outX = currentX;
    assign outY = currentY;        

                
endmodule
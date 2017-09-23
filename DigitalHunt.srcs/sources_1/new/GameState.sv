`timescale 1ns / 1ps

module GameState(
                  input logic clk, reset,
                  input logic fired, 
                  input logic [1:0] difficultyLevel,
                  output logic isWon,
                  output logic [3:0] score  
                );
    
    logic [3:0] count;
    logic [1:0] diffL;
    
    logic [3:0] levelCount;
    
    always_ff @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                count <= 4'b0;
                diffL <= 2'b00;
                isWon <= 0;
                levelCount <= 4'b0101;
            end
        else if(fired)
            begin       
                
                isWon <= 0;
                
                if(count < levelCount - 1)
                    begin
                        count <= count + 1;
                    end 
                else
                    begin
                        //count <= 3'b0;
                        if(difficultyLevel < 2'b10)
                            begin
                                count <= count + 1;
                                diffL <= diffL + 1;
                                levelCount <= levelCount + 4'b0101;
                            end
                        else
                            begin
                                count <= count + 1;
                                isWon <= 1'b1;
                            end        
                    end        
            end
        else 
            begin
                count <= count;

            end            
    end                
    
    assign score = {count};
    assign difficultyLevel = {diffL};           
                
endmodule

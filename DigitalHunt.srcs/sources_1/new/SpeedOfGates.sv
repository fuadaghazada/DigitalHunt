`timescale 1ns / 1ps


module SpeedOfGates(
                    input logic clk, clk1, clk2, clk3, 
                    input logic [1:0] diff, 
                    output logic clock_out
                    );
    
    always_ff @(posedge clk)
        case(diff)
        
            2'b00: begin 
                        clock_out <= clk1;
                   end
            2'b01: begin
                        clock_out <= clk2;
                   end            
            2'b10: begin 
                        clock_out <= clk3;
                   end     
            
            default : begin
                        clock_out <= clk1;
                      end
        endcase       
                            
endmodule

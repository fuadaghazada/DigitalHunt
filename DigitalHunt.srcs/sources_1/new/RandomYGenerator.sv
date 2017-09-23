`timescale 1ns / 1ps



module RandomYGenerator(
                        input logic clk, reset,
                        input logic [9:0] gate_x,               
                        output logic [9:0] randomY
                        );
    
    //internal constants for y
    parameter Y0 = 60;
    parameter Y1 = 120;
    parameter Y2 = 200;
    parameter Y3 = 400;
    
    logic [1:0] count;
    logic [1:0] select;
    
    always_ff @(posedge clk, posedge reset)
    begin
        if (gate_x == 640 || reset)
            select <= count;
        else
            begin
                if(count < 2'b11)
                    count <= count + 1; 
                else
                    count <= 0;    
            end   
    end
    
     always_comb
        case(select)
            
            2'b00 :  randomY <= Y1;
            2'b01 :  randomY <= Y1;
            2'b10 :  randomY <= Y2;
            2'b11 :  randomY <= Y3;
                    
        endcase
                        
                        
endmodule
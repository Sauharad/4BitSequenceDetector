`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2024 01:52:44
// Design Name: 
// Module Name: detectorsim
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


module detectorsim;
    reg clk, x, reset; wire z;
    detector SEQ(x, clk, reset, z);
    
    initial 
        begin
            $dumpfile("sequence.vcd"); $dumpvars(0, detectorsim);
            clk = 1'b0; reset = 1'b1;
            #15 reset = 1'b0;
        end
        
    always #5 clk = ~clk;
    
    initial
        begin
            #12 x=0; #10 x=0; #10 x=1; #10 x=1;
            #10 x=0; #10 x=1; #10 x=1; #10 x=0;
            #10 x=0; #10 x=1; #10 x=1; #10 x=0;
            #10 $finish;
        end
endmodule

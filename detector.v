`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2024 01:39:03
// Design Name: 
// Module Name: detector
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
module detector(x, clk, reset, z);
    input x, clk, reset;
    output reg z;
    parameter s0=0,s1=1,s2=2,s3=3;
    reg [0:1] ps,ns;
    
    always @(posedge clk or posedge reset)
        begin
            if (reset) ps <= s0;
            else ps<=ns;
        end
        
    always @ (*)
        begin
            case (ps)
                s0: begin
                        z = x? 0:0;
                        ns= x? s0:s1;
                    end
                s1: begin
                        z = x? 0:0;
                        ns= x? s2:s1;
                    end
                s2: begin
                        z = x? 0:0;
                        ns= x? s3:s1;
                    end
                s3: begin
                        z = x? 0:1;
                        ns= x? s0:s1;
                    end
                endcase
        end
endmodule

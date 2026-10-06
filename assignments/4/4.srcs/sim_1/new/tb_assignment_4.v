`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:44:54 PM
// Design Name: 
// Module Name: tb_assignment_4
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


module tb_assignment_4();
    reg CLK = 0; 
    reg rst = 1;
    reg X = 0;
    
    wire S1;
    wire V1;
    wire S2;
    wire V2;
    
    reg [11:0] seq = 12'b1011_1100_1101;
    
    integer i;
    
    assignment_4_behavior uut_behavior (CLK, rst, X, S1, V1);
    assignment_4_dataflow uut_dataflow (CLK, rst, X, S2, V2);
    
    always #5 CLK = ~CLK;
    
    initial begin
        $monitor("X=%b S1=%b V1=%b S2=%b V2=%b", X, S1, V1, S2, V2);
        X = seq[0]; #2 rst = 0;
        
        for (i = 1; i < 12; i = i + 1) begin
          #5; X = seq[i];
        end
        
        #10 $finish;
        end
endmodule
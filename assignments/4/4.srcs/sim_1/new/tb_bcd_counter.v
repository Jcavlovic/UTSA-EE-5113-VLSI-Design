`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:47:10 PM
// Design Name: 
// Module Name: tb_bcd_counter
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


module tb_bcd_counter();
    reg CLK = 0;
    reg CLR = 0;
    reg ENABLE = 0;
    reg LOAD = 0;
    reg UP = 0;
    reg  [3:0] D = 0;
    wire [3:0] Q;
    wire CO;

    bcd_counter uut (CLK, CLR, ENABLE, LOAD, UP, D, Q, CO);

    always #5 CLK = ~CLK;

    initial begin
        $monitor("%t CLR=%b EN=%b LD=%b UP=%b D=%d Q=%d CO=%b",
                 $time, CLR, ENABLE, LOAD, UP, D, Q, CO);
        #2;  CLR = 1; LOAD = 1; ENABLE = 1; D = 4'd6;
        #8;  LOAD = 0; UP = 1;
        #40; UP = 0;
        #10; ENABLE = 0; CLR = 0;
        #20; $finish;
    end
endmodule
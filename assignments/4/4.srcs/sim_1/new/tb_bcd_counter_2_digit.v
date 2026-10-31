`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:49:09 PM
// Design Name: 
// Module Name: tb_bcd_counter_2_digit
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


module tb_bcd_counter_2_digit();
    reg CLK = 0;
    reg CLR = 0;
    reg ENABLE = 0;
    reg LOAD = 0;
    reg UP = 0;
    reg [3:0] D1 = 0;
    reg [3:0] D2 = 0;
    wire [3:0] Q1;
    wire [3:0] Q2;
    wire CO;

    bcd_counter_2digit uut (CLK, CLR, ENABLE, LOAD, UP, D1, D2, Q1, Q2, CO);

    always #5 CLK = ~CLK;

    initial begin
        $monitor("%t CLR=%b EN=%b LD=%b UP=%b Q=%d%d CO=%b",
                 $time, CLR, ENABLE, LOAD, UP, Q2, Q1, CO);
        #2;  CLR = 1; LOAD = 1; ENABLE = 1; D2 = 4'd9; D1 = 4'd7;
        #8;  LOAD = 0; UP = 1;
        #50; ENABLE = 0;
        #20; ENABLE = 1; UP = 0;
        #40; ENABLE = 0; CLR = 0;
        #20; $finish;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UTSA EE-5113 VLSI Design
// Engineer: Jordan Cavlovic
// 
// Create Date: 09/09/2026 10:56:12 PM
// Design Name: Assignment 2
// Module Name: subtractor
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


module subtractor(
        input a,
        input b,
        input bin,
        output bout,
        output diff
    );
    
    assign bout = (b & bin) | (~a & b) | (~a & bin);
    assign diff = (a & b & bin) | (a & ~b & ~bin) | (~a & b & ~bin) | (~a & ~b & bin);
    
endmodule


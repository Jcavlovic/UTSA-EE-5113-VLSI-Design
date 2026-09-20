`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2026 11:26:22 PM
// Design Name: 
// Module Name: alu4bit
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


module alu4bit(
        input [3:0] a,
        input [3:0] b,
        input [2:0] ctrl,
        input cin,
        output reg cout,
        output reg [3:0] out
    );

    wire out_or;
    wire out_and;
    
    wire [4:0] out_add;
    wire [4:0] out_sub;
    
    or or1 (out_or, a, b);
    and and1 (out_and, a, b);
    
    assign out_add = a + b + cin;
    assign out_sub = a - b - cin;
    
    always@(*) begin
        cout = 1'b0;
        out = 4'b0000;
        
        case (ctrl)
            3'b000 : {cout, out} = out_add; // Dataflow
            3'b001 : {cout, out} = out_sub; // Dataflow
            3'b010 : out = out_or; // Gate level
            3'b011 : out = out_and; // Gate level
            3'b100 : out = {a[2:0], 1'b0}; // Behavioral
            3'b101 : out = {1'b0, a[3:1]}; // Behavioral
            3'b110 : out = {a[2:0], a[3]}; // Behavioral
            3'b111 : out = {a[0], a[3:1]}; // Behavioral
            default : {cout, out} = 5'b00000;
            endcase
        end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2026 11:02:20 PM
// Design Name: 
// Module Name: tb_substractor
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


module tb_subtractor(
    );
    
    reg a;
    reg b;
    reg bin;
    wire bout;
    wire diff;
    
    subtractor s1(
    .a(a),
    .b(b),
    .bin(bin),
    .bout(bout),
    .diff(diff)
    );
    
    initial begin
        $display("A | B | Bin | Diff | Bout");
        $monitor(" %b | %b | %b | %b | %b", a, b, bin, bout, diff);
        
        a = 1'b0; b = 1'b0; bin = 1'b0; #5;
        a = 1'b0; b = 1'b0; bin = 1'b1; #5;
        a = 1'b0; b = 1'b1; bin = 1'b0; #5;
        a = 1'b0; b = 1'b1; bin = 1'b1; #5;
        
        a = 1'b1; b = 1'b0; bin = 1'b0; #5;
        a = 1'b1; b = 1'b0; bin = 1'b1; #5;
        a = 1'b1; b = 1'b1; bin = 1'b0; #5;
        a = 1'b1; b = 1'b1; bin = 1'b1; #5;
        
    end
endmodule

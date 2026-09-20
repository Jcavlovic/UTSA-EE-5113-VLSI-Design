`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 10:09:08 PM
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder(
    );

    reg [31:0] a, b;
    wire [31:0] sum;
    wire cin, cout;

    assign cin = 1'b0;

    thirtytwo_full_adder uut0(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        $display("A          |      B     |       Sum");
        $monitor("%d | %d | %d", a, b, sum);

        a = 32'h00000000; b = 32'h00000001; #10;
        a = 32'h00000001; b = 32'h00000001; #10;
        a = 32'h00000011; b = 32'h00000011; #10;
        a = 32'h00000011; b = 32'h00000011; #10;

        a = 32'h00001100; b = 32'h00000111; #10;
        a = 32'h00001100; b = 32'h00000101; #10;
        a = 32'h00001111; b = 32'h00000110; #10;
        a = 32'h00001111; b = 32'h00001000; #10;

        $finish;
    end

endmodule

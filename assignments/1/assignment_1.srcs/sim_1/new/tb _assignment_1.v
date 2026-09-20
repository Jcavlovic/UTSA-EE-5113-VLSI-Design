`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 09:14:00 PM
// Design Name: 
// Module Name: tb _assignment_1
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


`timescale 1ns / 1ps

module tb_assignment_1();

    reg [3:0] sel;
    reg [15:0] mux_in;
    wire [7:0] decode_out;

    reg a;
    reg b;
    reg cin;
    reg d;

    wire cout;
    wire sum;
    wire mux_out;
    wire q;
    wire q_not;

    sixteen_to_one uut0( .in(mux_in), .sel(sel), .out(mux_out));

    three_to_eight uut1(.sel(sel[2:0]), .out(decode_out));

    full_adder uut2( .a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    d_ff uut3( .d(d), .q(q), .q_not(q_not));

    initial begin
        $display("SEL  | MUX_IN           | MUX_OUT | DECODE_OUT | A | B | Cin | Cout | Sum | D | Q | Q_NOT");
        $monitor("%b | %b | \t%b\t | %b    | %b | %b |  %b  |  %b   |  %b  | %b | %b |   %b", sel, mux_in, mux_out, decode_out, a, b, cin, cout, sum, d, q, q_not);

        sel = 4'b0000;
        mux_in = 16'b010101010101010; a = 0; b = 0; cin = 0; d = 0; #5;
        
        sel = 4'b0001; d = 1; #5;
        sel = 4'b0010; b = 1; #5;
        sel = 4'b0011; #5;
        sel = 4'b0100; a = 1; b = 0; #5;
        sel = 4'b0101; d = 0; #5;
        sel = 4'b0110; b = 1; #5;
        sel = 4'b0111; #5;
        sel = 4'b1000; #5;
        sel = 4'b1001; #5;
        sel = 4'b1010; #5;
        sel = 4'b1011; #5;
        sel = 4'b1100; #5;
        sel = 4'b1101; #5;
        sel = 4'b1110; #5;
        sel = 4'b1111; #5;
        $finish;
    end
endmodule
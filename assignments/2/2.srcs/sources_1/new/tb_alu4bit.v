`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2026 11:27:10 PM
// Design Name: 
// Module Name: tb_alu4bit
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


module tb_alu4bit(
    );
    
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg cin;
    reg [2:0] ctrl;
    
    wire cout;
    wire cout_1;
    wire [3:0] out;
    wire [3:0] out_1;
    
    alu4bit alu(
    .a(a),
    .b(b),
    .ctrl(ctrl),
    .cin(cin),
    .cout(cout),
    .out(out)
    );
    
     alu4bit alu_1(
    .a(c),
    .b(d),
    .ctrl(ctrl),
    .cin(cin),
    .cout(cout_1),
    .out(out_1)
    );
    
    integer i;
    
    initial begin
        
        $monitor("%b | %b | %b | %b |   %b |   %b  |    %b   |  %b   |  %b", a, b, c, d, cin, cout, cout_1, out, out_1);
        
        for (i = 0; i < 9; i=i+1) begin
            ctrl = i;

            $display("A \t |  B   | \tC  |  D   | Cin | Cout | Cout_1 |   Out\t  | Out_1");
            a = 4'h0; b = 4'h0;  c = 4'h6; d = 4'hc; cin = 1'b1; #5;
            a = 4'h1; b = 4'h3;  c = 4'h8; d = 4'hf; cin = 1'b0; #5;
            a = 4'h2; b = 4'h6;  c = 4'ha; d = 4'h0; cin = 1'b1; #5;
            a = 4'h4; b = 4'h9;  c = 4'hc; d = 4'h3; cin = 1'b0; #5;
            
            $display("\n\t\t\t\tCtrl %b Finished", ctrl);
            end
        $display("Test Finished");
        end
endmodule

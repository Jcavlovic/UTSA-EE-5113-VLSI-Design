`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 06:30:24 PM
// Design Name: 
// Module Name: assignment_1
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


module sixteen_to_one(
    input [15:0] in,
    input [3:0] sel,
    output reg out
    );
    
    always@(*) begin
        // Sel determines mux output
        case (sel)
            3'b000 : out = in[0];
            3'b001 : out = in[1];
            3'b010 : out = in[2];
            3'b011 : out = in[3];
            3'b100 : out = in[4];
            3'b101 : out = in[5];
            3'b110 : out = in[6];
            3'b111 : out = in[7];
            
            3'b1000 : out = in[8];
            3'b1001 : out = in[9];
            3'b1010 : out = in[10];
            3'b1011 : out = in[11];
            3'b1100 : out = in[12];
            3'b1101 : out = in[13];
            3'b1110 : out = in[14];
            3'b1111 : out = in[15];
            default : out = 1'b0;
            
            endcase
        end
endmodule


//module three_to_eight(
//    input [2:0] sel,
//    output reg [7:0] out
//    );
    
//    always@(*) begin
//        // Sel determines decoder output
//        case (sel)
//                3'b000 : out = 8'b10000000;
//                3'b001 : out = 8'b01000000;
//                3'b010 : out = 8'b00100000;
//                3'b011 : out = 8'b00010000;
//                3'b100 : out = 8'b00001000;
//                3'b101 : out = 8'b00000100;
//                3'b110 : out = 8'b00000010;
//                3'b111 : out = 8'b00000001;
//                default : out = 8'b00000000;
//            endcase
//        end
//endmodule
    
    
//module full_adder(
//    input a,
//    input b,
//    input cin,
//    output cout,
//    output sum
//    );
    
//    // Carry out
//    assign cout = (a & b) | (cin & (a ^ b));
    
//    // Sum
//    assign sum = a ^ b ^ cin;
    
//endmodule


//module d_ff(
//    input d,
//    input clk,
//    output reg q,
//    output reg q_not
//    );
    
//    // Assign q = d
//    // and
//    // q_not = ~d
    
//    always@(posedge clk) begin
    
//        q <= d;
//        q_not <= ~d;
//    end
    
//endmodule


//module fourbit_full_adder(
//    input [3:0] a,
//    input [3:0] b,
//    input cin,
//    output cout,
//    output [3:0] sum
//    );

//    wire [2:0] cout_temp;

//    full_adder fa0(
//        .a(a[0]),
//        .b(b[0]),
//        .cin(cin),
//        .cout(cout_temp[0]),
//        .sum(sum[0])
//    );

//    full_adder fa1(
//        .a(a[1]),
//        .b(b[1]),
//        .cin(cout_temp[0]),
//        .cout(cout_temp[1]),
//        .sum(sum[1])
//    );

//    full_adder fa2(
//        .a(a[2]),
//        .b(b[2]),
//        .cin(cout_temp[1]),
//        .cout(cout_temp[2]),
//        .sum(sum[2])
//    );

//    full_adder fa3(
//        .a(a[3]),
//        .b(b[3]),
//        .cin(cout_temp[2]),
//        .cout(cout),
//        .sum(sum[3])
//    );

//endmodule


//module sixteen_full_adder(
//    input [15:0] a,
//    input [15:0] b,
//    input cin,
//    output cout,
//    output [15:0] sum
//    );

//    wire [3:0] cout_temp;

//    fourbit_full_adder fa0(
//        .a(a[3:0]),
//        .b(b[3:0]),
//        .cin(cin),
//        .cout(cout_temp[0]),
//        .sum(sum[3:0])
//    );

//    fourbit_full_adder fa1(
//        .a(a[7:4]),
//        .b(b[7:4]),
//        .cin(cout_temp[0]),
//        .cout(cout_temp[1]),
//        .sum(sum[7:4])
//    );

//    fourbit_full_adder fa2(
//        .a(a[11:8]),
//        .b(b[11:8]),
//        .cin(cout_temp[1]),
//        .cout(cout_temp[2]),
//        .sum(sum[11:8])
//    );

//    fourbit_full_adder fa3(
//        .a(a[15:12]),
//        .b(b[15:12]),
//        .cin(cout_temp[2]),
//        .cout(cout),
//        .sum(sum[15:12])
//    );

//endmodule


//module thirtytwo_full_adder(
//    input [31:0] a,
//    input [31:0] b,
//    input cin,
//    output cout,
//    output [31:0] sum
//    );

//    wire cout_temp;

//    sixteen_full_adder fa0(
//        .a(a[15:0]),
//        .b(b[15:0]),
//        .cin(cin),
//        .cout(cout_temp),
//        .sum(sum[15:0])
//    );

//    sixteen_full_adder fa1(
//        .a(a[31:16]),
//        .b(b[31:16]),
//        .cin(cout_temp),
//        .cout(cout),
//        .sum(sum[31:16])
//    );

//endmodule


//module assignment_1(

//    );
//endmodule

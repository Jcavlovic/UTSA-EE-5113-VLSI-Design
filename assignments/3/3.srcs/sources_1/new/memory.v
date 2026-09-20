`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2026 11:50:33 PM
// Design Name: 
// Module Name: memory
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


module memory#(
    parameter WIDTH = 8,
    parameter SIZE = 32,
    parameter ADDR_WIDTH = $clog2(SIZE)
    )(
    input [WIDTH-1:0] write_data,
    input [ADDR_WIDTH-1:0] address,
    input read_enable,
    input write_enable,
    input rst,
    input clk,
    output reg [WIDTH-1:0] read_data
    );

    reg [SIZE-1:0] memory [WIDTH-1:0];
    integer i;
    
    always@(posedge clk, posedge rst) begin
        // Clear Ram
        if (rst) begin
            for (i = 0; i < SIZE-1; i = i + 1) begin
                memory[i] = 0;
            end
        end
        else if (read_enable) begin
            read_data = memory[address];
        end
        else if (write_enable) begin
            memory[address] = write_data;
        end 
    end
endmodule

module ram#(
    parameter WIDTH = 7,
    parameter SIZE = 32,
    parameter ADDR_WIDTH = $clog2(SIZE)
    )(
    input [15:0] in,
    input clk,
    output reg [WIDTH:0] read_data
    );
    
    localparam LENGTH = WIDTH + ADDR_WIDTH + 3;
    localparam ADDR_START = WIDTH + ADDR_WIDTH;
    localparam ADDR_STOP = WIDTH + 1;
    localparam ENABLE_BITS = 2;
    localparam ZERO = 0;
    
    wire [2:0] enable_bits = in[LENGTH:LENGTH-ENABLE_BITS];

    reg [SIZE:0] memory [WIDTH:0];
    
    integer i;
    
    assign rst = in[(LENGTH)];
    
    // For this memory module the input bits have the following order starting with the MSB.
    // Every WIDTH is really WIDTH = 1
    // [WIDTH:WIDTH-3] rst, read_enble, write_enable,
    // [WIDTH-3:WIDTH-ADDR_WIDTH-3] address,
    // [WIDTH-ADDR_WIDTH-1:0] Data to store if store_data is set
    always@(posedge clk, posedge rst) begin
        casez (enable_bits)
            3'b1?? : begin
                for (i = 0; i < SIZE; i = i + 1) begin
                    memory[i] = ZERO;
                    end
                end
            3'b01? : read_data = memory[in[ADDR_START:ADDR_STOP]];
            3'b001 : memory[in[ADDR_START:ADDR_STOP]] = in[WIDTH:ZERO];
            default : read_data = read_data;
        endcase
    end
endmodule

// EEEA AAAA DDDD DDDD = 16 Total bits
// 0010 0001 1111 1111

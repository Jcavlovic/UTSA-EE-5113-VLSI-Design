`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2026 11:31:41 PM
// Design Name: 
// Module Name: tb_memory
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


module tb_memory();

    localparam WIDTH = 32;
    localparam SIZE = 4 * 2**20;
    
    localparam addr_1 = 1;
    localparam addr_2 = 2 * 2**20;
    localparam addr_3 = (4 * 2**20)-1;
    
    reg [31:0] write_data;
    wire [31:0] read_data;
    wire mem_ready;
    reg [$clog2(SIZE):0] address;
    reg read_enable;
    reg write_enable;
    reg rst;
    reg clk;
    
    memory #(
        .WIDTH(WIDTH),
        .SIZE(SIZE)
        ) mem1 (
        .write_data(write_data),
        .address(address),
        .read_enable(read_enable),
        .write_enable(write_enable),
        .rst(rst),
        .clk(clk),
        .read_data(read_data),
        .mem_ready(mem_ready)
        );
    
    initial begin
        clk = 1'b0; forever #5 clk = ~clk;
    end
        
    initial begin
        $display("Mem Ready");
        $monitor(mem_ready);
        
        $display("RST | Read_enable | Write_enable | Address |    Write_data   |    Read_data");
        $monitor(" %h  |      %b      |      %b       |    %h   |     %h    |    %h    ", rst, read_enable, write_enable, address, write_data, read_data);
        // Do nothing
        write_data = 32'hFFFFFFFF; address = {$clog2(SIZE){1'b0}}; read_enable = 1'b0; write_enable = 1'b0; rst = 1'b0; #5;
//        // Reset memory
//        rst = 1'b1; #5; rst = 1'b0; #5; address = {($clog2(SIZE)-addr_1){1'b0}}; read_enable = 1'b1; #5;
//        // Read from random address
//        address = {($clog2(SIZE)+addr_1){1'b0}}; #5; address = {($clog2(SIZE)+addr_2){1'b0}}; #5; address = {($clog2(SIZE)+addr_3){1'b0}}; #5; read_enable = 1'b0;
//         // Write to and then read from address 0x1.
        write_data = 32'h0000FFFF; address = addr_1; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
        // Write to and then read from address dsa0x2.
        write_data = 32'h00000007; address = addr_2; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
        // Write to and then read from address 0x3.
        write_data = 32'h00000005; address = addr_3; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;    
        // Write to and then read from address 0x4.
        write_data = 32'h000000FC; address = 5456; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
        // Write to and then read from address 0x5.
        write_data = 32'h111100D8; address = 8976; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
        // Write to and then read from address 0x6.
        write_data = 32'h111111A5; address = 100; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
        // Write to and then read from address 0x7.
        write_data = 32'h111100C6; address = 101; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;
//        // Reset memory
//        rst = 1'b1; #5; rst = 1'b0; #5; address = 3'b001; read_enable = 1'b1; #5;
        // Read all addresses
        address = addr_1; #5; address = addr_2; #5; address = addr_3; #5; read_enable = 1'b0;
//        // Write to and then read from address 0x7.
//        write_data = 32'h111100C6; address = 5'b00111; write_enable = 1'b1; #5; write_enable = 1'b0; #5; read_enable = 1'b1; #5; read_enable = 1'b0; #5;

    end
endmodule

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

    reg [31:0] write_data;
    wire [31:0] read_data;
    reg [4:0] address;
    reg read_enable;
    reg write_enable;
    reg rst;
    reg clk;
    
memory #(.WIDTH(32)) mem1 (
    .write_data(write_data),
    .address(address),
    .read_enable(read_enable),
    .write_enable(write_enable),
    .rst(rst),
    .clk(clk),
    .read_data(read_data)
    );
    
    initial begin
        clk = 1'b0; forever #10 clk = ~clk;
    end
        
    initial begin
        
        $display("RST | Read_enable | Write_enable | Address | Write_data");
        $monitor(" %h  |      %b      |      %b       |    %h   |     %h    ", rst, read_enable, write_enable, address, write_data);
        // Do nothing
        write_data = 32'hFFFFFFFF; address = 5'b00001; read_enable = 1'b0; write_enable = 1'b0; rst = 1'b0; #10;
        // Write to and then read from address 0x1.
        write_data = 32'h0000FFFF; address = 5'b00001; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Write to and then read from address 0x2.
        write_data = 32'h00000007; address = 5'b00010; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Write to and then read from address 0x3.
        write_data = 32'h00000005; address = 5'b00011; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;    
        // Write to and then read from address 0x4.
        write_data = 32'h000000FC; address = 5'b00100; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Write to and then read from address 0x5.
        write_data = 32'h111100D8; address = 5'b00101; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Write to and then read from address 0x6.
        write_data = 32'h111111A5; address = 5'b00110; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Write to and then read from address 0x7.
        write_data = 32'h111100C6; address = 5'b00111; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;
        // Reset memory
        rst = 1'b1; #10; rst = 1'b0; #10; address = 3'b001; read_enable = 1'b1; #10;
        // Read all addresses
        address = 5'b00001; #10; address = 5'b00010; #10; address = 5'b00011; #10; address = 5'b00100; #10; address = 5'b00101; #10; address = 5'b00110; #10; address = 5'b00111; #10; read_enable = 1'b0;
        // Write to and then read from address 0x7.
        write_data = 32'h111100C6; address = 5'b00111; write_enable = 1'b1; #10; write_enable = 1'b0; #10; read_enable = 1'b1; #10 read_enable = 1'b0; #10;

    end
endmodule

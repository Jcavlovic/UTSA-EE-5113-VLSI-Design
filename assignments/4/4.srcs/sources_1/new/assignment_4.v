`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 11:37:52 AM
// Design Name: 
// Module Name: assignment_4
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


module assignment_4_behavior (
    input CLK, 
    input rst, 
    input X, 
    output reg S,
    output reg V);
    
    localparam S0=3'd0;
    localparam S1=3'd1;
    localparam S2=3'd2;
    localparam S3=3'd3;
    localparam S4=3'd4;
    localparam S5=3'd5;
    localparam S6=3'd6;
    reg [2:0] state;
    reg [2:0] next;

    always @(posedge CLK or posedge rst)
        if (rst) 
            state <= S0;
        else
            state <= next;
    
    always @(*) begin
        case (state)
              S0: begin next = X ? S2 : S1; {S,V} = X ? 2'b00 : 2'b10; end
              S1: begin next = X ? S4 : S3; {S,V} = X ? 2'b00 : 2'b10; end
              S2: begin next = S4; {S,V} = X ? 2'b10 : 2'b00; end
              S3: begin next = S5; {S,V} = X ? 2'b10 : 2'b00; end
              S4: begin next = X ? S6 : S5; {S,V} = X ? 2'b00 : 2'b10; end
              S5: begin next = S0; {S,V} = X ? 2'b10 : 2'b00; end
              S6: begin next = S0; {S,V} = X ? 2'b01 : 2'b10; end
              default: begin next = S0; {S,V} = 2'b00; end
         endcase
      end
endmodule

module assignment_4_dataflow (
    input CLK,
    input rst, 
    input X, 
    output S,
    output V);
    
    reg Q1, Q2, Q3;
    wire D1, D2, D3;
    
    assign D1 = (Q3 & (Q1 ^ Q2)) | (Q2 & ~Q3 & ~X);
    assign D2 = (~Q1 & ~Q2 & Q3) | (~Q1 & ~Q2 & ~X) | (~Q1 & Q2 & X);
    assign D3 = ~Q1 & ((Q2 ^ Q3) | X);
    
    assign S = X ^ (Q2 | (~Q1 & ~Q3));
    assign V = Q1 & Q2 & Q3 & X;
    
    always @(posedge CLK or posedge rst)
        if (rst) 
            {Q1,Q2,Q3} <= 3'b000;
        else 
            {Q1,Q2,Q3} <= {D1,D2,D3};
endmodule

module bcd_counter (
    input CLK, 
    input CLR, 
    input ENABLE, 
    input LOAD, 
    input UP,
    input [3:0] D,
    output reg [3:0] Q,
    output CO
);

    always @(posedge CLK or negedge CLR)
        if (!CLR)
          Q <= 4'd0;
        else if (ENABLE) begin
          if (LOAD)
            Q <= D;
          else if (UP)
            Q <= (Q == 4'd9) ? 4'd0 : Q + 4'd1;
          else
            Q <= (Q == 4'd0) ? 4'd9 : Q - 4'd1;
    end 

    assign CO = ENABLE & ((UP & (Q == 4'd9)) | (~UP & (Q == 4'd0)));
    
endmodule

module bcd_counter_2digit (
    input CLK, 
    input CLR, 
    input ENABLE, 
    input LOAD, 
    input UP,
    input  [3:0] D1, 
    input [3:0] D2,
    output [3:0] Q1,
    output [3:0] Q2,
    output CO
    );
    
    wire CO1, CO2;
    wire EN2 = ENABLE & (LOAD | CO1);
    
    bcd_counter ones (CLK, CLR, ENABLE, LOAD, UP, D1, Q1, CO1);
    bcd_counter tens (CLK, CLR, EN2,    LOAD, UP, D2, Q2, CO2);
    
    assign CO = CO1 & CO2;
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2024 09:34:25
// Design Name: 
// Module Name: JK_FF
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

module JK_FF(
    input J,
    input K,
    input Clk,
    input preset,//active low
    input clear,//active low
    output reg Q,
    output Qbar
    );
    assign Qbar =~Q;
    always @(negedge Clk or negedge preset or negedge clear)
    begin
    if (!clear) begin
    Q<=0;
    end
    else if (!preset) begin
    Q<=1; end
    else begin
    case ({J,K})
    2'b00: Q<=Q; //No change state
    2'b01: Q<=0; //Reset state
    2'b10: Q<=1; //Set state
    2'b11: Q<=~Q; //Toggle state 
    endcase
    end 
    end
endmodule
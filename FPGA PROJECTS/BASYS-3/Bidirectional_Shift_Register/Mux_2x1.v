`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PSGCT
// Engineer: Kanish V
// 
// Create Date: 13.12.2024 09:35:46
// Design Name: 2x1 Multiplexer
// Module Name: Mux_2x1
// Project Name: Implementation of Shift Register in Basys-3
// Target Devices: Basys 3(Xilinx Artix-7 FPGA)
// Tool Versions: Vivado 2024.1
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_2x1(input i0,input i1,input s,output op);
assign op = s ? i1:i0;
endmodule

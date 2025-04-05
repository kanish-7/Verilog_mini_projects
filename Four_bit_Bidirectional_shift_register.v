`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PSGCT
// Engineer: Kanish V
// 
// Create Date: 13.12.2024 09:37:04
// Design Name: 4-bit Bidirectional Shift Register with Serial I/O
// Module Name: Four_bit_Bidirectional_shift_register
// Project Name: Implementation of Shift Register in Basys-3
// Target Devices: Basys 3(Xilinx Artix-7 FPGA)
// Tool Versions: Vivado 2024.1
// Description: 
//   - Implements a 4-bit bidirectional shift register using JK flip-flops.
//   - Supports serial input and serial output.
//   - Direction controlled using a mode input (left/right).
//   - Includes synchronous clear and preset features.
//   - Uses 2×1 multiplexers for input selection logic.
// Dependencies: 
//   - JK_FF.v(JK Flip-Flop module)
//   - Mux_2x1.v (2x1 Multiplexer module)
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Four_bit_Bidirectional_shift_register(
    input data,
    input mode,
    input clk,
    input preset,
    input clear,
    output [3:0]q
    
    );
    wire[3:0] t;
    reg [26:0] counter =0;
    reg clk_out;
    // clock divider to convert 
    always @(posedge clk or posedge clear) begin
    if (!clear) begin
    counter<=0;
    clk_out<=0;
    end
    else if (counter ==75000000-1) begin
    counter<=0;
    clk_out=~clk_out;
    end else begin 
    counter<= counter +1;
    end
    end
    
    
    
    // Logic implementation
    
    Mux_2x1 M0 (.i0(data),.i1(q[1]),.s(mode),.op(t[0]));
    JK_FF   FF0(.J(t[0]),.K(~t[0]),.Clk(clk_out),.preset(preset),.clear(clear),.Q(q[0]));
  
    
    Mux_2x1 M1 (.i0(q[0]),.i1(q[2]),.s(mode),.op(t[1]));
    JK_FF   FF1(.J(t[1]),.K(~t[1]),.Clk(clk_out),.preset(preset),.clear(clear),.Q(q[1]));
   
    
    Mux_2x1 M2 (.i0(q[1]),.i1(q[3]),.s(mode),.op(t[2]));
    JK_FF   FF2(.J(t[2]),.K(~t[2]),.Clk(clk_out),.preset(preset),.clear(clear),.Q(q[2]));
   
    
    Mux_2x1 M3 (.i0(q[2]),.i1(data),.s(mode),.op(t[3]));
    JK_FF   FF3(.J(t[3]),.K(~t[3]),.Clk(clk_out),.preset(preset),.clear(clear),.Q(q[3]));
    
    
endmodule

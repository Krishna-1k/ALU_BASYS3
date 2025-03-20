`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 08:50:04 AM
// Design Name: 
// Module Name: alu_wrapper
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


module alu_wrapper(
    input clk_100Mhz,
    input [3:0] data_a,
    input [3:0] data_b,
    input [3:0] alu_sel,
    input reset,
    output [6:0] seg,
    output [3:0] digit,
    output carry_flag
    );
    logic five_hz_clk;
    logic [3:0] alu_out;

    fivehz_gen clk_gen(
       .clk_100Mhz(clk_100Mhz),
        .reset(reset),
        .out_clk_5hz(five_hz_clk)
    );
    
    alu_impl core(
        .clk(five_hz_clk),
        .reset(reset),
        .data_a(data_a),
        .data_b(data_b),
        .alu_sel(alu_sel),
        .alu_out(alu_out),
        .carry_flag(carry_flag)
    );
    
    seg7_control disp(
        .clock(clk_100Mhz),
        .reset(reset),
        .ones(alu_out[0]),
        .twos(alu_out[1]),
        .fours(alu_out[2]),
        .eights(alu_out[3]),
        .seg(seg),
        .digit(digit)
    );
    
endmodule

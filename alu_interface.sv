`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 09:36:09 AM
// Design Name: 
// Module Name: alu_interface
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


interface alu_interface(input logic clock);
    logic reset;
    logic [3:0] data_a;
    logic [3:0] data_b;
    logic [3:0] alu_sel;
    logic [3:0] alu_out;
    logic carry_flag;
endinterface : alu_interface

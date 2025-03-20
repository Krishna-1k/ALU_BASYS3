`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 08:32:04 AM
// Design Name: 
// Module Name: alu_impl
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


module alu_impl(
    input clk,
    input reset,
    input [3:0] data_a,
    input [3:0] data_b,
    input [3:0] alu_sel,
    output [3:0] alu_out,
    output carry_flag
    );
    logic[3:0] alu_result;
    logic carry_flag_temp;
    
    //Parameters for readability
    parameter ADD = 4'b0000;
    parameter SUB = 4'b0001;
    parameter MUL = 4'b0010;
    parameter DIV = 4'b0011;
    parameter BITWISE_AND = 4'b0100;
    parameter BITWISE_OR = 4'b0101;
    
    always @(posedge clk or posedge reset) begin
    
        if(reset) begin
            alu_result <= 0;
        end else begin
            case(alu_sel)
                ADD: 
                    {carry_flag_temp, alu_result} <= data_a + data_b;
                SUB:
                    {carry_flag_temp, alu_result} <= data_a - data_b;
                MUL: begin
                    alu_result <= data_a * data_b;
                    carry_flag_temp <= 1'b0;
                    end
                DIV: begin
                    alu_result <= data_a / data_b;
                    carry_flag_temp <= 1'b0;
                    end
                BITWISE_AND: begin
                    alu_result <= data_a & data_b;
                    carry_flag_temp <= 1'b0;
                    end
                BITWISE_OR: begin
                    alu_result <= data_a | data_b;
                    carry_flag_temp <= 1'b0;
                    end
                default: begin
                    alu_result <= data_a + data_b;
                    carry_flag_temp <= 1'b0;
                    end
            endcase
        
        end
    
    
    end
    assign alu_out = alu_result;
    assign carry_flag = carry_flag_temp;
endmodule

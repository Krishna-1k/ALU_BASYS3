`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 11:41:03 PM
// Design Name: 
// Module Name: seg7_control
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


module seg7_control(
    input clock,
    input reset,
    input ones,
    input twos,
    input fours,
    input eights,
    output logic [6:0] seg,
    output logic [3:0] digit
    );
    
    parameter ZERO = 7'b0000001;
    parameter ONE = 7'b1001111;
    parameter TWO = 7'b0010010;
    parameter THREE = 7'b0000110;
    parameter FOUR = 7'b1001100;
    parameter FIVE = 7'b0100100;
    parameter SIX = 7'b0100000;
    parameter SEVEN = 7'b0001111;
    parameter EIGHT = 7'b0000000;
    parameter NINE = 7'b0000100;
    
    logic [1:0] digit_select;
    logic [15:0] digit_time;
    
    always @(posedge clock or posedge reset) begin
        if(reset) begin
            digit_select <= 0;
            digit_time <= 0;
        end else begin
            if(digit_time == 99) begin
                digit_time <= 0;
                digit_select <= digit_select + 1;
            end else begin
                digit_time <= digit_time + 1;
            end
        end
    end
    
    always @(digit_select) begin
        case(digit_select)
            2'b00 : digit = 4'b1110;
            2'b01 : digit = 4'b1101;
            2'b10 : digit = 4'b1011;
            2'b11 : digit = 4'b0111;
        
        endcase
    end
    
    //
    always @*
        case(digit_select)
            2'b00: begin
                if(ones) begin
                    seg = ONE;
                end else begin
                    seg = ZERO;
                end
            end
            2'b01: begin
                if(twos) begin
                    seg = ONE;
                end else begin
                    seg = ZERO;
                end
            end
            2'b10: begin
                 if(fours) begin
                    seg = ONE;
                end else begin
                    seg = ZERO;
                end
            end
            2'b11: begin
            
                if(eights) begin
                    seg = ONE;
                end else begin
                    seg = ZERO;
                end
            
            end 
        
        endcase
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2025 08:50:25 PM
// Design Name: 
// Module Name: 5hz_gen
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


module fivehz_gen(
    input clk_100Mhz,
    input reset,
    output out_clk_5hz
    );
    logic [22:0] counter;
    logic out_clk_five_hz_temp;
    
    always @(posedge clk_100Mhz or posedge reset)begin
    
        if(reset) begin
            out_clk_five_hz_temp <= 0;
            counter <= 0;
        end else begin
            counter <= counter + 1;
            if(counter == 4999999) begin
                out_clk_five_hz_temp <= ~out_clk_five_hz_temp; 
                counter <= 0;
            end
        end
    
    end
    assign out_clk_5hz = out_clk_five_hz_temp;
endmodule

`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 09:20:19 AM
// Design Name: 
// Module Name: top
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

import uvm_pkg::*;
`include "uvm_macros.svh"
//Include files
`include "alu_interface.sv"
`include "alu_sequence_item.sv"
`include "alu_base_sequence.sv"
`include "alu_driver.sv"
`include "alu_sequencer.sv"
`include "alu_monitor.sv"
`include "alu_scoreboard.sv"
`include "alu_agent.sv"
`include "alu_env.sv"
`include "alu_test.sv"

module top;

    logic clock;
    
    alu_interface intf(.clock(clock));
    alu_wrapper dut(
        .clk_100Mhz(intf.clock),
        .data_a(intf.data_a),
        .data_b(intf.data_b),
        .alu_sel(intf.alu_sel),
        .reset(intf.reset),
        .alu_out(intf.alu_out),
        .carry_flag(intf.carry_flag)
    );
    
//set the interface

initial begin

  uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf);


end
    
initial begin
    run_test("alu_test");    
end
    
initial begin   
    clock = 0;
    #2 
    forever begin
        #2 clock = ~clock;    
    end
end

initial begin
   #1000
   $display("Hit max cycle limit. Killing sim");
   $finish();

end

endmodule

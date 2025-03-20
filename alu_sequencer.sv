`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 10:09:14 AM
// Design Name: 
// Module Name: alu_sequencer
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

class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
    `uvm_component_utils(alu_sequencer)
    
    function new(string name= "alu_sequencer" , uvm_component parent);
       super.new(name, parent);
       `uvm_info("SQR CLASS", "Inside ALU SQR", UVM_LOW)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase
   
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction: connect_phase
    
    
endclass : alu_sequencer
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 10:16:51 AM
// Design Name: 
// Module Name: alu_sequence_item
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

class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
    rand logic reset;
    rand logic [3:0] data_a;
    rand logic [3:0] data_b;
    rand logic [3:0] alu_sel;
    logic [3:0] alu_out;
    logic carry_flag;
  
  //Constraints
  constraint inputs {
      data_a inside {[1:3]};
      data_b inside {[0:3]};
      alu_sel inside {[0:5]};
      if(alu_sel == 3) {
          data_b != 0;
          data_a != 0;
      
      }
  }
  
  
  function new(string name = "alu_sequence_item");
      super.new();
  endfunction: new
  
  endclass: alu_sequence_item
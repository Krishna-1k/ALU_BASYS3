`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 10:26:22 AM
// Design Name: 
// Module Name: alu_base_sequence
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


class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)

  alu_sequence_item reset_pkt;
  
  
  function new(string name = "alu_base_sequence");
      super.new();
  endfunction: new
  
  task body();
      `uvm_info("BASE SEQ", "Inside base seq", UVM_LOW)
      
      reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
      start_item(reset_pkt);
      `uvm_info("BASE SEQ", "Inside start pkt", UVM_LOW)

      reset_pkt.randomize() with {reset==1;};
      finish_item(reset_pkt);
      `uvm_info("BASE SEQ", "Inside end pkt", UVM_LOW)      
      
  endtask: body
  
endclass: alu_base_sequence

class alu_test_sequence extends alu_base_sequence;

  `uvm_object_utils(alu_test_sequence)

  alu_sequence_item item;
  
  
  function new(string name = "alu_test_sequence");
      super.new();
  endfunction: new
  
  task body();
      `uvm_info("BASE SEQ", "Inside base seq", UVM_LOW)
      super.body();
      repeat(5) begin
          #20
          item = alu_sequence_item::type_id::create("item");
          start_item(item);
          item.randomize() with {reset==0;};
          finish_item(item);
      end
  endtask: body

endclass: alu_test_sequence

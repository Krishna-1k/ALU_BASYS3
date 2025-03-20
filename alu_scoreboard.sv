`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 10:23:29 PM
// Design Name: 
// Module Name: alu_scoreboard
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


class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)
    uvm_analysis_imp#(alu_sequence_item, alu_scoreboard) scoreboard_port;; 
    
    alu_sequence_item transactions[$];
    
    function new(string name= "alu_scoreboard" , uvm_component parent);
       super.new(name, parent);
       `uvm_info("SCB CLASS", "Inside ALU TEST", UVM_LOW)
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        scoreboard_port = new("scoreboard_port", this);
    endfunction: build_phase
   
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction: connect_phase
    
    function void write(alu_sequence_item item);
        transactions.push_back(item);
    endfunction: write
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            alu_sequence_item curr_trans;
            wait(transactions.size() != 0);
            curr_trans = transactions.pop_front();
            compare(curr_trans);
        
        end
        
    endtask: run_phase
    
    task compare(alu_sequence_item curr_trans);
        logic [3:0] expected;
        logic [3:0] actual; 
        logic expected_carry_flag = 0;
        logic actual_carry_flag;
        case(curr_trans.alu_sel)
        
        0: begin
            {expected_carry_flag, expected} = curr_trans.data_a + curr_trans.data_b;
        end
        
        1: begin
            {expected_carry_flag, expected} = curr_trans.data_a - curr_trans.data_b;
        end
        
        2: begin
            expected = curr_trans.data_a * curr_trans.data_b;
        end
        
        3: begin
        
            expected = curr_trans.data_a / curr_trans.data_b;
        end
        
        4: begin
            expected = curr_trans.data_a & curr_trans.data_b;
        end
        
        5: begin
            expected = curr_trans.data_a | curr_trans.data_b;
        end
        
        default : begin
            expected = curr_trans.data_a + curr_trans.data_b;
        end
        endcase
        
       actual = curr_trans.alu_out;
       actual_carry_flag = curr_trans.carry_flag;
       
       if((actual !== expected) || (actual_carry_flag !== expected_carry_flag)) begin
       
       `uvm_error("COMPARE", $sformatf("Trans failed ACT=%d, EXP=%d, ACT_CARRY=%d, EXP_CARRY =%d",actual,expected,actual_carry_flag,expected_carry_flag))
       end
       else begin
           `uvm_info("COMPARE", $sformatf("Trans success ACT=%d, EXP=%d",actual,expected),UVM_LOW)

       end
    endtask: compare
    
endclass : alu_scoreboard

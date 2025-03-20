`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2025 09:44:48 AM
// Design Name: 
// Module Name: alu_test
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


class alu_test extends uvm_test;
    `uvm_component_utils(alu_test)
    alu_env env;
    alu_base_sequence reset_seq;
    alu_test_sequence test_seq;
    
    function new(string name= "alu_test" , uvm_component parent);
       super.new(name, parent);
       `uvm_info("TEST CLASS", "Inside ALU TEST", UVM_LOW)
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = alu_env::type_id::create("env", this);
    endfunction: build_phase
   
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction: connect_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        
        //reset seq
        reset_seq = alu_base_sequence::type_id::create("reset_seq");
        reset_seq.start(env.agent.sqr);
        #10
        //test seq
        test_seq = alu_test_sequence::type_id::create("test_seq");
        test_seq.start(env.agent.sqr);
        
        phase.drop_objection(this);
    endtask: run_phase
    
endclass : alu_test

class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)
    virtual alu_interface vif;
    alu_sequence_item item;
    uvm_analysis_port #(alu_sequence_item) monitor_port;
    
    function new(string name= "alu_monitor" , uvm_component parent);
       super.new(name, parent);
       `uvm_info("MONITOR CLASS", "Inside ALU MONITOR", UVM_LOW)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor_port = new("monitor_port",this);
        if(!uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif)) begin
            `uvm_error("MONITOR", "failed to get intf in monitor")
        end
    endfunction: build_phase
   
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction: connect_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        
        forever begin
            item = alu_sequence_item::type_id::create("item");
            wait(!vif.reset);
            
            @(posedge vif.clock);
            
            item.data_a = vif.data_a;
            item.data_b = vif.data_b;
            item.alu_sel = vif.alu_sel;
       `uvm_info("MONITOR CLASS", $psprintf("data_a %d",item.data_a), UVM_LOW)


            @(posedge vif.clock);
            item.alu_out = vif.alu_out;
            item.carry_flag = vif.carry_flag;
               `uvm_info("MONITOR CLASS", $psprintf("data_out %d",item.alu_out), UVM_HIGH)
               `uvm_info("MONITOR CLASS", $psprintf("data_out vif %d",vif.alu_out), UVM_HIGH)
               `uvm_info("MONITOR CLASS", $psprintf("carry flag item %d",item.carry_flag), UVM_HIGH)
               `uvm_info("MONITOR CLASS", $psprintf("carry flag vif %d",vif.carry_flag), UVM_HIGH)

            monitor_port.write(item);
        end
    endtask: run_phase
    
endclass : alu_monitor
class alu_driver extends uvm_driver#(alu_sequence_item);
    `uvm_component_utils(alu_driver)
    virtual alu_interface vif;
    alu_sequence_item item;
    
    function new(string name= "alu_driver" , uvm_component parent);
       super.new(name, parent);
       `uvm_info("DRIVER CLASS", "Inside ALU DRIVER", UVM_LOW)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
        `uvm_error("DRIVER", "failed to get intf in driver")
        end


    endfunction: build_phase
   
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction: connect_phase
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin

           item = alu_sequence_item::type_id::create("item");
                 `uvm_info("DRV", "About to get next item", UVM_HIGH)
           seq_item_port.get_next_item(item);
           `uvm_info("DRV", "About to drive next item", UVM_HIGH)

           drive(item);
           `uvm_info("DRV", "About to finish drive next item", UVM_HIGH)

           seq_item_port.item_done();
           `uvm_info("DRV", "DONE", UVM_HIGH)
        
        end
    endtask: run_phase
    
    task drive(alu_sequence_item item);
        @(posedge vif.clock);
        vif.reset <= item.reset;
        vif.data_a <= item.data_a;
        vif.data_b <= item.data_b;
        vif.alu_sel <= item.alu_sel;
    endtask: drive
endclass : alu_driver
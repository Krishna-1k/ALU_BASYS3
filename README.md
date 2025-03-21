# ALU_BASYS3

**Goal:**
The project aims to implement an ALU with 6 different operations. The final goal is to display results on the seven segment display of Basys3. Inputs would be provided through switches on Basys 3. 

**Design:**
I use SystemVerilog and Vivado for the design. There are four main modules:

- alu_wrapper -> encapsulates other modules.
- alu_impl -> implements the ALU.
- seg7_control -> logic to show results in binary on seven seg display.
- 5hz_gen -> generate 5hz clock needed by seven seg display. 

**Verification:**
I functionally verify the ALU using UVM. Afterwards, I integrate the seg7_control and 5hz gen modules. I also write a xdc file to control the board mappings. Lastly, I upload bitstream file to Basys3 to perform on-board validation. 

**Basys3 Validation:**
The different combinations are tested out on the board. In this repo, I am sharing two images. The first image is an alu addition of 1+1. Results displayed as binary(2'b10)
Second image is alu addition of 8+8. We can see carry flag(led) lighting up since the output is beyond what four bits can represent.

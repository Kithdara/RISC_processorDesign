/************************************************* 
Branching ALU Module 
-> increments the pc by a specified Imm operand 
*************************************************/ 

module BranchALU(pc, offset, incr_pc); 
  input[31:0] pc, offset; 
  output reg[31:0] incr_pc; 
  
  always @* incr_pc = pc + offset; 
  
endmodule // BranchALU 
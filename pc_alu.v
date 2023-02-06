/****************************************************** 
Program Counter ALU Module 
-> always increment the address of pc by 4 
******************************************************/ 

module pcALU(pc, incr_pc); 
  input[31:0] pc; 
  output reg [31:0] incr_pc; 
  
  always @* incr_pc = pc + 4; 
  
endmodule // pcALU 

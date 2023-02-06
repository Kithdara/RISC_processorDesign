module branch_tb(); 
  reg BranchEn, IsUncond, z, lt; 
  reg[2:0] funct3; 
  
  wire Branch; 
  
  initial begin 
    BranchEn <= #0 0; IsUncond <= #0 1; z <= #0 0; lt <= #0 1; funct3 <= #0 000; // 0 
    BranchEn <= #5 1; IsUncond <= #5 1; z <= #5 1; lt <= #5 1; funct3 <= #5 010; // 1 
    BranchEn <= #10 1; IsUncond <= #10 0; z <= #10 1; lt <= #10 1; funct3 <= #10 000; // 1 
    BranchEn <= #15 1; IsUncond <= #15 0; z <= #15 0; lt <= #15 0; funct3 <= #15 111; // 1 
    BranchEn <= #20 1; IsUncond <= #20 0; z <= #20 0; lt <= #20 0; funct3 <= #20 001; // 1 
    BranchEn <= #25 1; IsUncond <= #25 0; z <= #25 1; lt <= #25 1; funct3 <= #25 101; // 0 
    BranchEn <= #30 1; IsUncond <= #30 0; z <= #30 0; lt <= #30 0; funct3 <= #30 110; // 0 
    BranchEn <= #35 1; IsUncond <= #35 0; z <= #35 0; lt <= #35 0; funct3 <= #35 000; // 0 
  end
  
  branch MUT(BranchEn, IsUncond, funct3, z, lt, Branch); 
  
endmodule // branch_tb 




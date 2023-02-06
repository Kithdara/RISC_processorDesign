// for testing purposes only 

module test(out); 
  // testing comparisons in verilog 
  output reg out; 
  reg[7:0] temp1, temp2; 
  reg signed [7:0] temp_s1, temp_s2; 
  
  initial begin 
    temp_s1 <= #0 8'b0000_0100; // out = 1
    temp_s2 <= #0 8'b0000_0111; 
    
    temp_s1 <= #10 8'b0000_1000; // out = 0
    temp_s2 <= #10 8'b0000_0101; 
    
    temp_s1 <= #20 8'b1000_0100; // signed or unsigned 
    temp_s2 <= #20 8'b0000_0010; // if signed, then out = 1; if unsigned, then out = 0; 
    
    temp_s1 <= #30 8'b1000_0010; // out = 0 
    temp_s2 <= #30 8'b1000_0100; 
  end 
  
  always @(temp_s1, temp_s2) begin 
    if (temp_s1 < temp_s2) 
      out = 1'b1; 
    else 
      out = 1'b0; 
    end 
  
endmodule //test 

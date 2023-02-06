/********************************
        testbench for ALU 
********************************/ 

module ALU_tb(); 
  localparam bus_size = 32; 
  
  reg[bus_size-1:0] A, B; // input data buses to ALU 
  reg[2:0] control; // control signal to ALU 
  reg opr; 
  wire[bus_size-1:0] out; // output data bus of ALU 
  wire z, lt; // zero flag 
  
  initial begin 
    control <= 4; // signed compare  
    opr <= 0;  
    /* 
    A <= #0 8'b0000_1111; B <= #0 8'b0000_001;    // 8'b0000_0111 
    A <= #5 8'b1111_1000; B <= #5 bus_size-1;     // 8'b1111_1111
    A <= #10 8'b1111_1000; B <= #10 8'b0000_0000; // 8'b1111_1000  
    A <= #15 8'b1000_1111; B <= #15 8'b0000_0010; // 8'b1110_0011 
    A <= #20 8'b1111_1000; B <= #20 8'b0010_0010; // 8'b1111_1110 
    */ 
    // control = #0 5; // unsigned compare 
    A <= #0 127; B <= #0 127; // 0 
    A <= #5 4; B <= #5 127; // 1
    A <= #10 -128; B <= #10 -127; // 1  
    A <= #15 -10; B <= #15 4; // 0 
    A <= #20 4; B <= #20 -10; // 1  
     
  end 
  
  ALU MUT(.data1(A), .data2(B), .out(out), .ALUopr(control), .SUBorSRA(opr), .z(z), .lt(lt)); 
  
endmodule // ALU_tb 

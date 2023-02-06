module immediate_generator (
  input wire [31:0] instruction,
  output reg [31:0] immediate,
  output wire [4:0] funct3,
  output wire [6:0] opcode
);

  assign funct3 = instruction[14:12];
  assign opcode = instruction[6:0];

  always @(*) begin
    case (opcode)
      7'b0010011: // I-type
        immediate = { {20{instruction[31]}}, instruction[31:20] };
      7'b0110111: // U-type
        immediate = {instruction[31:12], 12'b0};
		7'b0010111: // U-type
        immediate = {instruction[31:12], 12'b0};
      7'b1101111: // UJ-type
        immediate = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21],1'b0};
      7'b1100011: // B-type
        immediate = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8],1'b0};
      7'b0100011: // S-type
        immediate = {{20{instruction[31]}},instruction[31:25], instruction[11:7]};
      default: // R-type
        immediate = 0;
    endcase
  end

endmodule

module gray_to_binary(
  input [3:0]g,
  output reg [3:0]b
);
  assign b[3] = g[3];

  xor x1(b[2],b[3],g[2]);
  xor x2(b[1],b[2],g[1]);
  xor x3(b[0],b[1],g[0]);

endmodule

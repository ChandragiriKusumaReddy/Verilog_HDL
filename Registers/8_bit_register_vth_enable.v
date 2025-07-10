module register_with_enable(
  input [7:0] d,
  input clk,en,
  output reg [7:0] q
);
  always@(posedge clk) begin
    if(en)
      q<=d;
  end
endmodule

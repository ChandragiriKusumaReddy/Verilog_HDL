module register_sync_reset(
  input [7:0] d,
  input clk,rst,
  output reg[7:0] q
);
  always@(posedge clk) begin
    if(rst)
      q<=8'b0;
    else
      q<=d;
  end
endmodule

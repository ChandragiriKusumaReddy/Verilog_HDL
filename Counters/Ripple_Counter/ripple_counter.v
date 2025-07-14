module ripple_counter(
  input clk,
  input rst,
  output reg [3:0] q
);
  wire [3:0]t;
  
  //t_ff chain
  t_ff t0(.clk(clk), .rst(rst), .q(q[0]));
  t_ff t1(.clk(q[0]), .rst(rst), .q(q[1]));
  t_ff t2(.clk(q[1]), .rst(rst), .q(q[2]));
  t_ff t3(.clk(q[2]), .rst(rst), .q(q[3]));
  
endmodule
module t_ff(
  input clk,
  input rst,
  output reg q
);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=1'b0;
      else
        q<=~q;
    end
endmodule
  

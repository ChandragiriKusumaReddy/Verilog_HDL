module twisted_ring_counter(
  input clk,
  input rst,
  output reg[3:0] q 
);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=4'b0000;
      else
        q<={q[2:0],~q[3]}; 
    end
endmodule




//For n-bit
module johnson_counter #(parameter N=4)(
  input clk,
  input rst,
  output reg [N-1:0]q
);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=0;
      else
        q<={~q[N-1],q[N-1:1]};
    end
endmodule

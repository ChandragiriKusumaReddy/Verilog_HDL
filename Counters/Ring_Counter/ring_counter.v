module ring_counter(
  input clk,
  input rst,
  output reg[3:0] q 
);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=4'b1000;
      else
        q<={q[2:0],q[3]}; //circular left shift
    end
endmodule


//For N-bit
module ring_counter #(parameter N=4)(
  input clk,
  input rst,
  coutput reg[N-1:0]
);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=1; //Initial pattern:000.....0001
      else
        q<={q[N-2:0],q[N-1]};
    end
endmodule

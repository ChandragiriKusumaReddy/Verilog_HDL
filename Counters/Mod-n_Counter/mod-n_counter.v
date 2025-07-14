module mod_n_counter(
  input clk,
  input rst,
  output reg[3:0] count //4-bit to cover 0-9 values
);
  parameter N=10;
  always@(posedge clk or posedge rst)
    begin
     if(rst)
       count<=0;
     else if(count==N-1)
       count<=0;
     else
       count<=count+1;
    end
endmodule

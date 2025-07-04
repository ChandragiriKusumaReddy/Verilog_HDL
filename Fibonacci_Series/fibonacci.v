module fibonacci(
  input clk,rst,
  output [31:0] value);
  reg [31:0] previous,current;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          previous<=32'd0;
          current<=32'd1;
        end
      else 
        begin
          current<=current+previous;
          previous<=cuurent;
        end
    end
endmodule

module tb();
  reg clk,rst;
  wire[31:0] value;

  fibonacci dut (
    .clk(clk),
    .rst(rst),
    .value(value));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("Time=%0t Reset=%b Value=%d",$time,rst,value);
    rst = 1;
    #10;
    rst = 0;
    repeat(15) @(posedge clk);
    $finish;
  end
endmodule

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



// OUTPUT:
// Time=0 Reset=1 Value= 0
// Time=10 Reset=0 Value= 0
// Time=15 Reset=0 Value= 1
// Time=35 Reset=0 Value= 2
// Time=45 Reset=0 Value= 3
// Time=55 Reset=0 Value= 5
// Time=65 Reset=0 Value= 8
// Time=75 Reset=0 Value= 13
// Time=85 Reset=0 Value= 21
// Time=95 Reset=0 Value= 34
// Time=105 Reset=0 Value= 55
// Time=115 Reset=0 Value= 89
// Time=125 Reset=0 Value= 144
// Time=135 Reset=0 Value= 233
// Time=145 Reset=0 Value= 377 

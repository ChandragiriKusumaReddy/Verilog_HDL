module down_counter_tb;
  reg clk,rst;
  wire [3:0] count;
  
  down_counter DUT(.clk(clk),.rst(rst),.count(count));
  
  initial begin
    $monitor("Time=%0t | Reset=%d | Count=%b",$time,rst,count);
     clk=0; rst=1;
     #5 rst=0;
    #100 $finish;
  end   
    always #5 clk=~clk;
 
endmodule


//Output:
# KERNEL: Time=0 | Reset=1 | Count=1111
# KERNEL: Time=5 | Reset=0 | Count=1110
# KERNEL: Time=15 | Reset=0 | Count=1101
# KERNEL: Time=25 | Reset=0 | Count=1100
# KERNEL: Time=35 | Reset=0 | Count=1011
# KERNEL: Time=45 | Reset=0 | Count=1010
# KERNEL: Time=55 | Reset=0 | Count=1001
# KERNEL: Time=65 | Reset=0 | Count=1000
# KERNEL: Time=75 | Reset=0 | Count=0111
# KERNEL: Time=85 | Reset=0 | Count=0110
# KERNEL: Time=95 | Reset=0 | Count=0101

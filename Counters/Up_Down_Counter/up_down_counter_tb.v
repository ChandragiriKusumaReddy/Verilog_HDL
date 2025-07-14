module up_down_counter_tb;
  reg clk,rst,dir;
  wire [3:0] count;
  
  up_down_counter DUT(.clk(clk),.rst(rst),.dir(dir),.count(count));
  
  initial begin
    $monitor("Time=%0t | Reset=%d |Direction=%d | Count=%b",$time,rst,dir,count);
     clk=0; rst=1; dir=1;
     #5 rst=0;
    #40 dir =0;
    #40 dir = 1;
    #40 $finish;
  end   
    always #5 clk=~clk;
 
endmodule


//Output:
# KERNEL: Time=0 | Reset=1 |Direction=1 | Count=0000
# KERNEL: Time=5 | Reset=0 |Direction=1 | Count=0001
# KERNEL: Time=15 | Reset=0 |Direction=1 | Count=0010
# KERNEL: Time=25 | Reset=0 |Direction=1 | Count=0011
# KERNEL: Time=35 | Reset=0 |Direction=1 | Count=0100
# KERNEL: Time=45 | Reset=0 |Direction=0 | Count=0011
# KERNEL: Time=55 | Reset=0 |Direction=0 | Count=0010
# KERNEL: Time=65 | Reset=0 |Direction=0 | Count=0001
# KERNEL: Time=75 | Reset=0 |Direction=0 | Count=0000
# KERNEL: Time=85 | Reset=0 |Direction=1 | Count=0001
# KERNEL: Time=95 | Reset=0 |Direction=1 | Count=0010
# KERNEL: Time=105 | Reset=0 |Direction=1 | Count=0011
# KERNEL: Time=115 | Reset=0 |Direction=1 | Count=0100

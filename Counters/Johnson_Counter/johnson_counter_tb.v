module twisted_ring_counter_tb;
  reg clk;
  reg rst;
  wire [3:0] q;
  
  twisted_ring_counter DUT(.clk(clk),
                   .rst(rst),
                   .q(q)
                  );
  initial begin
    $monitor("Time=%0t  | Reset=%d | Output=%b",$time,rst,q);
    rst=1; clk =0;
    #5 rst=0;
    #100 $finish;
  end
  always #5 clk=~clk;
endmodule

//Output:
# KERNEL: Time=0  | Reset=1 | Output=0000
# KERNEL: Time=5  | Reset=0 | Output=0001
# KERNEL: Time=15  | Reset=0 | Output=0011
# KERNEL: Time=25  | Reset=0 | Output=0111
# KERNEL: Time=35  | Reset=0 | Output=1111
# KERNEL: Time=45  | Reset=0 | Output=1110
# KERNEL: Time=55  | Reset=0 | Output=1100
# KERNEL: Time=65  | Reset=0 | Output=1000
# KERNEL: Time=75  | Reset=0 | Output=0000
# KERNEL: Time=85  | Reset=0 | Output=0001
# KERNEL: Time=95  | Reset=0 | Output=0011

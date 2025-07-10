module d_ff_tb();
  reg clk,rst,d;
  wire q,qn;

  d_ff_synchronous DUT(.clk(clk), .rst(rst), .d(d), .q(q), .qn(qn));
  //d_ff_async DUT(.clk(clk), .rstn(rstn), .d(d), .q(q), .qn(qn));
    initial begin
        $monitor("Time=%0t | D=%b CLK=%b RST=%b | Q=%b Qn=%b", $time, d, clk, rst, q, qn);
        d = 0; clk = 0; rst = 1;
        #5 rst = 0;

        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        #10 d = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | D=0 CLK=0 RST=1 | Q=0 Qn=1
# KERNEL: Time=5 | D=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=10 | D=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=15 | D=1 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=20 | D=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=25 | D=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=30 | D=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=35 | D=1 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=40 | D=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=45 | D=1 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=50 | D=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=55 | D=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=60 | D=0 CLK=0 RST=0 | Q=0 Qn=1

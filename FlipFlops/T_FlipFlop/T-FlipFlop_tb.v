module t_ff_tb();
  reg t,clk,rst;
  wire qn,q;

  t_ff DUT(.clk(clk), .rst(rst), .t(t), .qn(qn), .q(q));

  initial begin
        $monitor("Time=%0t | T=%b CLK=%b RST=%b | Q=%b Qn=%b", $time, t, clk, rst, q, qn);
        t = 0; clk = 0; rst = 1;
        #5 rst = 0;

        #10 t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 t = 1;
        #10 t = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | T=0 CLK=0 RST=1 | Q=0 Qn=1
# KERNEL: Time=5 | T=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=10 | T=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=15 | T=1 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=20 | T=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=25 | T=0 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=30 | T=0 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=35 | T=1 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=40 | T=1 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=45 | T=1 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=50 | T=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=55 | T=0 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=60 | T=0 CLK=0 RST=0 | Q=1 Qn=0

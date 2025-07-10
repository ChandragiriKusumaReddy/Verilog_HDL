module jk_ff_tb();
  reg j,k,clk,rst;
  wire q,qn;

  jk_ff DUT(.j(j), .k(k), .clk(clk), .rst(rst), .q(q), .qn(qn));

  initial begin
    $monitor("Time=%0t | J=%b K=%b CLK=%b RST=%b | Q=%b Qn=%b",$time,j,k,clk,rst,q,qn);
    j=0; k=0; clk=0; rst=1;
    #5 rst=0;

    #5 j=0;k=0;
    #10 j=0;k=1;
    #10 j=1;k=0;
    #10 j=1;k=1;
    #10 j=0;k=0;
    #10 $finish;
  end
 always #5 clk=~clk;
endmodule


//Output:
# KERNEL: Time=0 | J=0 K=0 CLK=0 RST=1 | Q=0 Qn=1
# KERNEL: Time=5 | J=0 K=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=10 | J=0 K=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=15 | J=0 K=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=20 | J=0 K=1 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=25 | J=0 K=1 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=30 | J=1 K=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=35 | J=1 K=0 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=40 | J=1 K=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=45 | J=1 K=1 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=50 | J=0 K=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=55 | J=0 K=0 CLK=1 RST=0 | Q=0 Qn=1

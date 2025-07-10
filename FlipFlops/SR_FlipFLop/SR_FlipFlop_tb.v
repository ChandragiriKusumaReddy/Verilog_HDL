module sr_ff_tb();
  reg s,r,clk,rst;
  wire q,qn;

  sr_ff DUT(.clk(clk), .rst(rst), .s(s), .r(r), .q(q), .qn(qn));

  initial begin
         $monitor("Time=%0t | S=%b R=%b CLK=%b RST=%b | Q=%b Qn=%b", $time, s, r, clk, rst, q, qn);
        s = 0; r = 0; clk = 0; rst = 1;
        #5 rst = 0;

        // Test cases
        #5 s = 0; r = 0; // Hold
        #10 s = 1; r = 0; // Set
        #10 s = 0; r = 1; // Reset
        #10 s = 1; r = 1; // Invalid
        #10 s = 0; r = 0; // Hold again
        #10 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;
endmodule


//Output
# KERNEL: Time=0 | S=0 R=0 CLK=0 RST=1 | Q=0 Qn=1
# KERNEL: Time=5 | S=0 R=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=10 | S=0 R=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=15 | S=0 R=0 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=20 | S=1 R=0 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=25 | S=1 R=0 CLK=1 RST=0 | Q=1 Qn=0
# KERNEL: Time=30 | S=0 R=1 CLK=0 RST=0 | Q=1 Qn=0
# KERNEL: Time=35 | S=0 R=1 CLK=1 RST=0 | Q=0 Qn=1
# KERNEL: Time=40 | S=1 R=1 CLK=0 RST=0 | Q=0 Qn=1
# KERNEL: Time=45 | S=1 R=1 CLK=1 RST=0 | Q=x Qn=x
# KERNEL: Time=50 | S=0 R=0 CLK=0 RST=0 | Q=x Qn=x
# KERNEL: Time=55 | S=0 R=0 CLK=1 RST=0 | Q=x Qn=x

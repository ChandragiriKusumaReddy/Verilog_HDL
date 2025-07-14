module tb_ripple_counter;
    reg clk = 0, rst;
    wire [3:0] q;

    ripple_counter uut (.clk(clk), .rst(rst), .q(q));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\trst\tq");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, rst, q);

        rst = 1; #10;
        rst = 0; #100;
        $finish;
    end
endmodule


//Output:
# KERNEL: 0	0	1	0000
# KERNEL: 5	1	1	0000
# KERNEL: 10	0	0	0000
# KERNEL: 15	1	0	1111
# KERNEL: 20	0	0	1111
# KERNEL: 25	1	0	1110
# KERNEL: 30	0	0	1110
# KERNEL: 35	1	0	1101
# KERNEL: 40	0	0	1101
# KERNEL: 45	1	0	1100
# KERNEL: 50	0	0	1100
# KERNEL: 55	1	0	1011
# KERNEL: 60	0	0	1011
# KERNEL: 65	1	0	1010
# KERNEL: 70	0	0	1010
# KERNEL: 75	1	0	1001
# KERNEL: 80	0	0	1001
# KERNEL: 85	1	0	1000
# KERNEL: 90	0	0	1000
# KERNEL: 95	1	0	0111
# KERNEL: 100	0	0	0111
# KERNEL: 105	1	0	0110

module tb_mod_n_counter;
    reg clk = 0, rst;
    wire [3:0] count;

    mod_n_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\trst\tcount");
        $monitor("%0t\t%b\t%b\t%d", $time, clk, rst, count);

        rst = 1; #10;      // Apply reset
        rst = 0;           // Release reset
        #100;              // Let it count
        $finish;
    end
endmodule



//Output:
# KERNEL: Time	clk	rst	count
# KERNEL: 0	0	1	 0
# KERNEL: 5	1	1	 0
# KERNEL: 10	0	0	 0
# KERNEL: 15	1	0	 1
# KERNEL: 20	0	0	 1
# KERNEL: 25	1	0	 2
# KERNEL: 30	0	0	 2
# KERNEL: 35	1	0	 3
# KERNEL: 40	0	0	 3
# KERNEL: 45	1	0	 4
# KERNEL: 50	0	0	 4
# KERNEL: 55	1	0	 5
# KERNEL: 60	0	0	 5
# KERNEL: 65	1	0	 6
# KERNEL: 70	0	0	 6
# KERNEL: 75	1	0	 7
# KERNEL: 80	0	0	 7
# KERNEL: 85	1	0	 8
# KERNEL: 90	0	0	 8
# KERNEL: 95	1	0	 9
# KERNEL: 100	0	0	 9
# KERNEL: 105	1	0	 0

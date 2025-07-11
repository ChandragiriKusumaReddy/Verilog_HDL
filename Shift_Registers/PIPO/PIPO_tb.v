module PIPO_tb;
    reg clk, rst;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;
    PIPO uut (.clk(clk), .rst(rst), .parallel_in(parallel_in), .parallel_out(parallel_out));

    initial begin
        $monitor("Time=%0t | Parallel In=%b | Parallel Out=%b", $time, parallel_in, parallel_out);
        clk = 0; rst = 1; parallel_in = 4'b0000;
        #5 rst = 0;
        parallel_in = 4'b1101; #10;
        parallel_in = 4'b0110; #10;
        parallel_in = 4'b1001; #10;
        $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | Parallel In=0000 | Parallel Out=0000
# KERNEL: Time=5 | Parallel In=1101 | Parallel Out=1101
# KERNEL: Time=15 | Parallel In=0110 | Parallel Out=0110
# KERNEL: Time=25 | Parallel In=1001 | Parallel Out=1001

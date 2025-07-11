module SIPO_tb;
    reg clk, rst, serial_in;
    wire [3:0] parallel_out;
    SIPO uut (.clk(clk), .rst(rst), .serial_in(serial_in), .parallel_out(parallel_out));

    initial begin
        $monitor("Time=%0t | Input=%b | Output=%b", $time, serial_in, parallel_out);
        clk = 0; rst = 1; serial_in = 0;
        #5 rst = 0;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | Input=0 | Output=0000
# KERNEL: Time=5 | Input=1 | Output=0001
# KERNEL: Time=15 | Input=0 | Output=0010
# KERNEL: Time=25 | Input=1 | Output=0101
# KERNEL: Time=35 | Input=1 | Output=1011

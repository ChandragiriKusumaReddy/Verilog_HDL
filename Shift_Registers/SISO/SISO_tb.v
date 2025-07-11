module SISO_tb;
    reg clk, rst, serial_in;
    wire serial_out;
    SISO uut (.clk(clk), .rst(rst), .serial_in(serial_in), .serial_out(serial_out));

    initial begin
        $monitor("Time=%0t | Input=%b | Output=%b", $time, serial_in, serial_out);
        clk = 0; rst = 1; serial_in = 0;
        #5 rst = 0;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        $finish;
    end

    always #5 clk = ~clk; // 10ns clock period
endmodule


//Output:
# KERNEL: Time=0 | Input=0 | Output=0
# KERNEL: Time=5 | Input=1 | Output=0
# KERNEL: Time=15 | Input=0 | Output=0
# KERNEL: Time=25 | Input=1 | Output=0
# KERNEL: Time=35 | Input=1 | Output=1

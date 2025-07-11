module PISO_tb;
    reg clk, rst, load;
    reg [3:0] parallel_in;
    wire serial_out;
    PISO uut (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .serial_out(serial_out));

    initial begin
        $monitor("Time=%0t | Load=%b | Parallel In=%b | Serial Out=%b", $time, load, parallel_in, serial_out);
        clk = 0; rst = 1; load = 0; parallel_in = 4'b1011;
        #5 rst = 0;
        load = 1; #10;
        load = 0; #10;
        #40 $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | Load=0 | Parallel In=1011 | Serial Out=0
# KERNEL: Time=5 | Load=1 | Parallel In=1011 | Serial Out=1
# KERNEL: Time=15 | Load=0 | Parallel In=1011 | Serial Out=0
# KERNEL: Time=25 | Load=0 | Parallel In=1011 | Serial Out=1
# KERNEL: Time=45 | Load=0 | Parallel In=1011 | Serial Out=0

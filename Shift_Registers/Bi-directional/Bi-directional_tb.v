module bidirectional_shift_register_tb;
    reg clk, rst, shift_en, dir, serial_in;
    wire [3:0] q;

    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .shift_en(shift_en),
        .dir(dir),
        .serial_in(serial_in),
        .q(q)
    );

    initial begin
        $monitor("Time=%0t | dir=%b | serial_in=%b | q=%b", $time, dir, serial_in, q);
        clk = 0;
        rst = 1;
        shift_en = 0;
        serial_in = 0;
        dir = 0;

        #5 rst = 0;

        // Right shift
        dir = 0; shift_en = 1;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;

        // Left shift
        dir = 1;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;

        $finish;
    end

    always #5 clk = ~clk;
endmodule


//Output:
# KERNEL: Time=0 | dir=0 | serial_in=0 | q=0000
# KERNEL: Time=5 | dir=0 | serial_in=1 | q=1000
# KERNEL: Time=15 | dir=0 | serial_in=0 | q=0100
# KERNEL: Time=25 | dir=0 | serial_in=1 | q=1010
# KERNEL: Time=35 | dir=1 | serial_in=1 | q=0101
# KERNEL: Time=45 | dir=1 | serial_in=0 | q=1010
# KERNEL: Time=55 | dir=1 | serial_in=1 | q=0101

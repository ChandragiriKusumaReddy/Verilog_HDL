module tb_register;
    reg [7:0] d;
    reg clk, rst, en;
    wire [7:0] q;

    // Instantiate desired register here:
     simple_register uut (.d(d), .clk(clk), .q(q));
    // register_with_enable uut (.d(d), .clk(clk), .en(en), .q(q));
    // register_sync_reset uut (.d(d), .clk(clk), .rst(rst), .q(q));
    //register_async_reset uut (.d(d), .clk(clk), .rst(rst), .q(q));

    initial begin
        $monitor("Time=%0t | D=%h CLK=%b RST=%b EN=%b | Q=%h", $time, d, clk, rst, en, q);

        clk = 0; rst = 1; en = 1; d = 8'h00;
        #5 rst = 0;

        #10 d = 8'hA5;
        #10 d = 8'h3C;
        #10 en = 0; d = 8'hFF;  // no update if en=0
        #10 en = 1; d = 8'h0F;
        #10 rst = 1;            // async reset
        #10 rst = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;
endmodule

//output:
# KERNEL: Time=0 | D=00 CLK=0 RST=1 EN=1 | Q=xx
# KERNEL: Time=5 | D=00 CLK=1 RST=0 EN=1 | Q=00
# KERNEL: Time=10 | D=00 CLK=0 RST=0 EN=1 | Q=00
# KERNEL: Time=15 | D=a5 CLK=1 RST=0 EN=1 | Q=a5
# KERNEL: Time=20 | D=a5 CLK=0 RST=0 EN=1 | Q=a5
# KERNEL: Time=25 | D=3c CLK=1 RST=0 EN=1 | Q=3c
# KERNEL: Time=30 | D=3c CLK=0 RST=0 EN=1 | Q=3c
# KERNEL: Time=35 | D=ff CLK=1 RST=0 EN=0 | Q=ff
# KERNEL: Time=40 | D=ff CLK=0 RST=0 EN=0 | Q=ff
# KERNEL: Time=45 | D=0f CLK=1 RST=0 EN=1 | Q=0f
# KERNEL: Time=50 | D=0f CLK=0 RST=0 EN=1 | Q=0f
# KERNEL: Time=55 | D=0f CLK=1 RST=1 EN=1 | Q=0f
# KERNEL: Time=60 | D=0f CLK=0 RST=1 EN=1 | Q=0f
# KERNEL: Time=65 | D=0f CLK=1 RST=0 EN=1 | Q=0f
# KERNEL: Time=70 | D=0f CLK=0 RST=0 EN=1 | Q=0f

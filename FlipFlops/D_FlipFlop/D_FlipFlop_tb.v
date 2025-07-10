module d_ff_tb();
  reg clk,rst,d;
  wire q;

  d_ff_synchronous DUT(.clk(clk), .rst(rst), .d(d), .q(q));
 //d_ff_async DUT(.clk(clk), .rstn(rstn), .d(d), .q(q));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=0;d=0;
    //rstn=0;d=0;
    #10 d=1;
    //#10 rstn=1;
    //#10 rstn=0;
    #10 rst=1;
    #10 rst=0;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 $finish;
  end
endmodule
  

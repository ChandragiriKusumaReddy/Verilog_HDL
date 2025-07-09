module sr_latch_tb;
  reg s,r;
  wire q,qn;

  sr_latch_gate dut(.s(s),.r(r),.q(q),.qn(qn));
  sr_latch_dataflow dut(.s(s),.r(r),.q(q),.qn(qn));
  sr_latch_behavioral dut(.s(s),.r(r),.q(q),.qn(qn));

  initial begin
    $display("Time\t S R | Q Qn");
    $monitor("%0t\t%b %b | %b %b", $time, S, R, Q, Qn);

    //Test Cases
    s=0;r=0;#10;  //Hold
    s=0;r=1;#10;  //Reset
    s=1;r=0;#10;  //Set
    s=0;r=0;#10;  //Hold
    s=1;r=1;#10;  //Invalid
    s=0;r=0;#10;  //Back to hold

    $finish;
  end
endmodule

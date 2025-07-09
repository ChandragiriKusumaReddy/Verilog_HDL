module t_latch_tb;
  reg T, EN;
  wire Q, Qn;

  // Instantiate the DUT
  t_latch_behavioral dut (.T(T), .EN(EN), .Q(Q), .Qn(Qn));
  // t_latch_dataflow   dut (.T(T), .EN(EN), .Q(Q), .Qn(Qn));
  // t_latch_gate       dut (.T(T), .EN(EN), .Q(Q), .Qn(Qn));

  initial begin
    $display("Time\tEN T | Q Qn");
    $monitor("%0t\t%b  %b | %b %b", $time, EN, T, Q, Qn);

    // Test cases
    EN = 0; T = 0; #10; // Hold
    EN = 1; T = 0; #10; // Hold
    EN = 1; T = 1; #10; // Toggle
    EN = 1; T = 1; #10; // Toggle again
    EN = 1; T = 0; #10; // Hold
    EN = 0; T = 1; #10; // Hold
    $finish;
  end
endmodule

module d_latch_tb;
  reg D, EN;
  wire Q, Qn;

  // Instantiate DUT - uncomment the one you want to test:
  d_latch_gate       dut (.D(D), .EN(EN), .Q(Q), .Qn(Qn));
  // d_latch_dataflow   dut (.D(D), .EN(EN), .Q(Q), .Qn(Qn));
  // d_latch_behavioral dut (.D(D), .EN(EN), .Q(Q), .Qn(Qn));

  initial begin
    $display("Time\tEN D | Q Qn");
    $monitor("%0t\t%b  %b | %b %b", $time, EN, D, Q, Qn);

    // Test cases
    EN = 0; D = 0; #10; // Hold
    EN = 1; D = 0; #10; // Reset
    EN = 1; D = 1; #10; // Set
    EN = 0; D = 0; #10; // Hold (should retain last state)
    EN = 1; D = 0; #10; // Reset again
    EN = 0; D = 1; #10; // Hold again
    $finish;
  end
endmodule

module jk_latch_tb;
  reg J, K, EN;
  wire Q, Qn;

  // Instantiate the DUT
  jk_latch_behavioral dut (.J(J), .K(K), .EN(EN), .Q(Q), .Qn(Qn));
  // jk_latch_gate dut (.J(J), .K(K), .EN(EN), .Q(Q), .Qn(Qn));

  initial begin
    $display("Time\tEN J K | Q Qn");
    $monitor("%0t\t%b  %b %b | %b %b", $time, EN, J, K, Q, Qn);

    // Test Cases
    EN = 0; J = 0; K = 0; #10; // Hold
    EN = 1; J = 0; K = 0; #10; // Hold
    EN = 1; J = 1; K = 0; #10; // Set
    EN = 1; J = 0; K = 1; #10; // Reset
    EN = 1; J = 1; K = 1; #10; // Toggle
    EN = 1; J = 1; K = 1; #10; // Toggle again
    EN = 0; J = 0; K = 0; #10; // Hold
    $finish;
  end
endmodule

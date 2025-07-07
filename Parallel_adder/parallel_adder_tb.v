module tb_parallel_adder;

  reg  [3:0] a, b;
  wire [4:0] sum_dataflow, sum_behavioral, sum_structural;

  // Instantiate all three versions
  parallel_adder_dataflow   u1 (a, b, sum_dataflow);
  parallel_adder_behavioral u2 (a, b, sum_behavioral);
  parallel_adder_structural u3 (a, b, sum_structural);

  initial begin
    $display("Time\tA\tB\tDataflow\tBehavioral\tStructural");
    $monitor("%0t\t%0d\t%0d\t%0d\t\t%0d\t\t%0d", 
             $time, a, b, sum_dataflow, sum_behavioral, sum_structural);

    // Apply some test vectors
    a = 4'd3; b = 4'd5; #10;
    a = 4'd7; b = 4'd9; #10;
    a = 4'd15; b = 4'd15; #10;
    a = 4'd0; b = 4'd0; #10;
    a = 4'd8; b = 4'd1; #10;

    $finish;
  end
endmodule

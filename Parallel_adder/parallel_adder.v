//Data flow modeling
module parallel_adder_dataflow (
  input  [3:0] a, b,
  output [4:0] sum
);
  assign sum = a + b;
endmodule


//Behavioral modeling
module parallel_adder_behavioral (
  input  [3:0] a, b,
  output reg [4:0] sum
);
  always @(*) begin
    sum = a + b;
  end
endmodule


//Structural modeling
module full_adder (
  input  a, b, cin,
  output sum, cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module parallel_adder_structural (
  input  [3:0] a, b,
  output [4:0] sum
);
  wire [3:0] carry;
  
  full_adder fa0 (a[0], b[0], 0      , sum[0], carry[0]);
  full_adder fa1 (a[1], b[1], carry[0], sum[1], carry[1]);
  full_adder fa2 (a[2], b[2], carry[1], sum[2], carry[2]);
  full_adder fa3 (a[3], b[3], carry[2], sum[3], carry[3]);

  assign sum[4] = carry[3];
endmodule

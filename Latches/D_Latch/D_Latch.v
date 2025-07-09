//Gate-Level modeling
module d_latch_gate(
  input d,en,
  output q,qn);
  wire n1,n2,n3,n4;

  not(n1,d);
  and(n2,d,en);
  and(n3,n1,en);
  nor(q,n3,qn);
  nor(qn,n2,q);
endmodule

//Data Flow modeling
module d_latch_dataflow(
  input d,en,
  output q,qn);
assign q = en?d:q;
assign qn = ~q;
endmodule

//Behavioral modeling
module d_latch_behavioral(
  input d,en,
  output reg q,
  output qn);
  always@(d or en) begin
    if(en)
      q=d;
  end
  assign qn=~q;
endmodule

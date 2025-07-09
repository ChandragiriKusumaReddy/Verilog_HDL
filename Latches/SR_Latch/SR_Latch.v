//Gate-level modeling
module sr_latch_gate(
  input s,r,
  output q,qn);
wire n1,n2;
  nor(n1,r,qn); //q=!(r+qn)
  nor(n2,s,q);  //qn=!(s+q)
assign q=n1;
assign qn=n2;
endmodule


//Data-flow Modeling
module sr_latch_dataflow(
  input s,r,
  output q,qn);
  assign q = ~(r | qn);
  assign qn = ~(s | q);
endmodule


//Behavior Modeling
module sr_latch_behavioral(
  input s,r,
  output q,qn);
  always@(*)
    begin
      if(s==0 && r==0) //Hold state
        else if(s==0 && r==1) q=0;
      else if(s==1 && r==0) q=1;
      else q=1'bx;//Invalid
      qn=~q;
    end
endmodule

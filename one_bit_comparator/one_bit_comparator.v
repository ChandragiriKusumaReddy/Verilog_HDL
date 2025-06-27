//behavioral modelling
module one_bit_comparator(
  input a,b,
  output lt,gt,eq
);
  assign lt = (~a&b);
  assign gt = (a&~b);
  assign eq = ~(a^b); //assign eq = (~a&~b) | (a&b) ;
endmodule


//gate level modelling
module one_bit_comparator(
  input a,b,
  output lt,gt,eq
);
  wire w1,w2;
  not n1(w1,a);
  not n2(w2,b);

  xnor x1(eq,a,b); //equal
  and a1(lt,n1,b);  //less than
  and a2(gt,n2,a);  //greater than
endmodule

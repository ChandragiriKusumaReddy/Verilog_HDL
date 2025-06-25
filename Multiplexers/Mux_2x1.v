//dataflow modelling
module mux_2x1(
  input a,b,
  input s,
  output y);
  assign y = (~s&a)|(s&b);
endmodule

//gate-level modelling
module mux_2x1(
  input a,b,
  input s,
  output y);
  wire w1,w2,w3;

  not n1(w1,s);
  and a1(w2,w1,a);
  and a2(w3,s,b);
  or o1(y,w2,w3);
endmodule

//behavioral modelling
module mux_2x1(
  input a,b,
  input s,
  output y);
  always@(*)
    begin
      case(s)
        1'b0: y=a;
        1'b1: y=b;
      endcase
    end
endmodule

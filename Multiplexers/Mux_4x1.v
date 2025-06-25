//dataflow modelling
module mux_4x1(
  input [3:0]i,
  input [1:0]s,
  output y);
  assign y = (~s[1]&~s[0]&i[0]) |
              (~s[1]&s[0]&i[1]) |
              (s[1]&~s[0]&i[2]) |
              (s[1]&s[0]&i[3]) ;
    endmodule

//behavioral modelling
module mux_4x1(
  input [3:0] i,
  input [1:0] s,
  output y);
  always@(*)
    begin
      case(s)
        0: y = i[0];
        1: y = i[1];
        2: y = i[2];
        3: y = i[3];
      endcase
    end
endmodule

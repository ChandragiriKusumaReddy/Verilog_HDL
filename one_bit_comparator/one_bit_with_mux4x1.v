//mux4x1
module mux4x1_ex(
  input [3:0] i,
  input s1,s0,
  output y
);
  always@(*)
    begin
      case({s1,s0})
        0: y=i[0];
        1: y=i[1];
        2: y=i[2];
        3: y=i[3];
      endcase
    end
endmodule

module one_bit_with_mux(
  input a,b,
  output lt,gt,eq 
);
  mux4x1 m1(1'b0,1'b1,1'b0,1'b0,a,b,lt);
  mux4x1 m2(1'b0,1'b0,1'b1,1'b0,a,b,gt);
  mux4x1 m3(1'b1,1'b0,1'b0,1'b1,a,b,eq);
endmodule

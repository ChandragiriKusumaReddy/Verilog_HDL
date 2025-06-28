//dataflow modelling
module demux1x8(
  input i,
  input [2:0]s,
  output reg [7:0]y
);
  assign y[0] = (~s[0]&~s[1]&~s[2]&i);
  assign y[1] = (~s[0]&~s[1]&s[2]&i);
  assign y[2] = (~s[0]&s[1]&~s[2]&i);
  assign y[3] = (~s[0]&s[1]&s[2]&i);
  assign y[4] = (s[0]&~s[1]&~s[2]&i);
  assign y[5] = (s[0]&~s[1]&s[2]&i);
  assign y[6] = (s[0]&s[1]&~s[2]&i);
  assign y[7] = (s[0]&s[1]&s[2]&i);

endmodule

//gate-level modelling
module demux1x8(
  input i,
  input [2:0]s,
  output reg [7:0]y
);
wire s0,s1,s2;

  not n1(s0,s[0]);
  not n2(s1,s[1]);
  not n3(s2,s[2]);

  and a1(y[0],n1,n2,n3,i);
  and a2(y[1],n1,n2,s[2],i);
  and a3(y[2],n1,s[1],n3,i);
  and a4(y[3],n1,s[1],s[0],i);
  and a5(y[4],s[0],n2,n3,i);
  and a6(y[5],s[0],n1,s[2],i);
  and a7(y[6],s[0],s[1],n3,i);
  and a8(y[7],s[0],s[1],s[2],i);

endmodule

//behavioral modelling
module demux1x8(
  input i,
  input [2:0]s,
  output reg [7:0]y
);
  always@(*)
    begin
      case(s)
        3'b000: y[0]=i;
        3'b001: y[1]=i;
        3'b010: y[2]=i;
        3'b011: y[3]=i;
        3'b100: y[4]=i;
        3'b101: y[5]=i;
        3'b110: y[6]=i;
        3'b111: y[7]=i;
        default y = 8'b00000000;
      endcase
    end
endmodule

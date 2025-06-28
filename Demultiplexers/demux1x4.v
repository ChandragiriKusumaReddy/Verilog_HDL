//data flow modelling
module demux1x4(
  input i,
  input [1:0]s,
  output [3:0] y
  );
assign y0 = (~s0&~s1&i);
assign y1 = (~s0&s1&i);
assign y2 = (s0&~s1&i);
assign y3 = (s0&s1&i);
endmodule

//behavioral modelling
module demux4x1(
  input i,
  input [1:0]s,
  output [3:0] y
);
  always@(*)
    begin
      case({s0,s1})
        2'b00 : y[0] = i;
        2'b01 : y[1] = i;
        2'b10 : y[2] = i;
        2'b11 : y[3] = i;
        default : y = 4'b0000;
      endcase
    end
endmodule

//gate-level modelling
module demux1x4(
  input i,
  input [1:0] s,
  output [3:0] y
);
  wire nsel0,nsel1;

  not n1(nsel0,s0);
  not n2(nsel1,s1);

  and a1(y[0],n1,n2,i);
  and a2(y[1],n1,s[1],i);
  and a3(y[2],s[0],n2,i);
  and a4(y[3],s[0],s[1],i);
  
endmodule

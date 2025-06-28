module demux_1x2(
  input i,s,
  output [1:0]
);
  assign y[0] = (~s&i);
  assign y[1] = (s&i);
endmodule

module demux_1x8(
  input i,
  input [2:0]s,
  output reg [7:0]y
);
  wire w1,w2,w3,w4,w5,w6;

  demux_1x2 m1(w1,w2,s[0],i);
  demux_1x2 m2(w3,w4,s[1],w1);
  demux_1x2 m3(w5,w6,s[1],w2);
  demux_1x2 m4(y[0],y[1],s[2],w3);
  demux_1x2 m5(y[2],y[3],s[2],w4);
  demux_1x2 m6(y[4],y[5],s[2],w5);
  demux_1x2 m7(y[6],y[7],s[2],w6);

endmodule

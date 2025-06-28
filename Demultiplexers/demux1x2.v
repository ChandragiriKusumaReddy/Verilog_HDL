module demux1x2(
  input i,s,
  output y0,y1
);
  assign y0 = (~s0&~i);
  assign y1 = (~s0&i);
endmodule

//encoder using assign statement
module enc4x2(
  input [3:0]y,
  output reg [1:2]i
);
  assign i = (in[0]) ? 2'b00:
    (in[1]) ? 2'b01:
    (in[2]) ? 2'b10:
    (in[3]) ? 2'b11:
              2'bxx;
endmodule


//encoder using if-else
module enc4x2(
  input [3:0]y,
  output reg [1:0] i
);
  always@(*)
    begin
  if (in[3])
      i=2'b11;
  else if (in[2])
    i=2'b10;
  else if (in[1])
    i=2'b01;
  else if (in[0])
    i=2'b00;
  else
    i=2'bxx;
    end
endmodule

    
//encoder using case statement
module enc4x2(
  input [3:0]y,
  output reg[1:0] i
);
  always@(*)
    begin
      case(y)
        4'b0001 : i=2'b00;
        4'b0010 : i=2'b01;
        4'b0100 : i=2'b10;
        4'b1000 : i=2'b11;
        default : i=2'bxx;
      endcase
    end
endmodule

//using case statement
module decoder2x4(
  input [1:0] in,
  output reg [3:0] out
);
  always@(*)
    begin
      case(in)
        2'b00 : out=4'b0001;
        2'b01 : out=4'b0010;
        2'b10 : out=4'b0100;
        2'b11 : out=4'b1000;
        default : out = 4'b0000;
      endcase
    end
endmodule

//using if-else statement
module decoder2x4(
  input [1:0] in,
  output reg [3:0] out
);
  always@(*)
    begin
      if (in==2'b00)
        out = 4'b0001;
      else if (in==2'b01)
        out = 4'b0010;
      else if (in==2'b10)
        out = 4'b0100;
      else if (in==2'b11)
        out = 4'b1000;
      else
        out = 4'b0000;
    end
endmodule


//using assign statement
module decoder2x4(
  input [1:0] in,
  output reg [3:0] out
);
  assign out = (in==2'b00) ? 4'b0001 :
               (in==2'b01) ? 4'b0010 :
               (in==2'b10) ? 4'b0100 :
               (in==2'b11) ? 4'b1000 :
                             4'b0000;
endmodule


//decoder using boolean expression
module decoder2x4(
  input [1:0] in,
  output reg [3:0] out
);
  assign out[0] = ~in[0]&~in[1];
  assign out[1] = ~in[0]&in[1];
  assign out[2] = in[0]&~in[1];
  assign out[3] = in[0]&in[1];
endmodule

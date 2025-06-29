//using case statement
module decoder3x8(
  input [2:0] in,
  output reg [7:0] out
);
  always@(*)
    begin
      case(in)
        3'b000 : out = 8'b0000_0001;
        3'b001 : out = 8'b0000_0010;
        3'b010 : out = 8'b0000_0100;
        3'b011 : out = 8'b0000_1000;
        3'b100 : out = 8'b0001_0000;
        3'b101 : out = 8'b0010_0000;
        3'b110 : out = 8'b0100_0000;
        3'b111 : out = 8'b1000_0000;
        default : out = 8'b0000_0000;
      endcase
    end
endmodule


//using if-else statement
module decoder3x8(
  input [2:0] in,
  output reg [7:0] out
);
  always@(*)
    begin
      if (in == 3'b000)
        out = 8'b0000_0001;
      else if(in == 3'b001)
        out = 8'b0000_0010;
      else if(in == 3'b010)
        out = 8'b0000_0100;
      else if(in == 3'b011)
        out = 8'b0000_1000;
      else if(in == 3'b100)
        out = 8'b0001_0000;
      else if(in == 3'b101)
        out = 8'b0010_0000;
      else if(in == 3'b110)
        out = 8'b0100_0000;
      else if(in == 3'b111)
        out = 8'b1000_0000;
      else
        out = 8'b0000_0000;
    end
endmodule


//using assign statement
module decoder3x8(
  input [2:0] in,
  output reg [7:0] out
);
  assign out = (in == 3'b000) ? 8'b0000_0001:
               (in == 3'b001) ? 8'b0000_0010:
               (in == 3'b010) ? 8'b0000_0100:
               (in == 3'b011) ? 8'b0000_1000:
               (in == 3'b100) ? 8'b0001_0000:
               (in == 3'b101) ? 8'b0010_0000:
               (in == 3'b110) ? 8'b0100_0000:
               (in == 3'b111) ? 8'b1000_0000:
                                8'b0000_0000;
endmodule


//using boolean expression
module decoder3x8(
  input [2:0] in,
  output reg [7:0] out
);
  assign out[0] = ~in[0]&~in[1]&~in[2];
  assign out[1] = ~in[0]&~in[1]&in[2];
  assign out[2] = ~in[0]&in[1]&~in[2];
  assign out[3] = ~in[0]&in[1]&in[2];
  assign out[4] = in[0]&~in[1]&~in[2];
  assign out[5] = in[0]&~in[1]&in[2];
  assign out[6] = in[0]&in[1]&~in[2];
  assign out[7] = in[0]&in[1]&in[2];
endmodule

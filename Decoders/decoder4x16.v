//using case statement
module decoder4x16(
  input [3:0] in,
  output reg [15:0] out
);
  always@(*)
    begin
      case(in)
        4'b0000 : out = 16'b0000_0000_0000_0001;
        4'b0001 : out = 16'b0000_0000_0000_0010;
        4'b0010 : out = 16'b0000_0000_0000_0100;
        4'b0011 : out = 16'b0000_0000_0000_1000;
        4'b0100 : out = 16'b0000_0000_0001_0000;
        4'b0101 : out = 16'b0000_0000_0010_0000;
        4'b0110 : out = 16'b0000_0000_0100_0000;
        4'b0111 : out = 16'b0000_0000_1000_0000;
        4'b1000 : out = 16'b0000_0001_0000_0000;
        4'b1001 : out = 16'b0000_0010_0000_0000;
        4'b1010 : out = 16'b0000_0100_0000_0000;
        4'b1011 : out = 16'b0000_1000_0000_0000;
        4'b1100 : out = 16'b0001_0000_0000_0000;
        4'b1101 : out = 16'b0010_0000_0000_0000;
        4'b1110 : out = 16'b0100_0000_0000_0000;
        4'b1111 : out = 16'b1000_0000_0000_0000;
        default : out = 16'b0000_0000_0000_0000;
      endcase
    end
endmodule


//using if-else satement
module decoder4x16(
  input [3:0] in,
  output reg [15:0] out
);
  always@(*)
    begin
      if (in == 4'b0000)
        out = 16'b0000_0000_0000_0001;
      else if (in == 4'b0001)
        out = 16'b0000_0000_0000_0010;
      else if (in == 4'b0010)
        out = 16'b0000_0000_0000_0100;
      else if (in == 4'b0011)
        out = 16'b0000_0000_0000_1000;
      else if (in == 4'b0100)
        out = 16'b0000_0000_0001_0000;
      else if (in == 4'b0101)
        out = 16'b0000_0000_0010_0000;
      else if (in == 4'b0110)
        out = 16'b0000_0000_0100_0000;
      else if (in == 4'b0111)
        out = 16'b0000_0000_1000_000;
      else if (in == 4'b1000)
        out = 16'b0000_0001_0000_0000;
      else if (in == 4'b1001)
        out = 16'b0000_0010_0000_0000;
      else if (in == 4'b1010)
        out = 16'b0000_0100_0000_0000;
      else if (in == 4'b1011)
        out = 16'b0000_1000_0000_0000;
      else if (in == 4'b1100)
        out = 16'b0001_0000_0000_0000;
      else if (in == 4'b1101)
        out = 16'b0010_0000_0000_0000;
      else if (in == 4'b1110)
        out = 16'b0100_0000_0000_0000;
      else if (in == 4'b1111)
        out = 16'b1000_0000_0000_0000;
      else
        out = 16'b0000_0000_0000_0000;
    end
endmodule


//using assign statement
module decoder4x16(
  input [3:0] in,
  output reg [15:0] out
);
  assign out = (in==4'b0000) ? 16'b0000_0000_0000_0001:
               (in==4'b0001) ? 16'b0000_0000_0000_0010:
               (in==4'b0010) ? 16'b0000_0000_0000_0100:
               (in==4'b0011) ? 16'b0000_0000_0000_1000:
               (in==4'b0100) ? 16'b0000_0000_0001_0000:
               (in==4'b0101) ? 16'b0000_0000_0010_0000:
               (in==4'b0110) ? 16'b0000_0000_0100_0000:
               (in==4'b0111) ? 16'b0000_0000_1000_0000:
               (in==4'b1000) ? 16'b0000_0001_0000_0000:
               (in==4'b1001) ? 16'b0000_0010_0000_0000:
               (in==4'b1010) ? 16'b0000_0100_0000_0000:
               (in==4'b1011) ? 16'b0000_1000_0000_0000:
               (in==4'b1100) ? 16'b0001_0000_0000_0000:
               (in==4'b1101) ? 16'b0010_0000_0000_0000:
               (in==4'b1110) ? 16'b0100_0000_0000_0000:
               (in==4'b1111) ? 16'b1000_0000_0000_0000:
                               16'b0000_0000_0000_0000;
endmodule


//using boolean expression
module decoder4x16(
  input [3:0] in,
  output reg [15:0] out
);
  assign out[0] = ~in[0]&~in[1]&~in[2]&~in[3];
  assign out[1] = ~in[0]&~in[1]&~in[2]&in[3];
  assign out[2] = ~in[0]&~in[1]&in[2]&~in[3];
  assign out[3] = ~in[0]&~in[1]&in[2]&in[3];
  assign out[4] = ~in[0]&in[1]&~in[2]&~in[3];
  assign out[5] = ~in[0]&in[1]&~in[2]&in[3];
  assign out[6] = ~in[0]&in[1]&in[2]&~in[3];
  assign out[7] = ~in[0]&in[1]&in[2]&in[3];
  assign out[8] = in[0]&~in[1]&~in[2]&~in[3];
  assign out[9] = in[0]&~in[1]&~in[2]&in[3];
  assign out[10] = in[0]&~in[1]&in[2]&~in[3];
  assign out[11] = in[0]&~in[1]&in[2]&in[3];
  assign out[12] = in[0]&in[1]&~in[2]&~in[3];
  assign out[13] = in[0]&in[1]&~in[2]&in[3];
  assign out[14] = in[0]&in[1]&in[2]&~in[3];
  assign out[15] = in[0]&in[1]&in[2]&in[3];
endmodule

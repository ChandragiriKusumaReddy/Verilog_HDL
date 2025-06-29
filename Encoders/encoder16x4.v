//using case statement
module enc16x4(
  input [15:0] y,
  output reg [3:0] i
);
  always@(*)
    begin
      case(y)
        16'b0000_0000_0000_0001 : i=4'b0000;
        16'b0000_0000_0000_0010 : i=4'b0001;
        16'b0000_0000_0000_0100 : i=4'b0010;
        16'b0000_0000_0000_1000 : i=4'b0011;
        16'b0000_0000_0001_0000 : i=4'b0100;
        16'b0000_0000_0010_0000 : i=4'b0101;
        16'b0000_0000_0100_0000 : i=4'b0110;
        16'b0000_0000_1000_0000 : i=4'b0111;
        16'b0000_0001_0000_0000 : i=4'b1000;
        16'b0000_0010_0000_0000 : i=4'b1001;
        16'b0000_0100_0000_0000 : i=4'b1010;
        16'b0000_1000_0000_0000 : i=4'b1011;
        16'b0001_0000_0000_0000 : i=4'b1100;
        16'b0010_0000_0000_0000 : i=4'b1101;
        16'b0100_0000_0000_0000 : i=4'b1110;
        16'b1000_0000_0000_0000 : i=4'b1111;
        default : i=4'bxxxx;
      endcase
    end
endmodule


//using if-else statement
module enc16x4(
  input [15:0] y,
  output reg [3:0] i
);
  always@(*)
    begin
      if (y[0]) i = 4'b0000;
      else if (y[1]) i = 4'b0001;
      else if (y[2]) i = 4'b0010;
      else if (y[3]) i = 4'b0011;
      else if (y[4]) i = 4'b0100;
      else if (y[5]) i = 4'b0101;
      else if (y[6]) i = 4'b0110;
      else if (y[7]) i = 4'b0111;
      else if (y[8]) i = 4'b1000;
      else if (y[9]) i = 4'b1001;
      else if (y[10]) i = 4'1010;
      else if (y[11]) i = 4'b1011;
      else if (y[12]) i = 4'b1100;
      else if (y[13]) i = 4'b1101;
      else if (y[14]) i = 4'b1110;
      else if (y[15]) i = 4'b1111;
      else i = 4'bxxxx;
    end
endmodule


//using assign statement
module enc16x4(
  input [15:0] y,
  output reg [3:0] i
);
  assign i = (y[0]) ? 4'b0000:
             (y[1]) ? 4'b0001:
             (y[2]) ? 4'b0010:
             (y[3]) ? 4'b0011:
             (y[4]) ? 4'b0100:
             (y[5]) ? 4'b0101:
             (y[6]) ? 4'b0110:
             (y[7]) ? 4'b0111:
             (y[8]) ? 4'b1000:
             (y[9]) ? 4'b1001:
             (y[10]) ? 4'b1010:
             (y[11]) ? 4'b1011:
             (y[12]) ? 4'b1100:
             (y[13]) ? 4'b1101:
             (y[14]) ? 4'b1110:
             (y[15]) ? 4'b1111:
                       4'bxxxx;
endmodule
    
   

//uisng case statement
module enc8x3(
  input [7:0] y,
  output reg[2:0]i
);
  always@(*)
    begin
      case(i)
        8'b00000001 : i=3'b000;
        8'b00000010 : i=3'b001;
        8'b00000100 : i=3'b010;
        8'b00001000 : i=3'b011;
        8'b00010000 : i=3'b100;
        8'b00100000 : i=3'b101;
        8'b01000000 : i=3'b110;
        8'b10000000 : i=3'b111;
        default : i=3'bxxx;
      endcase
    end
endmodule


//using if-else statement
module enc8x3(
  input [7:0] y,
  output reg[2:0]i
);
  always@(*)
    begin
      if(y[0])
        i = 3'b000;
      else if(y[1])
        i = 3'b001;
      else if(y[2])
        i = 3'b010;
      else if(y[3])
        i = 3'b011;
      else if(y[4])
        i = 3'b100;
      else if(y[5])
        i = 3'b101;
      else if(y[6])
        i = 3'b110;
      else if(y[7])
        i = 3'b111;
      else
        i = 3'bxxx;
    end
endmodule


//using assign statement
module enc8x3(
  input [7:0] y,
  output reg[2:0]i
);
  assign i = (y[0]) ? 3'b000:
             (y[1]) ? 3'b001:
             (y[2]) ? 3'b010:
             (y[3]) ? 3'b011:
             (y[4]) ? 3'b100:
             (y[5]) ? 3'b101:
             (y[6]) ? 3'b110:
             (y[7]) ? 3'b111:
                      3'bxxx;
endmodule

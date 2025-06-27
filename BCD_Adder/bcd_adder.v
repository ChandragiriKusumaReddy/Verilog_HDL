module bcd_adder(
  input [3:0] a,b,
  input cin,
  output reg [3:0] sum,
  output reg cout
);
  reg [3:0] temp_sum;
  always@(*)
    begin
      temp_sum = a+b+cin;
      if(temp_sum>9)
        temp_sum = temp_sum+5'd6;
        cout=1;
        sum = temp_sum[3:0];
      else
        begin
          cout=0;
          sum = temp_sum[3:0];
        end
    end
endmodule



//another method
module bcd_adder(
  input [3:0] a,b,
  input cin,
  output reg [3:0] sum,
  output reg cout
);
  wire [3:0] binary_sum;
  wire [3:0] corrected_sum;

  assign binary_sum = a+b+cin;

  assign corrected_sum = (binary_sum>9) ? (binary_sum+5'd6) : binary_sum;

  assign sum = corrected_sum[3:0];
  assign cout = corrected_sum[4];
endmodule
  
          

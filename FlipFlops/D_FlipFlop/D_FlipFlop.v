//D FLipflop with synchronous reset
module d_fliflop_synchronous(
    input clk,
    input rst,
    input d,
    output reg q
);
    always@(posedge clk ) begin
        if(rst)
            q<=0;
        else
            q<=d;
    end
endmodule


// D Flip-Flop with Asynchronous active-low Reset
module d_flipflop_async_reset (
    input clk, 
    input rstn, 
    input d, 
    output reg q
);
  always @(posedge clk or posedge rstn) begin
      if (!rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule

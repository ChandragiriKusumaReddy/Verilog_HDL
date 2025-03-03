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

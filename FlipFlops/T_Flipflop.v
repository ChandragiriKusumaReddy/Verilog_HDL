// T FlipFlop using verilog
module t_flipflop (
    input clk, 
    input t, 
    output reg q
);
    always @(posedge clk) begin
        if (t)
            q <= ~q; // Toggle state
    end
endmodule

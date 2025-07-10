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


//Behavioral Modeling
module t_ff(
    input t,clk,rst,
    output reg q,
    output qn
);
    assign qn=~q;
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                q<=0;
            else begin
                if(t)
                    q<=~q;  //Toggle
                else
                    q<=q;  //Hold
            end
        end
    endmodule


//Gate Level Modeling
module t_ff_gate(
    input t,clk,rst,
    output reg q,
    output qn
);
    assign qn=~q;
    always@(posedge clk or posedge rst) begin
        if(rst)
            q<=0;
        else
            q<=t?~q:q; //Toggle if T=1
    end
endmodule

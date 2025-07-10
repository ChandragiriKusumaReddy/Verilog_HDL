// SR-FlipFlop using case statement
module sr_flipflop (
    input clk, 
    input s, 
    input r, 
    output reg q
);
    always @(posedge clk) begin
        case ({s, r})
            2'b00: q <= q;  // No change
            2'b01: q <= 0;  // Reset
            2'b10: q <= 1;  // Set
            2'b11: q <= 1'bx; // Invalid state
        endcase
    end
endmodule


//Behavioral Modeling
module sr_ff_behavioral(
    input s,r,clk,rst,
    output reg q,
    output qn
);
    assign qn=~q;
    always@(posedge clk or posedge rst) begin
        if(rst)
            q<=0;
        else
            begin
                case({s,r})
                    2'b00: q<=q;  //No Change
                    2'b01: q<=0;  //Reset
                    2'b10: q<=1;  //Set
                    2'b11: q<=1'bx  //Invalid State
                endcase
            end
endmodule


//Gate Level Modeling
module sr_ff_gatelevel(
    input s,r,clk,rst,
    output reg q,
    output qn
);
    always@(posedge clk or posedge rst) begin
        if(rst)
            q<=0;
        else if(~s & ~r)
            q<=q;  //No Change
        else if(~s & r)
            q<=0;  Reset
        else if(s & ~r)
            q<=1;  //Set
        else if(s & r)
            q<=1'bx;  //Invalid
    end
endmodule
                        

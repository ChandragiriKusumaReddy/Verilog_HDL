// JK FlipFlop using case statement
module jk_flipflop (
    input clk, 
    input j, 
    input k, 
    output reg q
);
    always @(posedge clk) begin
        case ({j, k})
            2'b00: q <= q;     // No change
            2'b01: q <= 0;     // Reset
            2'b10: q <= 1;     // Set
            2'b11: q <= ~q;    // Toggle
        endcase
    end
endmodule


//Behavioral modeling
module jk_fliflop(
    input j,k,clk,rst,
    output reg q,
    output qn
);
    assign qn=~q;
    always@(posedge clk or posedge rst) begin
        if(rst)
            q<=0;
        else 
            begin
                case({j,k})
                    2'b00: q<=q;  //No Change
                    2'b01: q<=0;  //Reset
                    2'b10: q<=1;  //Set
                    2'b11: q<=~q;  //Toggle
                endcase
            end
    end
endmodule



//Gate Level Modeling
module jk_ff_gate(
    input j,k,clk,rst,
    output reg q,
    output qn
);
    assign qn=~q;
    always@(posedge clk or posedge rst) begin
        if(rst)
            q<=0;
        else if(~j & ~k)
            q<=q;   //No Change
        else if(~j & k)
            q<=0;   //Reset
        else if(j & ~k)
            q<=1;   //Set
        else if(j & k)
            q<=~q;  //Toggle
    end
endmodule

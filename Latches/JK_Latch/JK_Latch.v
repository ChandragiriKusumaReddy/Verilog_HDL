//Behavioral Modeling
module jk_latch_behavioral(
  input j,k,en,
  output reg q,
  output qn);
  always@(j or k or en)
    begin
      if(en) begin
        case({j,k})
          2'b00: q=q;   //Hold
          2'b01: q=0;   //Reset
          2'b10: q=1;   //Set
          2'b11: q=~q;  //Toggle
        endcase
      end
    end
  assign qn=~q;
endmodule


//Gate-Level Modeling
module jk_latch_gate (
  input J, K, EN,
  output Q, Qn
);
  wire j_en, k_en, q_nxt, qn_nxt;

  and (j_en, J, EN, Qn);    // Enable AND not Q for Set
  and (k_en, K, EN, Q);     // Enable AND Q for Reset
  nor (q_nxt, k_en, Qn);
  nor (qn_nxt, j_en, Q);

  assign Q = q_nxt;
  assign Qn = qn_nxt;
endmodule


          

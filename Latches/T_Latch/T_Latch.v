//Behavioral Modeling
module t_latch_behavioral (
  input T, EN,
  output reg Q,
  output Qn
);
  always @ (T or EN) begin
    if (EN) begin
      if (T)
        Q = ~Q;   // Toggle
      else
        Q = Q;    // Hold
    end
  end

  assign Qn = ~Q;
endmodule


//Gate-Level Modeling
module t_latch_gate (
  input T, EN,
  output Q, Qn
);
  wire j, k;

  assign j = T;
  assign k = T;

  wire j_en, k_en, q_nxt, qn_nxt;

  and (j_en, j, EN, Qn);
  and (k_en, k, EN, Q);
  nor (q_nxt, k_en, Qn);
  nor (qn_nxt, j_en, Q);

  assign Q = q_nxt;
  assign Qn = qn_nxt;
endmodule



//Dataflow modeling
module t_latch_dataflow (
  input T, EN,
  output Q, Qn
);
  wire t_en;

  assign t_en = T & EN;
  assign Q    = t_en ? ~Q : Q; // Feedback may not synthesize
  assign Qn   = ~Q;
endmodule

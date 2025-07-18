module swap_without_temp;
  reg [3:0] a, b;

  initial begin
    a = 4'd9;   // Example: 1001
    b = 4'd4;   // Example: 0100

    $display("Before Swap: a = %d, b = %d", a, b);

    a = a ^ b;
    b = a ^ b;
    a = a ^ b;

    $display("After Swap:  a = %d, b = %d", a, b);
  end
endmodule


//Output:
# KERNEL: Before Swap: a =  9, b =  4
# KERNEL: After Swap:  a =  4, b =  9

module swap_temp;
  int a=5,b=10,temp;
  initial begin
    $display("Before Swap the values are a = %0d, b = %0d",a,b);
    temp = a;
    a = b;
    b = temp;
    $display("After Swap the values are a = %0d,b = %0d",a,b);
  end
endmodule

//Output:
# KERNEL: Before Swap the values are a = 5, b = 10
# KERNEL: After Swap the values are a = 10,b = 5

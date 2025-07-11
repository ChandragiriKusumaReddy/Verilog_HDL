module bidirectional_shift_register (
    input clk,
    input rst,
    input shift_en,
    input dir, // 0: right shift, 1: left shift
    input serial_in,
    output reg [3:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else if (shift_en) begin
            if (dir)
                q <= {q[2:0], serial_in};  // Left shift
            else
                q <= {serial_in, q[3:1]};  // Right shift
        end
    end
endmodule

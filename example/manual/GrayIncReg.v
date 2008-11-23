// File: GrayIncReg.v
// Generated by MyHDL 0.6
// Date: Sun Nov 23 11:34:35 2008

`timescale 1ns/10ps

module GrayIncReg (
    graycnt,
    enable,
    clock,
    reset
);

output [7:0] graycnt;
reg [7:0] graycnt;
input enable;
input clock;
input reset;

reg [7:0] graycnt_comb;
reg [7:0] gray_inc_1_bincnt;



always @(posedge clock, negedge reset) begin: GRAYINCREG_GRAY_INC_1_INC_1_INCLOGIC
    if ((reset == 0)) begin
        gray_inc_1_bincnt <= 0;
    end
    else begin
        if (enable) begin
            gray_inc_1_bincnt <= ((gray_inc_1_bincnt + 1) % 256);
        end
    end
end

always @(gray_inc_1_bincnt) begin: GRAYINCREG_GRAY_INC_1_BIN2GRAY_1_LOGIC
    integer i;
    reg [9-1:0] Bext;
    Bext = 9'h0;
    Bext = gray_inc_1_bincnt;
    for (i=0; i<8; i=i+1) begin
        graycnt_comb[i] <= (Bext[(i + 1)] ^ Bext[i]);
    end
end

always @(posedge clock) begin: GRAYINCREG_REG_1
    graycnt <= graycnt_comb;
end

endmodule

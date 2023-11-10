
module simpledsp ( clk, rst, inst, dpu_x, dpu_y, dpu_w, dpu_z, dpu_output, 
        dpu_status );
  input [1:0] inst;
  input [3:0] dpu_x;
  input [3:0] dpu_y;
  input [3:0] dpu_w;
  input [3:0] dpu_z;
  output [3:0] dpu_output;
  output [3:0] dpu_status;
  input clk, rst;
  wire   \dp/logic_res[2] , \dp/logic_res[1] , \dp/logic_res[0] ,
         \dp/dpuz_regnext[3] , \dp/dpuz_regnext[2] , \dp/dpuz_regnext[1] ,
         \dp/dpuz_regnext[0] , \dp/mux_regout[3] , \dp/mux_regout[2] ,
         \dp/mux_regout[1] , \dp/mux_regout[0] , \dp/dpuz_regout[3] ,
         \dp/dpuz_regout[2] , \dp/dpuz_regout[1] , \dp/dpuz_regout[0] ,
         \dp/dpuw_regout[3] , \dp/dpuw_regout[2] , \dp/dpuw_regout[1] ,
         \dp/dpuw_regout[0] , \dp/arith_regout[3] , \dp/arith_regout[2] ,
         \dp/arith_regout[1] , \dp/arith_regout[0] , \cp/n20 , \cp/n19 ,
         \cp/n18 , \cp/n17 , \cp/n16 , \cp/n14 , \cp/n13 , \cp/n12 , \cp/n10 ,
         \cp/n9 , \cp/N39 , \cp/N38 , \cp/state[0] , \cp/state[1] ,
         \dp/arith/n18 , \dp/arith/n16 , \dp/arith/n14 , \dp/arith/n12 ,
         \dp/arith/n10 , \dp/arith/n8 , \dp/arith/n7 , \dp/arith/n6 ,
         \dp/arith/N26 , \dp/arith/N25 , \dp/arith/N24 , \dp/arith/N23 ,
         \dp/arith/N22 , \dp/arith/N20 , \dp/arith/N19 , \dp/arith/N18 ,
         \dp/arith/N17 , \dp/arith/N16 , \dp/arith/N15 , \dp/arith/N14 ,
         \dp/arith/N13 , \dp/mux_unit/n9 , \dp/mux_unit/n8 , \dp/mux_unit/n7 ,
         \dp/mux_unit/n6 , \dp/logic/n20 , \dp/logic/n19 , \dp/logic/n18 ,
         \dp/logic/n17 , \dp/logic/n16 , \dp/logic/n15 , \dp/logic/n14 ,
         \dp/logic/n13 , \dp/logic/n12 , \dp/logic/n11 , \dp/logic/n10 ,
         \dp/logic/n9 , \dp/logic/n8 , \dp/logic/n7 , \dp/logic/n6 ,
         \dp/logic/n5 , \dp/logic/n4 , \dp/logic/n3 , \dp/logic/n2 ,
         \dp/arith/r306/carry[4] , \dp/arith/r306/carry[3] ,
         \dp/arith/r306/carry[2] , \dp/arith/add_37/carry[3] ,
         \dp/arith/add_37/carry[2] , \dp/arith/sub_37/carry[4] ,
         \dp/arith/sub_37/carry[3] , \dp/arith/sub_37/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17, n18, n19,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n109, n110, n111, n112, n113, n114;
  wire   [1:0] op_arith;
  wire   [1:0] op_logic;

  OAI21X1 \cp/U27  ( .A(dpu_status[0]), .B(n64), .C(n58), .Y(\cp/n19 ) );
  AOI21X1 \cp/U26  ( .A(n95), .B(n100), .C(n58), .Y(\cp/n20 ) );
  AOI21X1 \cp/U25  ( .A(\cp/n19 ), .B(n94), .C(rst), .Y(\cp/N38 ) );
  OAI21X1 \cp/U24  ( .A(\cp/state[1] ), .B(inst[1]), .C(n107), .Y(\cp/n16 ) );
  AOI21X1 \cp/U23  ( .A(dpu_status[0]), .B(dpu_status[1]), .C(n64), .Y(
        \cp/n18 ) );
  OAI21X1 \cp/U22  ( .A(dpu_status[0]), .B(dpu_status[1]), .C(n22), .Y(
        \cp/n17 ) );
  AOI21X1 \cp/U21  ( .A(\cp/n17 ), .B(\cp/n16 ), .C(rst), .Y(\cp/N39 ) );
  AOI22X1 \cp/U20  ( .A(n106), .B(\cp/state[0] ), .C(\cp/state[1] ), .D(n107), 
        .Y(\cp/n13 ) );
  OAI21X1 \cp/U18  ( .A(n32), .B(n100), .C(n47), .Y(op_arith[0]) );
  NAND2X1 \cp/U17  ( .A(dpu_status[3]), .B(n32), .Y(\cp/n14 ) );
  OAI21X1 \cp/U16  ( .A(n32), .B(n95), .C(n46), .Y(op_arith[1]) );
  MUX2X1 \cp/U15  ( .B(dpu_status[0]), .A(inst[0]), .S(n63), .Y(\cp/n12 ) );
  AOI22X1 \cp/U14  ( .A(n63), .B(n95), .C(n62), .D(n64), .Y(op_logic[1]) );
  OAI21X1 \cp/U13  ( .A(inst[1]), .B(n106), .C(\cp/state[0] ), .Y(\cp/n9 ) );
  NAND3X1 \cp/U12  ( .A(\cp/state[1] ), .B(n107), .C(inst[0]), .Y(\cp/n10 ) );
  INVX2 \cp/U5  ( .A(\cp/n12 ), .Y(op_logic[0]) );
  DFFPOSX1 \cp/state_reg[1]  ( .D(n21), .CLK(clk), .Q(\cp/state[1] ) );
  DFFPOSX1 \cp/state_reg[0]  ( .D(n44), .CLK(clk), .Q(\cp/state[0] ) );
  AOI22X1 \dp/arith/U24  ( .A(op_arith[1]), .B(\dp/arith/N23 ), .C(n68), .D(
        \dp/arith/N13 ), .Y(\dp/arith/n18 ) );
  AOI22X1 \dp/arith/U21  ( .A(op_arith[1]), .B(\dp/arith/N22 ), .C(n67), .D(
        \dp/arith/N22 ), .Y(\dp/arith/n16 ) );
  AOI22X1 \dp/arith/U18  ( .A(op_arith[1]), .B(\dp/arith/N25 ), .C(n68), .D(
        \dp/arith/N15 ), .Y(\dp/arith/n14 ) );
  AOI22X1 \dp/arith/U15  ( .A(op_arith[1]), .B(\dp/arith/N24 ), .C(n68), .D(
        \dp/arith/N14 ), .Y(\dp/arith/n12 ) );
  NOR3X1 \dp/arith/U12  ( .A(n17), .B(dpu_status[3]), .C(n60), .Y(
        \dp/arith/n7 ) );
  AOI22X1 \dp/arith/U11  ( .A(\dp/arith/n10 ), .B(n101), .C(n68), .D(
        \dp/arith/N16 ), .Y(\dp/arith/n8 ) );
  NAND3X1 \dp/arith/U9  ( .A(\dp/arith/n7 ), .B(n57), .C(n30), .Y(
        \dp/arith/n6 ) );
  AND2X2 \dp/arith/U6  ( .A(op_arith[0]), .B(n4), .Y(\dp/arith/n10 ) );
  DFFPOSX1 \dp/arith_reg/data_reg[0]  ( .D(n89), .CLK(clk), .Q(
        \dp/arith_regout[0] ) );
  DFFPOSX1 \dp/arith_reg/data_reg[1]  ( .D(n88), .CLK(clk), .Q(
        \dp/arith_regout[1] ) );
  DFFPOSX1 \dp/arith_reg/data_reg[2]  ( .D(n90), .CLK(clk), .Q(
        \dp/arith_regout[2] ) );
  DFFPOSX1 \dp/arith_reg/data_reg[3]  ( .D(n91), .CLK(clk), .Q(
        \dp/arith_regout[3] ) );
  AOI22X1 \dp/mux_unit/U9  ( .A(n65), .B(\dp/dpuw_regout[0] ), .C(
        \dp/arith_regout[0] ), .D(n66), .Y(\dp/mux_unit/n9 ) );
  AOI22X1 \dp/mux_unit/U8  ( .A(n65), .B(\dp/dpuw_regout[1] ), .C(
        \dp/arith_regout[1] ), .D(n66), .Y(\dp/mux_unit/n8 ) );
  AOI22X1 \dp/mux_unit/U7  ( .A(n65), .B(\dp/dpuw_regout[2] ), .C(
        \dp/arith_regout[2] ), .D(n66), .Y(\dp/mux_unit/n7 ) );
  AOI22X1 \dp/mux_unit/U6  ( .A(n65), .B(\dp/dpuw_regout[3] ), .C(
        \dp/arith_regout[3] ), .D(n66), .Y(\dp/mux_unit/n6 ) );
  NOR2X1 \dp/logic/U26  ( .A(op_logic[0]), .B(\dp/mux_regout[3] ), .Y(
        \dp/logic/n20 ) );
  AOI22X1 \dp/logic/U25  ( .A(n3), .B(n12), .C(op_logic[0]), .D(
        \dp/mux_regout[3] ), .Y(\dp/logic/n19 ) );
  NAND3X1 \dp/logic/U23  ( .A(\dp/dpuz_regnext[3] ), .B(\dp/mux_regout[3] ), 
        .C(\dp/logic/n6 ), .Y(\dp/logic/n18 ) );
  NOR2X1 \dp/logic/U21  ( .A(op_logic[0]), .B(\dp/mux_regout[0] ), .Y(
        \dp/logic/n16 ) );
  AOI22X1 \dp/logic/U20  ( .A(n3), .B(\dp/logic/n16 ), .C(op_logic[0]), .D(
        \dp/mux_regout[0] ), .Y(\dp/logic/n15 ) );
  MUX2X1 \dp/logic/U19  ( .B(\dp/logic/n15 ), .A(\dp/logic/n16 ), .S(
        \dp/dpuz_regnext[0] ), .Y(\dp/logic/n13 ) );
  NAND3X1 \dp/logic/U18  ( .A(\dp/dpuz_regnext[0] ), .B(\dp/mux_regout[0] ), 
        .C(\dp/logic/n6 ), .Y(\dp/logic/n14 ) );
  NAND2X1 \dp/logic/U17  ( .A(\dp/logic/n13 ), .B(\dp/logic/n14 ), .Y(
        \dp/logic_res[0] ) );
  NOR2X1 \dp/logic/U16  ( .A(op_logic[0]), .B(\dp/mux_regout[1] ), .Y(
        \dp/logic/n12 ) );
  AOI22X1 \dp/logic/U15  ( .A(n29), .B(\dp/logic/n12 ), .C(op_logic[0]), .D(
        \dp/mux_regout[1] ), .Y(\dp/logic/n11 ) );
  MUX2X1 \dp/logic/U14  ( .B(\dp/logic/n11 ), .A(\dp/logic/n12 ), .S(
        \dp/dpuz_regnext[1] ), .Y(\dp/logic/n9 ) );
  NAND3X1 \dp/logic/U13  ( .A(\dp/dpuz_regnext[1] ), .B(\dp/mux_regout[1] ), 
        .C(\dp/logic/n6 ), .Y(\dp/logic/n10 ) );
  NAND2X1 \dp/logic/U12  ( .A(\dp/logic/n9 ), .B(n9), .Y(\dp/logic_res[1] ) );
  NOR2X1 \dp/logic/U11  ( .A(op_logic[0]), .B(\dp/mux_regout[2] ), .Y(
        \dp/logic/n8 ) );
  AOI22X1 \dp/logic/U10  ( .A(n29), .B(\dp/logic/n8 ), .C(op_logic[0]), .D(
        \dp/mux_regout[2] ), .Y(\dp/logic/n7 ) );
  MUX2X1 \dp/logic/U9  ( .B(\dp/logic/n7 ), .A(\dp/logic/n8 ), .S(
        \dp/dpuz_regnext[2] ), .Y(\dp/logic/n4 ) );
  NAND3X1 \dp/logic/U8  ( .A(\dp/dpuz_regnext[2] ), .B(\dp/mux_regout[2] ), 
        .C(\dp/logic/n6 ), .Y(\dp/logic/n5 ) );
  NAND2X1 \dp/logic/U7  ( .A(\dp/logic/n4 ), .B(n8), .Y(\dp/logic_res[2] ) );
  NAND3X1 \dp/logic/U6  ( .A(\dp/logic_res[0] ), .B(\dp/logic_res[1] ), .C(
        \dp/logic_res[2] ), .Y(\dp/logic/n3 ) );
  NOR3X1 \dp/logic/U4  ( .A(\dp/logic_res[0] ), .B(n11), .C(\dp/logic/n2 ), 
        .Y(dpu_status[0]) );
  AND2X2 \dp/logic/U2  ( .A(op_logic[0]), .B(n29), .Y(\dp/logic/n6 ) );
  OR2X2 \dp/logic/U1  ( .A(\dp/logic_res[1] ), .B(\dp/logic_res[2] ), .Y(
        \dp/logic/n2 ) );
  DFFPOSX1 \dp/outreg/data_reg[0]  ( .D(n111), .CLK(clk), .Q(dpu_output[0]) );
  DFFPOSX1 \dp/outreg/data_reg[1]  ( .D(n110), .CLK(clk), .Q(dpu_output[1]) );
  DFFPOSX1 \dp/outreg/data_reg[2]  ( .D(n109), .CLK(clk), .Q(dpu_output[2]) );
  DFFPOSX1 \dp/outreg/data_reg[3]  ( .D(n92), .CLK(clk), .Q(dpu_output[3]) );
  DFFPOSX1 \dp/dpuz_regreg/data_reg[0]  ( .D(n87), .CLK(clk), .Q(
        \dp/dpuz_regnext[0] ) );
  DFFPOSX1 \dp/dpuz_regreg/data_reg[1]  ( .D(n86), .CLK(clk), .Q(
        \dp/dpuz_regnext[1] ) );
  DFFPOSX1 \dp/dpuz_regreg/data_reg[2]  ( .D(n85), .CLK(clk), .Q(
        \dp/dpuz_regnext[2] ) );
  DFFPOSX1 \dp/dpuz_regreg/data_reg[3]  ( .D(n84), .CLK(clk), .Q(
        \dp/dpuz_regnext[3] ) );
  DFFPOSX1 \dp/mux_reg/data_reg[0]  ( .D(n80), .CLK(clk), .Q(
        \dp/mux_regout[0] ) );
  DFFPOSX1 \dp/mux_reg/data_reg[1]  ( .D(n79), .CLK(clk), .Q(
        \dp/mux_regout[1] ) );
  DFFPOSX1 \dp/mux_reg/data_reg[2]  ( .D(n78), .CLK(clk), .Q(
        \dp/mux_regout[2] ) );
  DFFPOSX1 \dp/mux_reg/data_reg[3]  ( .D(n77), .CLK(clk), .Q(
        \dp/mux_regout[3] ) );
  DFFPOSX1 \dp/dpuz_reg/data_reg[0]  ( .D(n76), .CLK(clk), .Q(
        \dp/dpuz_regout[0] ) );
  DFFPOSX1 \dp/dpuz_reg/data_reg[1]  ( .D(n75), .CLK(clk), .Q(
        \dp/dpuz_regout[1] ) );
  DFFPOSX1 \dp/dpuz_reg/data_reg[2]  ( .D(n74), .CLK(clk), .Q(
        \dp/dpuz_regout[2] ) );
  DFFPOSX1 \dp/dpuz_reg/data_reg[3]  ( .D(n73), .CLK(clk), .Q(
        \dp/dpuz_regout[3] ) );
  DFFPOSX1 \dp/dpuw_reg/data_reg[0]  ( .D(n72), .CLK(clk), .Q(
        \dp/dpuw_regout[0] ) );
  DFFPOSX1 \dp/dpuw_reg/data_reg[1]  ( .D(n71), .CLK(clk), .Q(
        \dp/dpuw_regout[1] ) );
  DFFPOSX1 \dp/dpuw_reg/data_reg[2]  ( .D(n70), .CLK(clk), .Q(
        \dp/dpuw_regout[2] ) );
  DFFPOSX1 \dp/dpuw_reg/data_reg[3]  ( .D(n69), .CLK(clk), .Q(
        \dp/dpuw_regout[3] ) );
  FAX1 \dp/arith/r306/U1_1  ( .A(n6), .B(dpu_y[1]), .C(n82), .YC(
        \dp/arith/r306/carry[2] ), .YS(\dp/arith/N23 ) );
  FAX1 \dp/arith/r306/U1_2  ( .A(dpu_x[2]), .B(dpu_y[2]), .C(
        \dp/arith/r306/carry[2] ), .YC(\dp/arith/r306/carry[3] ), .YS(
        \dp/arith/N24 ) );
  FAX1 \dp/arith/r306/U1_3  ( .A(dpu_x[3]), .B(dpu_y[3]), .C(
        \dp/arith/r306/carry[3] ), .YC(\dp/arith/r306/carry[4] ), .YS(
        \dp/arith/N25 ) );
  FAX1 \dp/arith/r306/U1_4  ( .A(dpu_x[3]), .B(dpu_y[3]), .C(
        \dp/arith/r306/carry[4] ), .YC(), .YS(\dp/arith/N26 ) );
  FAX1 \dp/arith/add_37/U1_1  ( .A(n6), .B(dpu_y[1]), .C(n82), .YC(
        \dp/arith/add_37/carry[2] ), .YS(\dp/arith/N13 ) );
  FAX1 \dp/arith/add_37/U1_2  ( .A(dpu_x[2]), .B(dpu_y[2]), .C(
        \dp/arith/add_37/carry[2] ), .YC(\dp/arith/add_37/carry[3] ), .YS(
        \dp/arith/N14 ) );
  FAX1 \dp/arith/add_37/U1_3  ( .A(dpu_x[3]), .B(dpu_y[3]), .C(
        \dp/arith/add_37/carry[3] ), .YC(\dp/arith/N16 ), .YS(\dp/arith/N15 )
         );
  FAX1 \dp/arith/sub_37/U2_1  ( .A(n6), .B(n104), .C(n83), .YC(
        \dp/arith/sub_37/carry[2] ), .YS(\dp/arith/N18 ) );
  FAX1 \dp/arith/sub_37/U2_2  ( .A(dpu_x[2]), .B(n103), .C(
        \dp/arith/sub_37/carry[2] ), .YC(\dp/arith/sub_37/carry[3] ), .YS(
        \dp/arith/N19 ) );
  FAX1 \dp/arith/sub_37/U2_3  ( .A(dpu_x[3]), .B(n102), .C(
        \dp/arith/sub_37/carry[3] ), .YC(\dp/arith/sub_37/carry[4] ), .YS(
        \dp/arith/N20 ) );
  INVX1 \dp/outreg/U6  ( .A(n38), .Y(n111) );
  INVX1 \dp/outreg/U4  ( .A(n40), .Y(n109) );
  INVX1 \dp/outreg/U5  ( .A(n39), .Y(n110) );
  MUX2X1 U1 ( .B(n12), .A(n26), .S(n1), .Y(\dp/logic/n17 ) );
  INVX8 U2 ( .A(\dp/dpuz_regnext[3] ), .Y(n1) );
  INVX2 U3 ( .A(\cp/state[1] ), .Y(n106) );
  AND2X2 U4 ( .A(n93), .B(n17), .Y(n89) );
  INVX4 U5 ( .A(n43), .Y(n68) );
  AND2X1 U6 ( .A(\dp/arith/n10 ), .B(\dp/arith/N17 ), .Y(n41) );
  AND2X1 U7 ( .A(\dp/logic/n17 ), .B(n49), .Y(n10) );
  AND2X1 U8 ( .A(n93), .B(n11), .Y(n92) );
  AND2X1 U9 ( .A(n93), .B(n28), .Y(n88) );
  INVX2 U10 ( .A(op_arith[1]), .Y(n4) );
  AND2X1 U11 ( .A(\dp/arith/N26 ), .B(op_arith[1]), .Y(n31) );
  AND2X1 U12 ( .A(\cp/n9 ), .B(n45), .Y(n66) );
  AND2X1 U13 ( .A(\dp/arith/n10 ), .B(\dp/arith/N19 ), .Y(n51) );
  AND2X1 U14 ( .A(\dp/arith/n10 ), .B(\dp/arith/N20 ), .Y(n53) );
  AND2X1 U15 ( .A(\dp/arith/n10 ), .B(\dp/arith/N18 ), .Y(n55) );
  AND2X1 U16 ( .A(n18), .B(n54), .Y(n27) );
  INVX1 U17 ( .A(n29), .Y(n2) );
  INVX1 U18 ( .A(n2), .Y(n3) );
  INVX1 U19 ( .A(n10), .Y(n11) );
  BUFX2 U20 ( .A(dpu_x[0]), .Y(n5) );
  BUFX4 U21 ( .A(dpu_x[1]), .Y(n6) );
  AND2X2 U22 ( .A(dpu_y[0]), .B(dpu_x[0]), .Y(n82) );
  INVX1 U23 ( .A(n63), .Y(n64) );
  OR2X2 U24 ( .A(op_arith[1]), .B(op_arith[0]), .Y(n43) );
  AND2X2 U25 ( .A(\cp/state[0] ), .B(\cp/state[1] ), .Y(n63) );
  BUFX2 U26 ( .A(\dp/arith/n14 ), .Y(n7) );
  BUFX2 U27 ( .A(\dp/logic/n5 ), .Y(n8) );
  BUFX2 U28 ( .A(\dp/logic/n10 ), .Y(n9) );
  BUFX2 U29 ( .A(\dp/logic/n20 ), .Y(n12) );
  AND2X2 U30 ( .A(n23), .B(n50), .Y(n13) );
  AND2X2 U31 ( .A(n7), .B(n52), .Y(n14) );
  INVX1 U32 ( .A(n14), .Y(dpu_status[3]) );
  AND2X2 U33 ( .A(n24), .B(n42), .Y(n16) );
  INVX1 U34 ( .A(n16), .Y(n17) );
  BUFX2 U35 ( .A(\dp/arith/n18 ), .Y(n18) );
  OR2X2 U36 ( .A(n25), .B(n28), .Y(n19) );
  INVX1 U37 ( .A(n19), .Y(dpu_status[2]) );
  BUFX2 U38 ( .A(\cp/N39 ), .Y(n21) );
  BUFX2 U39 ( .A(\cp/n18 ), .Y(n22) );
  BUFX2 U40 ( .A(\dp/arith/n12 ), .Y(n23) );
  BUFX2 U41 ( .A(\dp/arith/n16 ), .Y(n24) );
  BUFX2 U42 ( .A(\dp/arith/n6 ), .Y(n25) );
  BUFX2 U43 ( .A(\dp/logic/n19 ), .Y(n26) );
  INVX1 U44 ( .A(n27), .Y(n28) );
  BUFX2 U45 ( .A(op_logic[1]), .Y(n29) );
  INVX1 U46 ( .A(n31), .Y(n30) );
  BUFX2 U47 ( .A(\cp/n13 ), .Y(n32) );
  BUFX2 U48 ( .A(\dp/mux_unit/n6 ), .Y(n33) );
  BUFX2 U49 ( .A(\dp/mux_unit/n7 ), .Y(n34) );
  BUFX2 U50 ( .A(\dp/mux_unit/n8 ), .Y(n35) );
  BUFX2 U51 ( .A(\dp/mux_unit/n9 ), .Y(n36) );
  BUFX2 U52 ( .A(\cp/n20 ), .Y(n37) );
  BUFX2 U53 ( .A(n112), .Y(n38) );
  BUFX2 U54 ( .A(n113), .Y(n39) );
  BUFX2 U55 ( .A(n114), .Y(n40) );
  INVX1 U56 ( .A(n41), .Y(n42) );
  BUFX2 U57 ( .A(\cp/N38 ), .Y(n44) );
  BUFX2 U58 ( .A(\cp/n10 ), .Y(n45) );
  BUFX2 U59 ( .A(\cp/n14 ), .Y(n46) );
  INVX1 U60 ( .A(n48), .Y(n47) );
  AND2X2 U61 ( .A(dpu_status[2]), .B(n32), .Y(n48) );
  BUFX2 U62 ( .A(\dp/logic/n18 ), .Y(n49) );
  INVX1 U63 ( .A(n51), .Y(n50) );
  INVX1 U64 ( .A(n53), .Y(n52) );
  INVX1 U65 ( .A(n55), .Y(n54) );
  BUFX2 U66 ( .A(\dp/logic/n3 ), .Y(n56) );
  BUFX2 U67 ( .A(\dp/arith/n8 ), .Y(n57) );
  INVX1 U68 ( .A(n59), .Y(n58) );
  AND2X1 U69 ( .A(n107), .B(n106), .Y(n59) );
  INVX1 U70 ( .A(n13), .Y(n60) );
  INVX1 U71 ( .A(n62), .Y(dpu_status[1]) );
  OR2X2 U72 ( .A(n10), .B(n56), .Y(n62) );
  INVX1 U73 ( .A(n66), .Y(n65) );
  INVX1 U74 ( .A(n43), .Y(n67) );
  INVX1 U75 ( .A(rst), .Y(n93) );
  INVX1 U76 ( .A(n35), .Y(n97) );
  INVX1 U77 ( .A(n33), .Y(n99) );
  INVX1 U78 ( .A(n36), .Y(n96) );
  INVX1 U79 ( .A(n34), .Y(n98) );
  AND2X1 U80 ( .A(n93), .B(n60), .Y(n90) );
  INVX1 U81 ( .A(n37), .Y(n94) );
  AND2X1 U82 ( .A(n93), .B(dpu_status[3]), .Y(n91) );
  INVX1 U83 ( .A(\dp/arith/sub_37/carry[4] ), .Y(n101) );
  INVX1 U84 ( .A(dpu_y[2]), .Y(n103) );
  INVX1 U85 ( .A(dpu_y[3]), .Y(n102) );
  INVX1 U86 ( .A(dpu_y[0]), .Y(n105) );
  INVX1 U87 ( .A(dpu_y[1]), .Y(n104) );
  INVX1 U88 ( .A(inst[0]), .Y(n100) );
  INVX1 U89 ( .A(inst[1]), .Y(n95) );
  INVX1 U90 ( .A(\cp/state[0] ), .Y(n107) );
  AND2X1 U91 ( .A(n93), .B(dpu_w[3]), .Y(n69) );
  AND2X1 U92 ( .A(n93), .B(dpu_w[2]), .Y(n70) );
  AND2X1 U93 ( .A(n93), .B(dpu_w[1]), .Y(n71) );
  AND2X1 U94 ( .A(n93), .B(dpu_w[0]), .Y(n72) );
  AND2X1 U95 ( .A(n93), .B(dpu_z[3]), .Y(n73) );
  AND2X1 U96 ( .A(n93), .B(dpu_z[2]), .Y(n74) );
  AND2X1 U97 ( .A(n93), .B(dpu_z[1]), .Y(n75) );
  AND2X1 U98 ( .A(n93), .B(dpu_z[0]), .Y(n76) );
  AND2X1 U99 ( .A(n93), .B(n99), .Y(n77) );
  AND2X1 U100 ( .A(n93), .B(n98), .Y(n78) );
  AND2X1 U101 ( .A(n93), .B(n97), .Y(n79) );
  AND2X1 U102 ( .A(n93), .B(n96), .Y(n80) );
  OR2X1 U104 ( .A(dpu_x[0]), .B(n105), .Y(n83) );
  AND2X1 U105 ( .A(n93), .B(\dp/dpuz_regout[3] ), .Y(n84) );
  AND2X1 U106 ( .A(n93), .B(\dp/dpuz_regout[2] ), .Y(n85) );
  AND2X1 U107 ( .A(n93), .B(\dp/dpuz_regout[1] ), .Y(n86) );
  AND2X1 U108 ( .A(n93), .B(\dp/dpuz_regout[0] ), .Y(n87) );
  XNOR2X1 U109 ( .A(n105), .B(n5), .Y(\dp/arith/N17 ) );
  XOR2X1 U110 ( .A(dpu_y[0]), .B(n5), .Y(\dp/arith/N22 ) );
  NAND2X1 U111 ( .A(n93), .B(\dp/logic_res[0] ), .Y(n112) );
  NAND2X1 U112 ( .A(n93), .B(\dp/logic_res[1] ), .Y(n113) );
  NAND2X1 U113 ( .A(n93), .B(\dp/logic_res[2] ), .Y(n114) );
endmodule



module data_bus_controller ( data_bus, fft_data_in, fir_data_in, iir_data_in, 
        fft_data_out, fir_data_out, iir_data_out, to_fft_empty, to_fft_full, 
        from_fft_empty, from_fft_full, to_fir_empty, to_fir_full, 
        from_fir_empty, from_fir_full, to_iir_empty, to_iir_full, 
        from_iir_empty, from_iir_full, data_to_fft, data_from_fft, data_to_fir, 
        data_from_fir, data_to_iir, data_from_iir, fft_enable, fir_enable, 
        iir_enable, fft_put_req, fft_get_req, fir_put_req, fir_get_req, 
        iir_put_req, iir_get_req, ram_read_enable, ram_write_enable, clk, 
        reset );
  inout [31:0] data_bus;
  input [31:0] fft_data_in;
  input [31:0] fir_data_in;
  input [31:0] iir_data_in;
  output [31:0] fft_data_out;
  output [31:0] fir_data_out;
  output [31:0] iir_data_out;
  input to_fft_empty, to_fft_full, from_fft_empty, from_fft_full, to_fir_empty,
         to_fir_full, from_fir_empty, from_fir_full, to_iir_empty, to_iir_full,
         from_iir_empty, from_iir_full, fft_enable, fir_enable, iir_enable,
         clk, reset;
  output data_to_fft, data_from_fft, data_to_fir, data_from_fir, data_to_iir,
         data_from_iir, fft_put_req, fft_get_req, fir_put_req, fir_get_req,
         iir_put_req, iir_get_req, ram_read_enable, ram_write_enable;
  wire   N9, N63, N95, N99, N159, N191, N250, N251, N252, N253, N254, N255,
         N256, N257, N258, N259, N260, N261, N262, N263, N264, N265, N266,
         N267, n2, n66, n130, n194, n258, n322, n391, n392, n394, n398, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752;

  TLATXLTS iir_put_req_reg ( .G(N266), .D(N265), .Q(iir_put_req) );
  TLATXLTS iir_get_req_reg ( .G(N266), .D(N267), .Q(iir_get_req) );
  TLATXLTS fft_put_req_reg ( .G(N260), .D(N259), .Q(fft_put_req) );
  TLATXLTS fft_get_req_reg ( .G(N260), .D(N261), .Q(fft_get_req) );
  TLATXLTS fir_put_req_reg ( .G(N263), .D(N262), .Q(fir_put_req) );
  TLATXLTS fir_get_req_reg ( .G(N263), .D(N264), .Q(fir_get_req) );
  TLATXLTS data_to_iir_reg ( .G(N258), .D(N256), .Q(data_to_iir), .QN(N191) );
  TLATXLTS data_to_fir_reg ( .G(N255), .D(N253), .Q(data_to_fir), .QN(N99) );
  TLATXLTS data_to_fft_reg ( .G(N250), .D(N251), .Q(data_to_fft), .QN(N63) );
  TLATXLTS data_from_iir_reg ( .G(N258), .D(N257), .Q(data_from_iir), .QN(N159) );
  TLATXLTS data_from_fir_reg ( .G(N255), .D(N254), .Q(data_from_fir), .QN(N95)
         );
  TLATXLTS data_from_fft_reg ( .G(N250), .D(N252), .Q(data_from_fft), .QN(N9)
         );
  TBUFX2TS \iir_data_out_tri[0]  ( .A(n642), .OE(n702), .Y(iir_data_out[0]) );
  TBUFX2TS \iir_data_out_tri[1]  ( .A(n649), .OE(n702), .Y(iir_data_out[1]) );
  TBUFX2TS \iir_data_out_tri[2]  ( .A(n665), .OE(n702), .Y(iir_data_out[2]) );
  TBUFX2TS \iir_data_out_tri[3]  ( .A(n681), .OE(n702), .Y(iir_data_out[3]) );
  TBUFX2TS \iir_data_out_tri[4]  ( .A(n638), .OE(n703), .Y(iir_data_out[4]) );
  TBUFX2TS \iir_data_out_tri[5]  ( .A(n651), .OE(n703), .Y(iir_data_out[5]) );
  TBUFX2TS \iir_data_out_tri[6]  ( .A(n667), .OE(n703), .Y(iir_data_out[6]) );
  TBUFX2TS \iir_data_out_tri[7]  ( .A(n683), .OE(n703), .Y(iir_data_out[7]) );
  TBUFX2TS \iir_data_out_tri[8]  ( .A(n634), .OE(n704), .Y(iir_data_out[8]) );
  TBUFX2TS \iir_data_out_tri[9]  ( .A(n653), .OE(n704), .Y(iir_data_out[9]) );
  TBUFX2TS \iir_data_out_tri[10]  ( .A(n669), .OE(n704), .Y(iir_data_out[10])
         );
  TBUFX2TS \iir_data_out_tri[11]  ( .A(n685), .OE(n704), .Y(iir_data_out[11])
         );
  TBUFX2TS \iir_data_out_tri[12]  ( .A(n630), .OE(n705), .Y(iir_data_out[12])
         );
  TBUFX2TS \iir_data_out_tri[13]  ( .A(n655), .OE(n705), .Y(iir_data_out[13])
         );
  TBUFX2TS \iir_data_out_tri[14]  ( .A(n671), .OE(n705), .Y(iir_data_out[14])
         );
  TBUFX2TS \iir_data_out_tri[15]  ( .A(n687), .OE(n705), .Y(iir_data_out[15])
         );
  TBUFX2TS \iir_data_out_tri[16]  ( .A(n632), .OE(n706), .Y(iir_data_out[16])
         );
  TBUFX2TS \iir_data_out_tri[17]  ( .A(n657), .OE(n706), .Y(iir_data_out[17])
         );
  TBUFX2TS \iir_data_out_tri[18]  ( .A(n673), .OE(n706), .Y(iir_data_out[18])
         );
  TBUFX2TS \iir_data_out_tri[19]  ( .A(n689), .OE(n706), .Y(iir_data_out[19])
         );
  TBUFX2TS \iir_data_out_tri[20]  ( .A(n636), .OE(n707), .Y(iir_data_out[20])
         );
  TBUFX2TS \iir_data_out_tri[21]  ( .A(n659), .OE(n707), .Y(iir_data_out[21])
         );
  TBUFX2TS \iir_data_out_tri[22]  ( .A(n675), .OE(n707), .Y(iir_data_out[22])
         );
  TBUFX2TS \iir_data_out_tri[23]  ( .A(n691), .OE(n707), .Y(iir_data_out[23])
         );
  TBUFX2TS \iir_data_out_tri[24]  ( .A(n640), .OE(n708), .Y(iir_data_out[24])
         );
  TBUFX2TS \iir_data_out_tri[25]  ( .A(n661), .OE(n708), .Y(iir_data_out[25])
         );
  TBUFX2TS \iir_data_out_tri[26]  ( .A(n677), .OE(n708), .Y(iir_data_out[26])
         );
  TBUFX2TS \iir_data_out_tri[27]  ( .A(n693), .OE(n708), .Y(iir_data_out[27])
         );
  TBUFX2TS \iir_data_out_tri[28]  ( .A(n644), .OE(n709), .Y(iir_data_out[28])
         );
  TBUFX2TS \iir_data_out_tri[29]  ( .A(n663), .OE(n709), .Y(iir_data_out[29])
         );
  TBUFX2TS \iir_data_out_tri[30]  ( .A(n679), .OE(n709), .Y(iir_data_out[30])
         );
  TBUFX2TS \iir_data_out_tri[31]  ( .A(n695), .OE(n709), .Y(iir_data_out[31])
         );
  TBUFX2TS \fir_data_out_tri[0]  ( .A(n642), .OE(n719), .Y(fir_data_out[0]) );
  TBUFX2TS \fir_data_out_tri[1]  ( .A(n649), .OE(n719), .Y(fir_data_out[1]) );
  TBUFX2TS \fir_data_out_tri[2]  ( .A(n665), .OE(n719), .Y(fir_data_out[2]) );
  TBUFX2TS \fir_data_out_tri[3]  ( .A(n681), .OE(n719), .Y(fir_data_out[3]) );
  TBUFX2TS \fir_data_out_tri[4]  ( .A(n638), .OE(n720), .Y(fir_data_out[4]) );
  TBUFX2TS \fir_data_out_tri[5]  ( .A(n651), .OE(n720), .Y(fir_data_out[5]) );
  TBUFX2TS \fir_data_out_tri[6]  ( .A(n667), .OE(n720), .Y(fir_data_out[6]) );
  TBUFX2TS \fir_data_out_tri[7]  ( .A(n683), .OE(n720), .Y(fir_data_out[7]) );
  TBUFX2TS \fir_data_out_tri[8]  ( .A(n634), .OE(n721), .Y(fir_data_out[8]) );
  TBUFX2TS \fir_data_out_tri[9]  ( .A(n653), .OE(n721), .Y(fir_data_out[9]) );
  TBUFX2TS \fir_data_out_tri[10]  ( .A(n669), .OE(n721), .Y(fir_data_out[10])
         );
  TBUFX2TS \fir_data_out_tri[11]  ( .A(n685), .OE(n721), .Y(fir_data_out[11])
         );
  TBUFX2TS \fir_data_out_tri[12]  ( .A(n630), .OE(n722), .Y(fir_data_out[12])
         );
  TBUFX2TS \fir_data_out_tri[13]  ( .A(n655), .OE(n722), .Y(fir_data_out[13])
         );
  TBUFX2TS \fir_data_out_tri[14]  ( .A(n671), .OE(n722), .Y(fir_data_out[14])
         );
  TBUFX2TS \fir_data_out_tri[15]  ( .A(n687), .OE(n722), .Y(fir_data_out[15])
         );
  TBUFX2TS \fir_data_out_tri[16]  ( .A(n632), .OE(n723), .Y(fir_data_out[16])
         );
  TBUFX2TS \fir_data_out_tri[17]  ( .A(n657), .OE(n723), .Y(fir_data_out[17])
         );
  TBUFX2TS \fir_data_out_tri[18]  ( .A(n673), .OE(n723), .Y(fir_data_out[18])
         );
  TBUFX2TS \fir_data_out_tri[19]  ( .A(n689), .OE(n723), .Y(fir_data_out[19])
         );
  TBUFX2TS \fir_data_out_tri[20]  ( .A(n636), .OE(n724), .Y(fir_data_out[20])
         );
  TBUFX2TS \fir_data_out_tri[21]  ( .A(n659), .OE(n724), .Y(fir_data_out[21])
         );
  TBUFX2TS \fir_data_out_tri[22]  ( .A(n675), .OE(n724), .Y(fir_data_out[22])
         );
  TBUFX2TS \fir_data_out_tri[23]  ( .A(n691), .OE(n724), .Y(fir_data_out[23])
         );
  TBUFX2TS \fir_data_out_tri[24]  ( .A(n640), .OE(n725), .Y(fir_data_out[24])
         );
  TBUFX2TS \fir_data_out_tri[25]  ( .A(n661), .OE(n725), .Y(fir_data_out[25])
         );
  TBUFX2TS \fir_data_out_tri[26]  ( .A(n677), .OE(n725), .Y(fir_data_out[26])
         );
  TBUFX2TS \fir_data_out_tri[27]  ( .A(n693), .OE(n725), .Y(fir_data_out[27])
         );
  TBUFX2TS \fir_data_out_tri[28]  ( .A(n644), .OE(n726), .Y(fir_data_out[28])
         );
  TBUFX2TS \fir_data_out_tri[29]  ( .A(n663), .OE(n726), .Y(fir_data_out[29])
         );
  TBUFX2TS \fir_data_out_tri[30]  ( .A(n679), .OE(n726), .Y(fir_data_out[30])
         );
  TBUFX2TS \fir_data_out_tri[31]  ( .A(n695), .OE(n726), .Y(fir_data_out[31])
         );
  TBUFX2TS \fft_data_out_tri[0]  ( .A(n642), .OE(n736), .Y(fft_data_out[0]) );
  TBUFX2TS \fft_data_out_tri[1]  ( .A(n649), .OE(n736), .Y(fft_data_out[1]) );
  TBUFX2TS \fft_data_out_tri[2]  ( .A(n665), .OE(n736), .Y(fft_data_out[2]) );
  TBUFX2TS \fft_data_out_tri[3]  ( .A(n681), .OE(n736), .Y(fft_data_out[3]) );
  TBUFX2TS \fft_data_out_tri[4]  ( .A(n638), .OE(n737), .Y(fft_data_out[4]) );
  TBUFX2TS \fft_data_out_tri[5]  ( .A(n651), .OE(n737), .Y(fft_data_out[5]) );
  TBUFX2TS \fft_data_out_tri[6]  ( .A(n667), .OE(n737), .Y(fft_data_out[6]) );
  TBUFX2TS \fft_data_out_tri[7]  ( .A(n683), .OE(n737), .Y(fft_data_out[7]) );
  TBUFX2TS \fft_data_out_tri[8]  ( .A(n634), .OE(n738), .Y(fft_data_out[8]) );
  TBUFX2TS \fft_data_out_tri[9]  ( .A(n653), .OE(n738), .Y(fft_data_out[9]) );
  TBUFX2TS \fft_data_out_tri[10]  ( .A(n669), .OE(n738), .Y(fft_data_out[10])
         );
  TBUFX2TS \fft_data_out_tri[11]  ( .A(n685), .OE(n738), .Y(fft_data_out[11])
         );
  TBUFX2TS \fft_data_out_tri[12]  ( .A(n630), .OE(n739), .Y(fft_data_out[12])
         );
  TBUFX2TS \fft_data_out_tri[13]  ( .A(n655), .OE(n739), .Y(fft_data_out[13])
         );
  TBUFX2TS \fft_data_out_tri[14]  ( .A(n671), .OE(n739), .Y(fft_data_out[14])
         );
  TBUFX2TS \fft_data_out_tri[15]  ( .A(n687), .OE(n739), .Y(fft_data_out[15])
         );
  TBUFX2TS \fft_data_out_tri[16]  ( .A(n632), .OE(n740), .Y(fft_data_out[16])
         );
  TBUFX2TS \fft_data_out_tri[17]  ( .A(n657), .OE(n740), .Y(fft_data_out[17])
         );
  TBUFX2TS \fft_data_out_tri[18]  ( .A(n673), .OE(n740), .Y(fft_data_out[18])
         );
  TBUFX2TS \fft_data_out_tri[19]  ( .A(n689), .OE(n740), .Y(fft_data_out[19])
         );
  TBUFX2TS \fft_data_out_tri[20]  ( .A(n636), .OE(n741), .Y(fft_data_out[20])
         );
  TBUFX2TS \fft_data_out_tri[21]  ( .A(n659), .OE(n741), .Y(fft_data_out[21])
         );
  TBUFX2TS \fft_data_out_tri[22]  ( .A(n675), .OE(n741), .Y(fft_data_out[22])
         );
  TBUFX2TS \fft_data_out_tri[23]  ( .A(n691), .OE(n741), .Y(fft_data_out[23])
         );
  TBUFX2TS \fft_data_out_tri[24]  ( .A(n640), .OE(n742), .Y(fft_data_out[24])
         );
  TBUFX2TS \fft_data_out_tri[25]  ( .A(n661), .OE(n742), .Y(fft_data_out[25])
         );
  TBUFX2TS \fft_data_out_tri[26]  ( .A(n677), .OE(n742), .Y(fft_data_out[26])
         );
  TBUFX2TS \fft_data_out_tri[27]  ( .A(n693), .OE(n742), .Y(fft_data_out[27])
         );
  TBUFX2TS \fft_data_out_tri[28]  ( .A(n644), .OE(n743), .Y(fft_data_out[28])
         );
  TBUFX2TS \fft_data_out_tri[29]  ( .A(n663), .OE(n743), .Y(fft_data_out[29])
         );
  TBUFX2TS \fft_data_out_tri[30]  ( .A(n679), .OE(n743), .Y(fft_data_out[30])
         );
  TBUFX2TS \fft_data_out_tri[31]  ( .A(n695), .OE(n743), .Y(fft_data_out[31])
         );
  TBUFX2TS \data_bus_tri3[0]  ( .A(n600), .OE(n711), .Y(data_bus[0]) );
  TBUFX2TS \data_bus_tri3[1]  ( .A(n596), .OE(n711), .Y(data_bus[1]) );
  TBUFX2TS \data_bus_tri3[2]  ( .A(n592), .OE(n711), .Y(data_bus[2]) );
  TBUFX2TS \data_bus_tri3[3]  ( .A(n588), .OE(n711), .Y(data_bus[3]) );
  TBUFX2TS \data_bus_tri3[4]  ( .A(n584), .OE(n712), .Y(data_bus[4]) );
  TBUFX2TS \data_bus_tri3[5]  ( .A(n580), .OE(n712), .Y(data_bus[5]) );
  TBUFX2TS \data_bus_tri3[6]  ( .A(n576), .OE(n712), .Y(data_bus[6]) );
  TBUFX2TS \data_bus_tri3[7]  ( .A(n572), .OE(n712), .Y(data_bus[7]) );
  TBUFX2TS \data_bus_tri3[8]  ( .A(n568), .OE(n713), .Y(data_bus[8]) );
  TBUFX2TS \data_bus_tri3[9]  ( .A(n564), .OE(n713), .Y(data_bus[9]) );
  TBUFX2TS \data_bus_tri3[10]  ( .A(n560), .OE(n713), .Y(data_bus[10]) );
  TBUFX2TS \data_bus_tri3[11]  ( .A(n556), .OE(n713), .Y(data_bus[11]) );
  TBUFX2TS \data_bus_tri3[12]  ( .A(n552), .OE(n714), .Y(data_bus[12]) );
  TBUFX2TS \data_bus_tri3[13]  ( .A(n548), .OE(n714), .Y(data_bus[13]) );
  TBUFX2TS \data_bus_tri3[14]  ( .A(n544), .OE(n714), .Y(data_bus[14]) );
  TBUFX2TS \data_bus_tri3[15]  ( .A(n540), .OE(n714), .Y(data_bus[15]) );
  TBUFX2TS \data_bus_tri3[16]  ( .A(n536), .OE(n715), .Y(data_bus[16]) );
  TBUFX2TS \data_bus_tri3[17]  ( .A(n532), .OE(n715), .Y(data_bus[17]) );
  TBUFX2TS \data_bus_tri3[18]  ( .A(n528), .OE(n715), .Y(data_bus[18]) );
  TBUFX2TS \data_bus_tri3[19]  ( .A(n524), .OE(n715), .Y(data_bus[19]) );
  TBUFX2TS \data_bus_tri3[20]  ( .A(n520), .OE(n716), .Y(data_bus[20]) );
  TBUFX2TS \data_bus_tri3[21]  ( .A(n516), .OE(n716), .Y(data_bus[21]) );
  TBUFX2TS \data_bus_tri3[22]  ( .A(n512), .OE(n716), .Y(data_bus[22]) );
  TBUFX2TS \data_bus_tri3[23]  ( .A(n508), .OE(n716), .Y(data_bus[23]) );
  TBUFX2TS \data_bus_tri3[24]  ( .A(n504), .OE(n717), .Y(data_bus[24]) );
  TBUFX2TS \data_bus_tri3[25]  ( .A(n500), .OE(n717), .Y(data_bus[25]) );
  TBUFX2TS \data_bus_tri3[26]  ( .A(n496), .OE(n717), .Y(data_bus[26]) );
  TBUFX2TS \data_bus_tri3[27]  ( .A(n492), .OE(n717), .Y(data_bus[27]) );
  TBUFX2TS \data_bus_tri3[28]  ( .A(n488), .OE(n718), .Y(data_bus[28]) );
  TBUFX2TS \data_bus_tri3[29]  ( .A(n484), .OE(n718), .Y(data_bus[29]) );
  TBUFX2TS \data_bus_tri3[30]  ( .A(n480), .OE(n718), .Y(data_bus[30]) );
  TBUFX2TS \data_bus_tri3[31]  ( .A(n476), .OE(n718), .Y(data_bus[31]) );
  TBUFX2TS \data_bus_tri2[0]  ( .A(n472), .OE(n728), .Y(data_bus[0]) );
  TBUFX2TS \data_bus_tri2[1]  ( .A(n468), .OE(n728), .Y(data_bus[1]) );
  TBUFX2TS \data_bus_tri2[2]  ( .A(n464), .OE(n728), .Y(data_bus[2]) );
  TBUFX2TS \data_bus_tri2[3]  ( .A(n460), .OE(n728), .Y(data_bus[3]) );
  TBUFX2TS \data_bus_tri2[4]  ( .A(n456), .OE(n729), .Y(data_bus[4]) );
  TBUFX2TS \data_bus_tri2[5]  ( .A(n452), .OE(n729), .Y(data_bus[5]) );
  TBUFX2TS \data_bus_tri2[6]  ( .A(n448), .OE(n729), .Y(data_bus[6]) );
  TBUFX2TS \data_bus_tri2[7]  ( .A(n444), .OE(n729), .Y(data_bus[7]) );
  TBUFX2TS \data_bus_tri2[8]  ( .A(n440), .OE(n730), .Y(data_bus[8]) );
  TBUFX2TS \data_bus_tri2[9]  ( .A(n436), .OE(n730), .Y(data_bus[9]) );
  TBUFX2TS \data_bus_tri2[10]  ( .A(n432), .OE(n730), .Y(data_bus[10]) );
  TBUFX2TS \data_bus_tri2[11]  ( .A(n428), .OE(n730), .Y(data_bus[11]) );
  TBUFX2TS \data_bus_tri2[12]  ( .A(n424), .OE(n731), .Y(data_bus[12]) );
  TBUFX2TS \data_bus_tri2[13]  ( .A(n420), .OE(n731), .Y(data_bus[13]) );
  TBUFX2TS \data_bus_tri2[14]  ( .A(n416), .OE(n731), .Y(data_bus[14]) );
  TBUFX2TS \data_bus_tri2[15]  ( .A(n412), .OE(n731), .Y(data_bus[15]) );
  TBUFX2TS \data_bus_tri2[16]  ( .A(n410), .OE(n732), .Y(data_bus[16]) );
  TBUFX2TS \data_bus_tri2[17]  ( .A(n414), .OE(n732), .Y(data_bus[17]) );
  TBUFX2TS \data_bus_tri2[18]  ( .A(n418), .OE(n732), .Y(data_bus[18]) );
  TBUFX2TS \data_bus_tri2[19]  ( .A(n422), .OE(n732), .Y(data_bus[19]) );
  TBUFX2TS \data_bus_tri2[20]  ( .A(n426), .OE(n733), .Y(data_bus[20]) );
  TBUFX2TS \data_bus_tri2[21]  ( .A(n430), .OE(n733), .Y(data_bus[21]) );
  TBUFX2TS \data_bus_tri2[22]  ( .A(n434), .OE(n733), .Y(data_bus[22]) );
  TBUFX2TS \data_bus_tri2[23]  ( .A(n438), .OE(n733), .Y(data_bus[23]) );
  TBUFX2TS \data_bus_tri2[24]  ( .A(n442), .OE(n734), .Y(data_bus[24]) );
  TBUFX2TS \data_bus_tri2[25]  ( .A(n446), .OE(n734), .Y(data_bus[25]) );
  TBUFX2TS \data_bus_tri2[26]  ( .A(n450), .OE(n734), .Y(data_bus[26]) );
  TBUFX2TS \data_bus_tri2[27]  ( .A(n454), .OE(n734), .Y(data_bus[27]) );
  TBUFX2TS \data_bus_tri2[28]  ( .A(n458), .OE(n735), .Y(data_bus[28]) );
  TBUFX2TS \data_bus_tri2[29]  ( .A(n462), .OE(n735), .Y(data_bus[29]) );
  TBUFX2TS \data_bus_tri2[30]  ( .A(n466), .OE(n735), .Y(data_bus[30]) );
  TBUFX2TS \data_bus_tri2[31]  ( .A(n470), .OE(n735), .Y(data_bus[31]) );
  TBUFX2TS \data_bus_tri[0]  ( .A(n474), .OE(n745), .Y(data_bus[0]) );
  TBUFX2TS \data_bus_tri[1]  ( .A(n478), .OE(n745), .Y(data_bus[1]) );
  TBUFX2TS \data_bus_tri[2]  ( .A(n482), .OE(n745), .Y(data_bus[2]) );
  TBUFX2TS \data_bus_tri[3]  ( .A(n486), .OE(n745), .Y(data_bus[3]) );
  TBUFX2TS \data_bus_tri[4]  ( .A(n490), .OE(n746), .Y(data_bus[4]) );
  TBUFX2TS \data_bus_tri[5]  ( .A(n494), .OE(n746), .Y(data_bus[5]) );
  TBUFX2TS \data_bus_tri[6]  ( .A(n498), .OE(n746), .Y(data_bus[6]) );
  TBUFX2TS \data_bus_tri[7]  ( .A(n502), .OE(n746), .Y(data_bus[7]) );
  TBUFX2TS \data_bus_tri[8]  ( .A(n506), .OE(n747), .Y(data_bus[8]) );
  TBUFX2TS \data_bus_tri[9]  ( .A(n510), .OE(n747), .Y(data_bus[9]) );
  TBUFX2TS \data_bus_tri[10]  ( .A(n514), .OE(n747), .Y(data_bus[10]) );
  TBUFX2TS \data_bus_tri[11]  ( .A(n518), .OE(n747), .Y(data_bus[11]) );
  TBUFX2TS \data_bus_tri[12]  ( .A(n522), .OE(n748), .Y(data_bus[12]) );
  TBUFX2TS \data_bus_tri[13]  ( .A(n526), .OE(n748), .Y(data_bus[13]) );
  TBUFX2TS \data_bus_tri[14]  ( .A(n530), .OE(n748), .Y(data_bus[14]) );
  TBUFX2TS \data_bus_tri[15]  ( .A(n534), .OE(n748), .Y(data_bus[15]) );
  TBUFX2TS \data_bus_tri[16]  ( .A(n538), .OE(n749), .Y(data_bus[16]) );
  TBUFX2TS \data_bus_tri[17]  ( .A(n542), .OE(n749), .Y(data_bus[17]) );
  TBUFX2TS \data_bus_tri[18]  ( .A(n546), .OE(n749), .Y(data_bus[18]) );
  TBUFX2TS \data_bus_tri[19]  ( .A(n550), .OE(n749), .Y(data_bus[19]) );
  TBUFX2TS \data_bus_tri[20]  ( .A(n554), .OE(n750), .Y(data_bus[20]) );
  TBUFX2TS \data_bus_tri[21]  ( .A(n558), .OE(n750), .Y(data_bus[21]) );
  TBUFX2TS \data_bus_tri[22]  ( .A(n562), .OE(n750), .Y(data_bus[22]) );
  TBUFX2TS \data_bus_tri[23]  ( .A(n566), .OE(n750), .Y(data_bus[23]) );
  TBUFX2TS \data_bus_tri[24]  ( .A(n570), .OE(n751), .Y(data_bus[24]) );
  TBUFX2TS \data_bus_tri[25]  ( .A(n574), .OE(n751), .Y(data_bus[25]) );
  TBUFX2TS \data_bus_tri[26]  ( .A(n578), .OE(n751), .Y(data_bus[26]) );
  TBUFX2TS \data_bus_tri[27]  ( .A(n582), .OE(n751), .Y(data_bus[27]) );
  TBUFX2TS \data_bus_tri[28]  ( .A(n586), .OE(n752), .Y(data_bus[28]) );
  TBUFX2TS \data_bus_tri[29]  ( .A(n590), .OE(n752), .Y(data_bus[29]) );
  TBUFX2TS \data_bus_tri[30]  ( .A(n594), .OE(n752), .Y(data_bus[30]) );
  TBUFX2TS \data_bus_tri[31]  ( .A(n598), .OE(n752), .Y(data_bus[31]) );
  NOR3X1TS U38 ( .A(n620), .B(n606), .C(n402), .Y(N251) );
  AOI22XLTS U28 ( .A0(n622), .A1(n602), .B0(n614), .B1(n610), .Y(n398) );
  AOI22XLTS U19 ( .A0(n624), .A1(n604), .B0(n616), .B1(n608), .Y(n394) );
  OAI21XLTS U39 ( .A0(n618), .A1(n626), .B0(n646), .Y(n402) );
  AOI33XLTS U40 ( .A0(n620), .A1(n626), .A2(n646), .B0(n647), .B1(n618), .B2(
        n606), .Y(N250) );
  AOI21XLTS U20 ( .A0(n612), .A1(n627), .B0(n647), .Y(N263) );
  OR3XLTS U27 ( .A(n646), .B(N266), .C(n398), .Y(N255) );
  OR3XLTS U18 ( .A(n647), .B(N263), .C(n394), .Y(N258) );
  OAI21XLTS U16 ( .A0(n628), .A1(n612), .B0(n408), .Y(N260) );
  NOR2X1TS U17 ( .A(n408), .B(N63), .Y(N259) );
  NOR3X1TS U11 ( .A(data_to_iir), .B(n391), .C(N159), .Y(N267) );
  NOR2X1TS U12 ( .A(n391), .B(N191), .Y(N265) );
  NOR3X1TS U15 ( .A(data_to_fft), .B(n408), .C(N9), .Y(N261) );
  NOR3X1TS U13 ( .A(data_to_fir), .B(n392), .C(N95), .Y(N264) );
  NOR2X1TS U14 ( .A(n392), .B(N99), .Y(N262) );
  NAND2X1TS U41 ( .A(n628), .B(n408), .Y(n392) );
  NAND2X1TS U42 ( .A(n612), .B(N266), .Y(n391) );
  OR3X1TS U43 ( .A(N267), .B(N261), .C(N264), .Y(ram_write_enable) );
  OR3X1TS U44 ( .A(N265), .B(N259), .C(N262), .Y(ram_read_enable) );
  NOR2X1TS U45 ( .A(n628), .B(n647), .Y(N266) );
  NAND2BX1TS U46 ( .AN(n602), .B(n610), .Y(n403) );
  AOI211X1TS U47 ( .A0(n622), .A1(n403), .B0(n392), .C0(n614), .Y(N254) );
  NAND2BX1TS U48 ( .AN(n604), .B(n608), .Y(n404) );
  AOI211X1TS U49 ( .A0(n624), .A1(n404), .B0(n391), .C0(n616), .Y(N257) );
  NAND2BX1TS U50 ( .AN(n606), .B(n620), .Y(n405) );
  AOI211X1TS U51 ( .A0(n618), .A1(n405), .B0(n645), .C0(n626), .Y(N252) );
  NOR2X1TS U52 ( .A(n622), .B(n614), .Y(n406) );
  NOR4XLTS U53 ( .A(n392), .B(n610), .C(n602), .D(n406), .Y(N253) );
  NOR2X1TS U54 ( .A(n624), .B(n616), .Y(n407) );
  NOR4XLTS U55 ( .A(n391), .B(n608), .C(n604), .D(n407), .Y(N256) );
  INVX2TS U56 ( .A(n646), .Y(n408) );
  CLKINVX2TS U57 ( .A(n639), .Y(n640) );
  CLKINVX2TS U58 ( .A(n611), .Y(n612) );
  CLKINVX2TS U59 ( .A(n694), .Y(n695) );
  CLKINVX2TS U60 ( .A(n690), .Y(n691) );
  INVX2TS U61 ( .A(n627), .Y(n628) );
  INVX1TS U62 ( .A(n537), .Y(n538) );
  INVX2TS U63 ( .A(n601), .Y(n602) );
  CLKINVX2TS U64 ( .A(n662), .Y(n663) );
  INVX1TS U65 ( .A(n475), .Y(n476) );
  INVX1TS U66 ( .A(n409), .Y(n410) );
  INVX1TS U67 ( .A(n415), .Y(n416) );
  CLKINVX2TS U68 ( .A(n678), .Y(n679) );
  CLKINVX1TS U69 ( .A(n645), .Y(n647) );
  CLKINVX2TS U70 ( .A(n670), .Y(n671) );
  CLKINVX2TS U71 ( .A(n629), .Y(n630) );
  CLKINVX2TS U72 ( .A(n631), .Y(n632) );
  INVX1TS U73 ( .A(n533), .Y(n534) );
  CLKINVX2TS U74 ( .A(n674), .Y(n675) );
  INVX1TS U75 ( .A(n523), .Y(n524) );
  CLKINVX2TS U76 ( .A(n660), .Y(n661) );
  INVX1TS U77 ( .A(n553), .Y(n554) );
  CLKINVX2TS U78 ( .A(n656), .Y(n657) );
  INVX1TS U79 ( .A(n535), .Y(n536) );
  CLKINVX1TS U80 ( .A(n607), .Y(n608) );
  INVX1TS U81 ( .A(n529), .Y(n530) );
  CLKINVX2TS U82 ( .A(n654), .Y(n655) );
  CLKINVX2TS U83 ( .A(n643), .Y(n644) );
  INVX1TS U84 ( .A(n545), .Y(n546) );
  CLKINVX2TS U85 ( .A(n658), .Y(n659) );
  INVX1TS U86 ( .A(n417), .Y(n418) );
  CLKINVX1TS U87 ( .A(n613), .Y(n614) );
  INVX1TS U88 ( .A(n549), .Y(n550) );
  INVX1TS U89 ( .A(n543), .Y(n544) );
  CLKINVX1TS U90 ( .A(n621), .Y(n622) );
  INVX1TS U91 ( .A(n519), .Y(n520) );
  CLKINVX1TS U92 ( .A(n609), .Y(n610) );
  CLKINVX2TS U93 ( .A(n672), .Y(n673) );
  CLKINVX1TS U94 ( .A(n615), .Y(n616) );
  INVX1TS U95 ( .A(n581), .Y(n582) );
  INVX1TS U96 ( .A(n471), .Y(n472) );
  INVX1TS U97 ( .A(n547), .Y(n548) );
  INVX1TS U98 ( .A(n541), .Y(n542) );
  INVX2TS U99 ( .A(n645), .Y(n646) );
  CLKINVX2TS U100 ( .A(n635), .Y(n636) );
  CLKINVX2TS U101 ( .A(n684), .Y(n685) );
  INVX1TS U102 ( .A(n557), .Y(n558) );
  INVX1TS U103 ( .A(n411), .Y(n412) );
  INVX2TS U104 ( .A(n603), .Y(n604) );
  INVX1TS U105 ( .A(n599), .Y(n600) );
  INVX1TS U106 ( .A(n419), .Y(n420) );
  INVX1TS U107 ( .A(n421), .Y(n422) );
  INVX1TS U108 ( .A(n531), .Y(n532) );
  CLKINVX2TS U109 ( .A(n686), .Y(n687) );
  INVX1TS U110 ( .A(n425), .Y(n426) );
  CLKINVX2TS U111 ( .A(n692), .Y(n693) );
  INVX1TS U112 ( .A(n539), .Y(n540) );
  CLKINVX1TS U113 ( .A(n623), .Y(n624) );
  CLKINVX2TS U114 ( .A(n676), .Y(n677) );
  INVX1TS U115 ( .A(n473), .Y(n474) );
  INVX1TS U116 ( .A(n429), .Y(n430) );
  INVX1TS U117 ( .A(n413), .Y(n414) );
  INVX1TS U118 ( .A(n477), .Y(n478) );
  INVX1TS U119 ( .A(n527), .Y(n528) );
  CLKINVX2TS U120 ( .A(n688), .Y(n689) );
  INVX1TS U121 ( .A(n571), .Y(n572) );
  INVX1TS U122 ( .A(n505), .Y(n506) );
  INVX1TS U123 ( .A(n443), .Y(n444) );
  CLKINVX2TS U124 ( .A(n637), .Y(n638) );
  INVX1TS U125 ( .A(n495), .Y(n496) );
  INVX1TS U126 ( .A(n453), .Y(n454) );
  INVX1TS U127 ( .A(n501), .Y(n502) );
  INVX1TS U128 ( .A(n439), .Y(n440) );
  INVX1TS U129 ( .A(n449), .Y(n450) );
  INVX1TS U130 ( .A(n491), .Y(n492) );
  CLKINVX2TS U131 ( .A(n680), .Y(n681) );
  INVX1TS U132 ( .A(n575), .Y(n576) );
  INVX1TS U133 ( .A(n567), .Y(n568) );
  INVX1TS U134 ( .A(n577), .Y(n578) );
  INVX1TS U135 ( .A(n447), .Y(n448) );
  CLKINVX2TS U136 ( .A(n650), .Y(n651) );
  INVX1TS U137 ( .A(n585), .Y(n586) );
  INVX1TS U138 ( .A(n497), .Y(n498) );
  INVX1TS U139 ( .A(n499), .Y(n500) );
  INVX1TS U140 ( .A(n457), .Y(n458) );
  INVX1TS U141 ( .A(n487), .Y(n488) );
  INVX1TS U142 ( .A(n435), .Y(n436) );
  INVX1TS U143 ( .A(n445), .Y(n446) );
  INVX1TS U144 ( .A(n579), .Y(n580) );
  INVX1TS U145 ( .A(n573), .Y(n574) );
  INVX1TS U146 ( .A(n589), .Y(n590) );
  INVX1TS U147 ( .A(n563), .Y(n564) );
  INVX1TS U148 ( .A(n451), .Y(n452) );
  CLKINVX2TS U149 ( .A(n664), .Y(n665) );
  INVX1TS U150 ( .A(n503), .Y(n504) );
  INVX1TS U151 ( .A(n461), .Y(n462) );
  INVX1TS U152 ( .A(n493), .Y(n494) );
  CLKINVX2TS U153 ( .A(n666), .Y(n667) );
  INVX1TS U154 ( .A(n513), .Y(n514) );
  INVX1TS U155 ( .A(n441), .Y(n442) );
  INVX1TS U156 ( .A(n483), .Y(n484) );
  INVX1TS U157 ( .A(n583), .Y(n584) );
  INVX1TS U158 ( .A(n431), .Y(n432) );
  INVX1TS U159 ( .A(n593), .Y(n594) );
  INVX1TS U160 ( .A(n569), .Y(n570) );
  INVX1TS U161 ( .A(n455), .Y(n456) );
  INVX1TS U162 ( .A(n559), .Y(n560) );
  INVX1TS U163 ( .A(n465), .Y(n466) );
  INVX1TS U164 ( .A(n489), .Y(n490) );
  INVX1TS U165 ( .A(n507), .Y(n508) );
  CLKINVX2TS U166 ( .A(n648), .Y(n649) );
  INVX1TS U167 ( .A(n479), .Y(n480) );
  INVX1TS U168 ( .A(n587), .Y(n588) );
  INVX1TS U169 ( .A(n517), .Y(n518) );
  CLKINVX2TS U170 ( .A(n682), .Y(n683) );
  INVX1TS U171 ( .A(n481), .Y(n482) );
  INVX1TS U172 ( .A(n509), .Y(n510) );
  INVX1TS U173 ( .A(n515), .Y(n516) );
  INVX1TS U174 ( .A(n437), .Y(n438) );
  INVX1TS U175 ( .A(n467), .Y(n468) );
  INVX1TS U176 ( .A(n433), .Y(n434) );
  CLKINVX1TS U177 ( .A(n625), .Y(n626) );
  INVX1TS U178 ( .A(n597), .Y(n598) );
  INVX1TS U179 ( .A(n555), .Y(n556) );
  INVX1TS U180 ( .A(n459), .Y(n460) );
  INVX2TS U181 ( .A(n605), .Y(n606) );
  INVX1TS U182 ( .A(n427), .Y(n428) );
  INVX1TS U183 ( .A(n565), .Y(n566) );
  INVX1TS U184 ( .A(n469), .Y(n470) );
  INVX1TS U185 ( .A(n485), .Y(n486) );
  CLKINVX2TS U186 ( .A(n633), .Y(n634) );
  INVX2TS U187 ( .A(n617), .Y(n618) );
  INVX1TS U188 ( .A(n591), .Y(n592) );
  INVX1TS U189 ( .A(n551), .Y(n552) );
  INVX1TS U190 ( .A(n423), .Y(n424) );
  INVX1TS U191 ( .A(n525), .Y(n526) );
  CLKINVX2TS U192 ( .A(n652), .Y(n653) );
  CLKINVX2TS U193 ( .A(n641), .Y(n642) );
  INVX1TS U194 ( .A(n521), .Y(n522) );
  CLKINVX1TS U195 ( .A(n619), .Y(n620) );
  INVX1TS U196 ( .A(n511), .Y(n512) );
  INVX1TS U197 ( .A(n561), .Y(n562) );
  INVX1TS U198 ( .A(n595), .Y(n596) );
  INVX1TS U199 ( .A(n463), .Y(n464) );
  CLKINVX2TS U200 ( .A(n668), .Y(n669) );
  INVXLTS U201 ( .A(fir_data_in[16]), .Y(n409) );
  INVXLTS U202 ( .A(fir_data_in[15]), .Y(n411) );
  INVXLTS U203 ( .A(fir_data_in[17]), .Y(n413) );
  INVXLTS U204 ( .A(fir_data_in[14]), .Y(n415) );
  INVXLTS U205 ( .A(fir_data_in[18]), .Y(n417) );
  INVXLTS U206 ( .A(fir_data_in[13]), .Y(n419) );
  INVXLTS U207 ( .A(fir_data_in[19]), .Y(n421) );
  INVXLTS U208 ( .A(fir_data_in[12]), .Y(n423) );
  INVXLTS U209 ( .A(fir_data_in[20]), .Y(n425) );
  INVXLTS U210 ( .A(fir_data_in[11]), .Y(n427) );
  INVXLTS U211 ( .A(fir_data_in[21]), .Y(n429) );
  INVXLTS U212 ( .A(fir_data_in[10]), .Y(n431) );
  INVXLTS U213 ( .A(fir_data_in[22]), .Y(n433) );
  INVXLTS U214 ( .A(fir_data_in[9]), .Y(n435) );
  INVXLTS U215 ( .A(fir_data_in[23]), .Y(n437) );
  INVXLTS U216 ( .A(fir_data_in[8]), .Y(n439) );
  INVXLTS U217 ( .A(fir_data_in[24]), .Y(n441) );
  INVXLTS U218 ( .A(fir_data_in[7]), .Y(n443) );
  INVXLTS U219 ( .A(fir_data_in[25]), .Y(n445) );
  INVXLTS U220 ( .A(fir_data_in[6]), .Y(n447) );
  INVXLTS U221 ( .A(fir_data_in[26]), .Y(n449) );
  INVXLTS U222 ( .A(fir_data_in[5]), .Y(n451) );
  INVXLTS U223 ( .A(fir_data_in[27]), .Y(n453) );
  INVXLTS U224 ( .A(fir_data_in[4]), .Y(n455) );
  INVXLTS U225 ( .A(fir_data_in[28]), .Y(n457) );
  INVXLTS U226 ( .A(fir_data_in[3]), .Y(n459) );
  INVXLTS U227 ( .A(fir_data_in[29]), .Y(n461) );
  INVXLTS U228 ( .A(fir_data_in[2]), .Y(n463) );
  INVXLTS U229 ( .A(fir_data_in[30]), .Y(n465) );
  INVXLTS U230 ( .A(fir_data_in[1]), .Y(n467) );
  INVXLTS U231 ( .A(fir_data_in[31]), .Y(n469) );
  INVXLTS U232 ( .A(fir_data_in[0]), .Y(n471) );
  INVXLTS U233 ( .A(fft_data_in[0]), .Y(n473) );
  INVXLTS U234 ( .A(iir_data_in[31]), .Y(n475) );
  INVXLTS U235 ( .A(fft_data_in[1]), .Y(n477) );
  INVXLTS U236 ( .A(iir_data_in[30]), .Y(n479) );
  INVXLTS U237 ( .A(fft_data_in[2]), .Y(n481) );
  INVXLTS U238 ( .A(iir_data_in[29]), .Y(n483) );
  INVXLTS U239 ( .A(fft_data_in[3]), .Y(n485) );
  INVXLTS U240 ( .A(iir_data_in[28]), .Y(n487) );
  INVXLTS U241 ( .A(fft_data_in[4]), .Y(n489) );
  INVXLTS U242 ( .A(iir_data_in[27]), .Y(n491) );
  INVXLTS U243 ( .A(fft_data_in[5]), .Y(n493) );
  INVXLTS U244 ( .A(iir_data_in[26]), .Y(n495) );
  INVXLTS U245 ( .A(fft_data_in[6]), .Y(n497) );
  INVXLTS U246 ( .A(iir_data_in[25]), .Y(n499) );
  INVXLTS U247 ( .A(fft_data_in[7]), .Y(n501) );
  INVXLTS U248 ( .A(iir_data_in[24]), .Y(n503) );
  INVXLTS U249 ( .A(fft_data_in[8]), .Y(n505) );
  INVXLTS U250 ( .A(iir_data_in[23]), .Y(n507) );
  INVXLTS U251 ( .A(fft_data_in[9]), .Y(n509) );
  INVXLTS U252 ( .A(iir_data_in[22]), .Y(n511) );
  INVXLTS U253 ( .A(fft_data_in[10]), .Y(n513) );
  INVXLTS U254 ( .A(iir_data_in[21]), .Y(n515) );
  INVXLTS U255 ( .A(fft_data_in[11]), .Y(n517) );
  INVXLTS U256 ( .A(iir_data_in[20]), .Y(n519) );
  INVXLTS U257 ( .A(fft_data_in[12]), .Y(n521) );
  INVXLTS U258 ( .A(iir_data_in[19]), .Y(n523) );
  INVXLTS U259 ( .A(fft_data_in[13]), .Y(n525) );
  INVXLTS U260 ( .A(iir_data_in[18]), .Y(n527) );
  INVXLTS U261 ( .A(fft_data_in[14]), .Y(n529) );
  INVXLTS U262 ( .A(iir_data_in[17]), .Y(n531) );
  INVXLTS U263 ( .A(fft_data_in[15]), .Y(n533) );
  INVXLTS U264 ( .A(iir_data_in[16]), .Y(n535) );
  INVXLTS U265 ( .A(fft_data_in[16]), .Y(n537) );
  INVXLTS U266 ( .A(iir_data_in[15]), .Y(n539) );
  INVXLTS U267 ( .A(fft_data_in[17]), .Y(n541) );
  INVXLTS U268 ( .A(iir_data_in[14]), .Y(n543) );
  INVXLTS U269 ( .A(fft_data_in[18]), .Y(n545) );
  INVXLTS U270 ( .A(iir_data_in[13]), .Y(n547) );
  INVXLTS U271 ( .A(fft_data_in[19]), .Y(n549) );
  INVXLTS U272 ( .A(iir_data_in[12]), .Y(n551) );
  INVXLTS U273 ( .A(fft_data_in[20]), .Y(n553) );
  INVXLTS U274 ( .A(iir_data_in[11]), .Y(n555) );
  INVXLTS U275 ( .A(fft_data_in[21]), .Y(n557) );
  INVXLTS U276 ( .A(iir_data_in[10]), .Y(n559) );
  INVXLTS U277 ( .A(fft_data_in[22]), .Y(n561) );
  INVXLTS U278 ( .A(iir_data_in[9]), .Y(n563) );
  INVXLTS U279 ( .A(fft_data_in[23]), .Y(n565) );
  INVXLTS U280 ( .A(iir_data_in[8]), .Y(n567) );
  INVXLTS U281 ( .A(fft_data_in[24]), .Y(n569) );
  INVXLTS U282 ( .A(iir_data_in[7]), .Y(n571) );
  INVXLTS U283 ( .A(fft_data_in[25]), .Y(n573) );
  INVXLTS U284 ( .A(iir_data_in[6]), .Y(n575) );
  INVXLTS U285 ( .A(fft_data_in[26]), .Y(n577) );
  INVXLTS U286 ( .A(iir_data_in[5]), .Y(n579) );
  INVXLTS U287 ( .A(fft_data_in[27]), .Y(n581) );
  INVXLTS U288 ( .A(iir_data_in[4]), .Y(n583) );
  INVXLTS U289 ( .A(fft_data_in[28]), .Y(n585) );
  INVXLTS U290 ( .A(iir_data_in[3]), .Y(n587) );
  INVXLTS U291 ( .A(fft_data_in[29]), .Y(n589) );
  INVXLTS U292 ( .A(iir_data_in[2]), .Y(n591) );
  INVXLTS U293 ( .A(fft_data_in[30]), .Y(n593) );
  INVXLTS U294 ( .A(iir_data_in[1]), .Y(n595) );
  INVXLTS U295 ( .A(fft_data_in[31]), .Y(n597) );
  INVXLTS U296 ( .A(iir_data_in[0]), .Y(n599) );
  INVXLTS U297 ( .A(to_fir_full), .Y(n601) );
  INVXLTS U298 ( .A(to_iir_full), .Y(n603) );
  INVXLTS U299 ( .A(to_fft_full), .Y(n605) );
  INVXLTS U300 ( .A(from_iir_full), .Y(n607) );
  INVXLTS U301 ( .A(from_fir_full), .Y(n609) );
  INVXLTS U302 ( .A(iir_enable), .Y(n611) );
  INVXLTS U303 ( .A(from_fir_empty), .Y(n613) );
  INVXLTS U304 ( .A(from_iir_empty), .Y(n615) );
  INVXLTS U305 ( .A(to_fft_empty), .Y(n617) );
  INVXLTS U306 ( .A(from_fft_full), .Y(n619) );
  INVXLTS U307 ( .A(to_fir_empty), .Y(n621) );
  INVXLTS U308 ( .A(to_iir_empty), .Y(n623) );
  INVXLTS U309 ( .A(from_fft_empty), .Y(n625) );
  INVXLTS U310 ( .A(fir_enable), .Y(n627) );
  INVXLTS U311 ( .A(data_bus[12]), .Y(n629) );
  INVXLTS U312 ( .A(data_bus[16]), .Y(n631) );
  INVXLTS U313 ( .A(data_bus[8]), .Y(n633) );
  INVXLTS U314 ( .A(data_bus[20]), .Y(n635) );
  INVXLTS U315 ( .A(data_bus[4]), .Y(n637) );
  INVXLTS U316 ( .A(data_bus[24]), .Y(n639) );
  INVXLTS U317 ( .A(data_bus[0]), .Y(n641) );
  INVXLTS U318 ( .A(data_bus[28]), .Y(n643) );
  INVXLTS U319 ( .A(fft_enable), .Y(n645) );
  INVXLTS U320 ( .A(data_bus[1]), .Y(n648) );
  INVXLTS U321 ( .A(data_bus[5]), .Y(n650) );
  INVXLTS U322 ( .A(data_bus[9]), .Y(n652) );
  INVXLTS U323 ( .A(data_bus[13]), .Y(n654) );
  INVXLTS U324 ( .A(data_bus[17]), .Y(n656) );
  INVXLTS U325 ( .A(data_bus[21]), .Y(n658) );
  INVXLTS U326 ( .A(data_bus[25]), .Y(n660) );
  INVXLTS U327 ( .A(data_bus[29]), .Y(n662) );
  INVXLTS U328 ( .A(data_bus[2]), .Y(n664) );
  INVXLTS U329 ( .A(data_bus[6]), .Y(n666) );
  INVXLTS U330 ( .A(data_bus[10]), .Y(n668) );
  INVXLTS U331 ( .A(data_bus[14]), .Y(n670) );
  INVXLTS U332 ( .A(data_bus[18]), .Y(n672) );
  INVXLTS U333 ( .A(data_bus[22]), .Y(n674) );
  INVXLTS U334 ( .A(data_bus[26]), .Y(n676) );
  INVXLTS U335 ( .A(data_bus[30]), .Y(n678) );
  INVXLTS U336 ( .A(data_bus[3]), .Y(n680) );
  INVXLTS U337 ( .A(data_bus[7]), .Y(n682) );
  INVXLTS U338 ( .A(data_bus[11]), .Y(n684) );
  INVXLTS U339 ( .A(data_bus[15]), .Y(n686) );
  INVXLTS U340 ( .A(data_bus[19]), .Y(n688) );
  INVXLTS U341 ( .A(data_bus[23]), .Y(n690) );
  INVXLTS U342 ( .A(data_bus[27]), .Y(n692) );
  INVXLTS U343 ( .A(data_bus[31]), .Y(n694) );
  CLKBUFX2TS U344 ( .A(n710), .Y(n704) );
  CLKBUFX2TS U345 ( .A(n710), .Y(n705) );
  CLKBUFX2TS U346 ( .A(n322), .Y(n706) );
  CLKBUFX2TS U347 ( .A(n322), .Y(n707) );
  CLKBUFX2TS U348 ( .A(n322), .Y(n708) );
  CLKBUFX2TS U349 ( .A(n727), .Y(n721) );
  CLKBUFX2TS U350 ( .A(n727), .Y(n722) );
  CLKBUFX2TS U351 ( .A(n194), .Y(n723) );
  CLKBUFX2TS U352 ( .A(n194), .Y(n724) );
  CLKBUFX2TS U353 ( .A(n194), .Y(n725) );
  CLKBUFX2TS U354 ( .A(n727), .Y(n726) );
  CLKBUFX2TS U355 ( .A(n194), .Y(n727) );
  INVXLTS U356 ( .A(N99), .Y(n194) );
  CLKBUFX2TS U357 ( .A(n744), .Y(n738) );
  CLKBUFX2TS U358 ( .A(n744), .Y(n739) );
  CLKBUFX2TS U359 ( .A(n66), .Y(n740) );
  CLKBUFX2TS U360 ( .A(n66), .Y(n741) );
  CLKBUFX2TS U361 ( .A(n66), .Y(n742) );
  CLKBUFX2TS U362 ( .A(n744), .Y(n743) );
  CLKBUFX2TS U363 ( .A(n66), .Y(n744) );
  INVXLTS U364 ( .A(N63), .Y(n66) );
  CLKBUFX2TS U365 ( .A(n710), .Y(n709) );
  CLKBUFX2TS U366 ( .A(n322), .Y(n710) );
  INVXLTS U367 ( .A(N191), .Y(n322) );
  CLKBUFX2TS U368 ( .A(n2), .Y(n751) );
  CLKBUFX2TS U369 ( .A(n2), .Y(n749) );
  CLKBUFX2TS U370 ( .A(n2), .Y(n748) );
  CLKBUFX2TS U371 ( .A(n2), .Y(n747) );
  INVXLTS U372 ( .A(N9), .Y(n2) );
  CLKBUFX2TS U373 ( .A(n130), .Y(n734) );
  CLKBUFX2TS U374 ( .A(n130), .Y(n732) );
  CLKBUFX2TS U375 ( .A(n130), .Y(n731) );
  CLKBUFX2TS U376 ( .A(n130), .Y(n730) );
  INVXLTS U377 ( .A(N95), .Y(n130) );
  CLKBUFX2TS U378 ( .A(n258), .Y(n717) );
  CLKBUFX2TS U379 ( .A(n258), .Y(n715) );
  CLKBUFX2TS U380 ( .A(n258), .Y(n714) );
  CLKBUFX2TS U381 ( .A(n258), .Y(n713) );
  INVXLTS U382 ( .A(N159), .Y(n258) );
  CLKBUFX2TS U383 ( .A(data_to_iir), .Y(n702) );
  CLKBUFX2TS U384 ( .A(data_to_iir), .Y(n703) );
  CLKBUFX2TS U385 ( .A(data_to_fir), .Y(n719) );
  CLKBUFX2TS U386 ( .A(data_to_fir), .Y(n720) );
  CLKBUFX2TS U387 ( .A(data_to_fft), .Y(n736) );
  CLKBUFX2TS U388 ( .A(data_to_fft), .Y(n737) );
  CLKBUFX2TS U389 ( .A(data_from_fft), .Y(n750) );
  CLKBUFX2TS U390 ( .A(data_from_fft), .Y(n746) );
  CLKBUFX2TS U391 ( .A(data_from_fft), .Y(n745) );
  CLKBUFX2TS U392 ( .A(data_from_fir), .Y(n735) );
  CLKBUFX2TS U393 ( .A(data_from_fir), .Y(n733) );
  CLKBUFX2TS U394 ( .A(data_from_fft), .Y(n752) );
  CLKBUFX2TS U395 ( .A(data_from_fir), .Y(n729) );
  CLKBUFX2TS U396 ( .A(data_from_fir), .Y(n728) );
  CLKBUFX2TS U397 ( .A(data_from_iir), .Y(n718) );
  CLKBUFX2TS U398 ( .A(data_from_iir), .Y(n716) );
  CLKBUFX2TS U399 ( .A(data_from_iir), .Y(n712) );
  CLKBUFX2TS U400 ( .A(data_from_iir), .Y(n711) );
endmodule


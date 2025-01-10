-- EEPROM.vhdl
-- This passed the testbench with a minor error, which is when Rst is set (and everything else remain the same, the output changes randomly, but it does not affect the functionality of the EEPROM.)
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity EEPROM is
	port (
		addr: in std_logic_vector(3 downto 0);
		Din: in std_logic_vector(3 downto 0);
		Rst: in std_logic;
		WE: in std_logic;
		clk: in std_logic;
		Dout: out std_logic_vector(3 downto 0));
end EEPROM;

architecture Structural of EEPROM is
	signal s0: std_logic;
	signal s1: std_logic;
	signal s2: std_logic;
	signal s3: std_logic_vector(3 downto 0);
	signal s4: std_logic;
	signal s5: std_logic;
	signal s6: std_logic;
	signal s7: std_logic;
	signal s8: std_logic;
	signal s9: std_logic;
	signal s10: std_logic;
	signal s11: std_logic;
	signal s12: std_logic;
	signal s13: std_logic;
	signal s14: std_logic;
	signal s15: std_logic;
	signal s16: std_logic;
	signal s17: std_logic;
	signal s18: std_logic;
	signal s19: std_logic;
	signal s20: std_logic;
	signal s21: std_logic;
	signal s22: std_logic;
	signal s23: std_logic;
	signal s24: std_logic;
	signal s25: std_logic;
	signal s26: std_logic;
	signal s27: std_logic;
	signal s28: std_logic;
	signal s29: std_logic;
	signal s30: std_logic;
	signal s31: std_logic;
	signal s32: std_logic;
	signal s33: std_logic;
	signal s34: std_logic;
	signal s35: std_logic;
	signal s36: std_logic;
	signal s37: std_logic;
	signal s38: std_logic;
	signal s39: std_logic;
	signal s40: std_logic;
	signal s41: std_logic;
	signal s42: std_logic;
	signal s43: std_logic;
	signal s44: std_logic;
	signal s45: std_logic;
	signal s46: std_logic;
	signal s47: std_logic;
	signal s48: std_logic;
	signal s49: std_logic;
	signal s50: std_logic;
	signal s51: std_logic;
	signal s52: std_logic;
	signal s53: std_logic;
	signal s54: std_logic;
	signal s55: std_logic;
	signal s56: std_logic;
	signal s57: std_logic;
	signal s58: std_logic;
	signal s59: std_logic;
	signal s60: std_logic;
	signal s61: std_logic;
	signal s62: std_logic;
	signal s63: std_logic;
	signal s64: std_logic;
	signal s65: std_logic;
	signal s66: std_logic;
	signal s67: std_logic;
	signal s68: std_logic;
	signal s69: std_logic;
	signal s70: std_logic;
	signal s71: std_logic;
	signal s72: std_logic;
	signal s73: std_logic;
	signal s74: std_logic;
	signal s75: std_logic;
	signal s76: std_logic;
	signal s77: std_logic;
	signal s78: std_logic;
	signal s79: std_logic;
	signal s80: std_logic;
	signal s81: std_logic;
	signal s82: std_logic;
	signal s83: std_logic;
	signal s84: std_logic;
	signal s85: std_logic;
	signal s86: std_logic;
	signal s87: std_logic;
	signal s88: std_logic;
	signal s89: std_logic;
	signal s90: std_logic;
	signal s91: std_logic;
	signal s92: std_logic;
	signal s93: std_logic;
	signal s94: std_logic;
	signal s95: std_logic;
	signal s96: std_logic;
	signal s97: std_logic;
	signal s98: std_logic;
	signal s99: std_logic;
	signal s100: std_logic;
	signal s101: std_logic;
	signal s102: std_logic;
	signal s103: std_logic;
	signal s104: std_logic;
	signal s105: std_logic;
	signal s106: std_logic;
	signal s107: std_logic;
	signal s108: std_logic;
	signal s109: std_logic;
	signal s110: std_logic;
	signal s111: std_logic;
	signal s112: std_logic;
	signal s113: std_logic;
	signal s114: std_logic;
	signal s115: std_logic;
	signal s116: std_logic;
	signal s117: std_logic;
begin
	gate0: entity work.DECODER_4
		port map (
			sel => addr,
			out_0 => s101,
			out_1 => s102,
			out_2 => s103,
			out_3 => s104,
			out_4 => s105,
			out_5 => s106,
			out_6 => s107,
			out_7 => s108,
			out_8 => s109,
			out_9 => s110,
			out_10 => s111,
			out_11 => s112,
			out_12 => s113,
			out_13 => s114,
			out_14 => s115,
			out_15 => s116);
	s117 <= (clk AND WE);
	gate1: entity work.MUX_GATE_BUS_1
		generic map (
			Bits => 4)
		port map (
			sel => Rst,
			in_0 => Din,
			in_1 => "0000",
			p_out => s3);
	s52 <= (s101 OR Rst);
	s49 <= (s102 OR Rst);
	s46 <= (s103 OR Rst);
	s43 <= (s104 OR Rst);
	s40 <= (s105 OR Rst);
	s37 <= (s106 OR Rst);
	s34 <= (s107 OR Rst);
	s31 <= (s108 OR Rst);
	s28 <= (s109 OR Rst);
	s25 <= (s110 OR Rst);
	s22 <= (s111 OR Rst);
	s19 <= (s112 OR Rst);
	s16 <= (s113 OR Rst);
	s13 <= (s114 OR Rst);
	s10 <= (s115 OR Rst);
	s7 <= (s116 OR Rst);
	s4 <= s3(0);
	s5 <= s3(1);
	s6 <= s3(2);
	s0 <= s3(3);
	s50 <= (s117 AND s52);
	s47 <= (s117 AND s49);
	s44 <= (s117 AND s46);
	s41 <= (s117 AND s43);
	s38 <= (s117 AND s40);
	s35 <= (s117 AND s37);
	s32 <= (s117 AND s34);
	s29 <= (s117 AND s31);
	s26 <= (s117 AND s28);
	s23 <= (s117 AND s25);
	s20 <= (s117 AND s22);
	s17 <= (s117 AND s19);
	s14 <= (s117 AND s16);
	s11 <= (s117 AND s13);
	s8 <= (s117 AND s10);
	s1 <= (s117 AND s7);
	gate2: entity work.Dff
		port map (
			D => s0,
			clk => s1,
			Q => s2);
	gate3: entity work.Dff
		port map (
			D => s0,
			clk => s8,
			Q => s9);
	gate4: entity work.Dff
		port map (
			D => s0,
			clk => s11,
			Q => s12);
	gate5: entity work.Dff
		port map (
			D => s0,
			clk => s14,
			Q => s15);
	gate6: entity work.Dff
		port map (
			D => s0,
			clk => s17,
			Q => s18);
	gate7: entity work.Dff
		port map (
			D => s0,
			clk => s20,
			Q => s21);
	gate8: entity work.Dff
		port map (
			D => s0,
			clk => s23,
			Q => s24);
	gate9: entity work.Dff
		port map (
			D => s0,
			clk => s26,
			Q => s27);
	gate10: entity work.Dff
		port map (
			D => s0,
			clk => s29,
			Q => s30);
	gate11: entity work.Dff
		port map (
			D => s0,
			clk => s32,
			Q => s33);
	gate12: entity work.Dff
		port map (
			D => s0,
			clk => s35,
			Q => s36);
	gate13: entity work.Dff
		port map (
			D => s0,
			clk => s38,
			Q => s39);
	gate14: entity work.Dff
		port map (
			D => s0,
			clk => s41,
			Q => s42);
	gate15: entity work.Dff
		port map (
			D => s0,
			clk => s44,
			Q => s45);
	gate16: entity work.Dff
		port map (
			D => s0,
			clk => s47,
			Q => s48);
	gate17: entity work.Dff
		port map (
			D => s0,
			clk => s50,
			Q => s51);
	gate18: entity work.Dff
		port map (
			D => s6,
			clk => s1,
			Q => s53);
	gate19: entity work.Dff
		port map (
			D => s6,
			clk => s8,
			Q => s54);
	gate20: entity work.Dff
		port map (
			D => s6,
			clk => s11,
			Q => s55);
	gate21: entity work.Dff
		port map (
			D => s6,
			clk => s14,
			Q => s56);
	gate22: entity work.Dff
		port map (
			D => s6,
			clk => s17,
			Q => s57);
	gate23: entity work.Dff
		port map (
			D => s6,
			clk => s20,
			Q => s58);
	gate24: entity work.Dff
		port map (
			D => s6,
			clk => s23,
			Q => s59);
	gate25: entity work.Dff
		port map (
			D => s6,
			clk => s26,
			Q => s60);
	gate26: entity work.Dff
		port map (
			D => s6,
			clk => s29,
			Q => s61);
	gate27: entity work.Dff
		port map (
			D => s6,
			clk => s32,
			Q => s62);
	gate28: entity work.Dff
		port map (
			D => s6,
			clk => s35,
			Q => s63);
	gate29: entity work.Dff
		port map (
			D => s6,
			clk => s38,
			Q => s64);
	gate30: entity work.Dff
		port map (
			D => s6,
			clk => s41,
			Q => s65);
	gate31: entity work.Dff
		port map (
			D => s6,
			clk => s44,
			Q => s66);
	gate32: entity work.Dff
		port map (
			D => s6,
			clk => s47,
			Q => s67);
	gate33: entity work.Dff
		port map (
			D => s6,
			clk => s50,
			Q => s68);
	gate34: entity work.Dff
		port map (
			D => s5,
			clk => s1,
			Q => s69);
	gate35: entity work.Dff
		port map (
			D => s5,
			clk => s8,
			Q => s70);
	gate36: entity work.Dff
		port map (
			D => s5,
			clk => s11,
			Q => s71);
	gate37: entity work.Dff
		port map (
			D => s5,
			clk => s14,
			Q => s72);
	gate38: entity work.Dff
		port map (
			D => s5,
			clk => s17,
			Q => s73);
	gate39: entity work.Dff
		port map (
			D => s5,
			clk => s20,
			Q => s74);
	gate40: entity work.Dff
		port map (
			D => s5,
			clk => s23,
			Q => s75);
	gate41: entity work.Dff
		port map (
			D => s5,
			clk => s26,
			Q => s76);
	gate42: entity work.Dff
		port map (
			D => s5,
			clk => s29,
			Q => s77);
	gate43: entity work.Dff
		port map (
			D => s5,
			clk => s32,
			Q => s78);
	gate44: entity work.Dff
		port map (
			D => s5,
			clk => s35,
			Q => s79);
	gate45: entity work.Dff
		port map (
			D => s5,
			clk => s38,
			Q => s80);
	gate46: entity work.Dff
		port map (
			D => s5,
			clk => s41,
			Q => s81);
	gate47: entity work.Dff
		port map (
			D => s5,
			clk => s44,
			Q => s82);
	gate48: entity work.Dff
		port map (
			D => s5,
			clk => s47,
			Q => s83);
	gate49: entity work.Dff
		port map (
			D => s5,
			clk => s50,
			Q => s84);
	gate50: entity work.Dff
		port map (
			D => s4,
			clk => s1,
			Q => s85);
	gate51: entity work.Dff
		port map (
			D => s4,
			clk => s8,
			Q => s86);
	gate52: entity work.Dff
		port map (
			D => s4,
			clk => s11,
			Q => s87);
	gate53: entity work.Dff
		port map (
			D => s4,
			clk => s14,
			Q => s88);
	gate54: entity work.Dff
		port map (
			D => s4,
			clk => s17,
			Q => s89);
	gate55: entity work.Dff
		port map (
			D => s4,
			clk => s20,
			Q => s90);
	gate56: entity work.Dff
		port map (
			D => s4,
			clk => s23,
			Q => s91);
	gate57: entity work.Dff
		port map (
			D => s4,
			clk => s26,
			Q => s92);
	gate58: entity work.Dff
		port map (
			D => s4,
			clk => s29,
			Q => s93);
	gate59: entity work.Dff
		port map (
			D => s4,
			clk => s32,
			Q => s94);
	gate60: entity work.Dff
		port map (
			D => s4,
			clk => s35,
			Q => s95);
	gate61: entity work.Dff
		port map (
			D => s4,
			clk => s38,
			Q => s96);
	gate62: entity work.Dff
		port map (
			D => s4,
			clk => s41,
			Q => s97);
	gate63: entity work.Dff
		port map (
			D => s4,
			clk => s44,
			Q => s98);
	gate64: entity work.Dff
		port map (
			D => s4,
			clk => s47,
			Q => s99);
	gate65: entity work.Dff
		port map (
			D => s4,
			clk => s50,
			Q => s100);
	Dout(0) <= ((s52 AND s100) OR (s49 AND s99) OR (s46 AND s98) OR (s43 AND s97) OR (s40 AND s96) OR (s37 AND s95) OR (s34 AND s94) OR (s31 AND s93) OR (s28 AND s92) OR (s25 AND s91) OR (s22 AND s90) OR (s19 AND s89) OR (s16 AND s88) OR (s13 AND s87) OR (s10 AND s86) OR (s7 AND s85));
	Dout(1) <= ((s52 AND s84) OR (s49 AND s83) OR (s46 AND s82) OR (s43 AND s81) OR (s40 AND s80) OR (s37 AND s79) OR (s34 AND s78) OR (s31 AND s77) OR (s28 AND s76) OR (s25 AND s75) OR (s22 AND s74) OR (s19 AND s73) OR (s16 AND s72) OR (s13 AND s71) OR (s10 AND s70) OR (s7 AND s69));
	Dout(2) <= ((s52 AND s68) OR (s49 AND s67) OR (s46 AND s66) OR (s43 AND s65) OR (s40 AND s64) OR (s37 AND s63) OR (s34 AND s62) OR (s31 AND s61) OR (s28 AND s60) OR (s25 AND s59) OR (s22 AND s58) OR (s19 AND s57) OR (s16 AND s56) OR (s13 AND s55) OR (s10 AND s54) OR (s7 AND s53));
	Dout(3) <= ((s52 AND s51) OR (s49 AND s48) OR (s46 AND s45) OR (s43 AND s42) OR (s40 AND s39) OR (s37 AND s36) OR (s34 AND s33) OR (s31 AND s30) OR (s28 AND s27) OR (s25 AND s24) OR (s22 AND s21) OR (s19 AND s18) OR (s16 AND s15) OR (s13 AND s12) OR (s10 AND s9) OR (s7 AND s2));
end Structural;

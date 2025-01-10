-- buffer8bit.vhdl

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity buffer8bit is
	port (
		Rh: in std_logic_vector(3 downto 0);
		Rl: in std_logic_vector(3 downto 0);
		Rst: in std_logic;
		clk: in std_logic;
		Result: out std_logic_vector(7 downto 0));
end buffer8bit;

architecture Structural of buffer8bit is
	signal s0: std_logic;
	signal s1: std_logic;
	signal s2: std_logic;
	signal s3: std_logic;
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
	signal s16: std_logic_vector(7 downto 0);
begin
	s6 <= Rh(0);
	s4 <= Rh(1);
	s2 <= Rh(2);
	s0 <= Rh(3);
	s14 <= Rl(0);
	s12 <= Rl(1);
	s10 <= Rl(2);
	s8 <= Rl(3);
	gate0: entity work.Dff
		port map (
			D => s0,
			clk => clk,
			Q => s1);
	gate1: entity work.Dff
		port map (
			D => s2,
			clk => clk,
			Q => s3);
	gate2: entity work.Dff
		port map (
			D => s4,
			clk => clk,
			Q => s5);
	gate3: entity work.Dff
		port map (
			D => s6,
			clk => clk,
			Q => s7);
	gate4: entity work.Dff
		port map (
			D => s8,
			clk => clk,
			Q => s9);
	gate5: entity work.Dff
		port map (
			D => s10,
			clk => clk,
			Q => s11);
	gate6: entity work.Dff
		port map (
			D => s12,
			clk => clk,
			Q => s13);
	gate7: entity work.Dff
		port map (
			D => s14,
			clk => clk,
			Q => s15);
	s16(0) <= s15;
	s16(1) <= s13;
	s16(2) <= s11;
	s16(3) <= s9;
	s16(4) <= s7;
	s16(5) <= s5;
	s16(6) <= s3;
	s16(7) <= s1;
	gate8: entity work.MUX_GATE_BUS_1
		generic map (
			Bits => 8)
		port map (
			sel => Rst,
			in_0 => "00000000",
			in_1 => s16,
			p_out => Result);
end Structural;

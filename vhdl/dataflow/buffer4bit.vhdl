-- buffer4bit.vhdl

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity buffer4bit is
	port (
		Rst: in std_logic;
		clk: in std_logic;
		Din: in std_logic_vector(3 downto 0);
		Dout: out std_logic_vector(3 downto 0));
end buffer4bit;

architecture Structural of buffer4bit is
	signal s0: std_logic_vector(3 downto 0);
	signal s1: std_logic;
	signal s2: std_logic;
	signal s3: std_logic;
	signal s4: std_logic;
	signal s5: std_logic;
	signal s6: std_logic;
	signal s7: std_logic;
	signal s8: std_logic;
begin
	gate0: entity work.MUX_GATE_BUS_1
		generic map (
			Bits => 4)
		port map (
			sel => Rst,
			in_0 => Din,
			in_1 => "0000",
			p_out => s0);
	s1 <= s0(0);
	s3 <= s0(1);
	s5 <= s0(2);
	s7 <= s0(3);
	gate1: entity work.Dff
		port map (
			D => s1,
			clk => clk,
			Q => s2);
	gate2: entity work.Dff
		port map (
			D => s3,
			clk => clk,
			Q => s4);
	gate3: entity work.Dff
		port map (
			D => s5,
			clk => clk,
			Q => s6);
	gate4: entity work.Dff
		port map (
			D => s7,
			clk => clk,
			Q => s8);
	Dout(0) <= s2;
	Dout(1) <= s4;
	Dout(2) <= s6;
	Dout(3) <= s8;
end Structural;

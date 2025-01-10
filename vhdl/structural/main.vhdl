-- main.vhdl

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
	port (
		N: in std_logic_vector(3 downto 0);
		data: in std_logic_vector(3 downto 0);
		write: in std_logic;
		addr: in std_logic_vector(3 downto 0);
		forceRst: in std_logic;
		clock: in std_logic;
		Result: out std_logic_vector(7 downto 0));
end main;

architecture Structural of main is
	signal clk: std_logic;
	signal rst: std_logic;
	signal s0: std_logic_vector(3 downto 0);
	signal s1: std_logic_vector(3 downto 0);
	signal s2: std_logic_vector(3 downto 0);
	signal s3: std_logic;
	signal s4: std_logic_vector(3 downto 0);
	signal s5: std_logic_vector(3 downto 0);
	signal s6: std_logic;
	signal s7: std_logic_vector(3 downto 0);
	signal str: std_logic;
begin
	gate0: entity work.DEMUX_GATE_1
		generic map (
			Default => 0)
		port map (
			sel => write,
			p_in => clock,
			out_0 => clk,
			out_1 => str);
	gate1: entity work.DIG_Counter
		generic map (
			Bits => 4)
		port map (
			en => '1',
			C => clk,
			clr => rst,
			p_out => s0);
	gate2: entity work.RhCount
		port map (
			clk => clk,
			C => s3,
			Rst => rst,
			Rh => s5);
	gate3: entity work.buffer4bit
		port map (
			Rst => rst,
			clk => clk,
			Din => s4,
			Dout => s2);
	gate4: entity work.buffer8bit
		port map (
			Rh => s5,
			Rl => s4,
			Rst => rst,
			clk => clk,
			Result => Result);
	gate5: entity work.isMax
		port map (
			N => N,
			Addr => s0,
			rst => s6);
	gate6: entity work.EEPROM
		port map (
			addr => s7,
			Din => data,
			Rst => rst,
			WE => write,
			clk => str,
			Dout => s1);
	gate7: entity work.MUX_GATE_BUS_1
		generic map (
			Bits => 4)
		port map (
			sel => write,
			in_0 => s0,
			in_1 => addr,
			p_out => s7);
	rst <= (forceRst OR s6);
	gate8: entity work.adder4bit
		port map (
			A => s1,
			B => s2,
			C => s3,
			Rl => s4);
end Structural;

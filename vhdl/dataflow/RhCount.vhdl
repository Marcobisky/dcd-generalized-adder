-- RhCount.vhdl

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RhCount is
	port (
		clk: in std_logic;
		C: in std_logic;
		Rst: in std_logic;
		Rh: out std_logic_vector(3 downto 0) -- Higher four bits of the result
		);
end RhCount;

architecture Behavioral of RhCount is
begin
	gate0: entity work.DIG_Counter
		generic map (
			Bits => 4)
		port map (
			en => C,
			C => clk,
			clr => Rst,
			p_out => Rh);
end Behavioral;

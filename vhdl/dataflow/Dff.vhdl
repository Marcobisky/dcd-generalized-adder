-- Dff.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Dff is
	port (
		D: in std_logic;
		clk: in std_logic;
		Q: out std_logic);
end Dff;

architecture Dataflow of Dff is
	signal s0: std_logic := '0';
	signal Q_temp: std_logic := '0';
begin
	Q_temp <= NOT (NOT (s0 AND clk) AND NOT (Q_temp AND NOT (clk AND NOT s0)));
	s0 <= NOT (NOT (D AND NOT clk) AND NOT (s0 AND NOT (NOT clk AND NOT D)));
	Q <= Q_temp;
end Dataflow;

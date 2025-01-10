-- isMax.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity isMax is
	port (
		N: in std_logic_vector(3 downto 0);
		Addr: in std_logic_vector(3 downto 0);
		rst: out std_logic);
end isMax;

architecture Dataflow of isMax is
begin
	rst <= (NOT (N(0) XOR Addr(0)) AND NOT (N(1) XOR Addr(1)) AND NOT (N(2) XOR Addr(2)) AND NOT (N(3) XOR Addr(3)));
end Dataflow;

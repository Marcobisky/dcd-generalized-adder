-- adder2bit.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity adder2bit is
	port (
		Ah: in std_logic;
		Al: in std_logic;
		Bh: in std_logic;
		Bl: in std_logic;
		C: out std_logic;
		Q1: out std_logic;
		Q0: out std_logic);
end adder2bit;

architecture Dataflow of adder2bit is
	signal s0: std_logic := '0';
	signal s1: std_logic := '0';
	signal s2: std_logic := '0';
	signal s3: std_logic := '0';
begin
	s0 <= NOT (Ah AND Bh);
	s1 <= NOT (Al AND Bl);
	s2 <= NOT (NOT s0 OR (NOT Ah AND NOT Bh));
	Q0 <= NOT (NOT s1 OR (NOT Al AND NOT Bl));
	s3 <= NOT (s2 AND NOT s1);
	Q1 <= NOT (NOT s3 OR NOT (s2 OR NOT s1));
	C <= (NOT s0 OR NOT s3);
end Dataflow;

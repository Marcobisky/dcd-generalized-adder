-- DIG_Counter.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity DIG_Counter is
	generic ( Bits: integer ); 
	port (
		p_out: out std_logic_vector((Bits-1) downto 0);
		ovf: out std_logic;
		C: in std_logic;
		en: in std_logic;
		clr: in std_logic );
end DIG_Counter;

architecture Behavioral of DIG_Counter is
	 signal count : std_logic_vector((Bits-1) downto 0) := (others => '0');
begin
		process (C, clr, en)
		begin
			if rising_edge(C) then
				if clr='1' then
					count <= (others => '0');
				elsif en='1' then
					count <= count + 1;
				end if;
			end if;
		end process;

		p_out <= count;
		ovf <= en when count = ((2**Bits)-1) else '0';
end Behavioral;

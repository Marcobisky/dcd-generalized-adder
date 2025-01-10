-- isMax.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity isMax is
    port (
        N: in std_logic_vector(3 downto 0);
        Addr: in std_logic_vector(3 downto 0);
        rst: out std_logic);
end isMax;

architecture Behavioral of isMax is
begin
    process(N, Addr)
    begin
        if N = Addr then
            rst <= '1';  -- rst is asserted when N equals Addr
        else
            rst <= '0';  -- rst is deasserted otherwise
        end if;
    end process;
end Behavioral;

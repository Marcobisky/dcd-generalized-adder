-- adder2bit.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;

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

architecture Behavioral of adder2bit is
    signal sel: std_logic_vector(3 downto 0); -- Combine inputs into a single signal
begin
    -- Combine inputs into a 4-bit signal
    sel <= Ah & Al & Bh & Bl;

    -- Enumerate all possible input combinations and assign Q0
    Q0 <= '1' when sel = "0001" or
                   sel = "0011" or
                   sel = "0100" or
                   sel = "0110" or
                   sel = "1001" or
                   sel = "1011" or
                   sel = "1100" or 
                   sel = "1110" else
          '0';

    -- Enumerate all possible input combinations and assign Q1
    Q1 <= '1' when sel = "0010" or
                   sel = "0011" or
                   sel = "0101" or
                   sel = "0110" or
                   sel = "1000" or
                   sel = "1001" or
                   sel = "1100" or 
                   sel = "1111" else
          '0';

    -- Enumerate all possible input combinations and assign C
    C <= '1' when sel = "0111" or
                  sel = "1010" or
                  sel = "1011" or
                  sel = "1101" or
                  sel = "1110" or
                  sel = "1111" else
          '0';
end Behavioral;
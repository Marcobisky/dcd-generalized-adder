-- Dff.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Dff is
    port (
        D   : in std_logic;  -- Data input
        clk : in std_logic;  -- Clock input
        Q   : out std_logic  -- Output
    );
end Dff;

architecture Behavioral of Dff is
    signal Q_internal : std_logic := '0';  -- Internal signal for flip-flop state
begin
    process(clk)
    begin
        if rising_edge(clk) then
            Q_internal <= D;  -- Update internal state on clock's rising edge
        end if;
    end process;

    Q <= Q_internal;  -- Assign internal state to output
end Behavioral;
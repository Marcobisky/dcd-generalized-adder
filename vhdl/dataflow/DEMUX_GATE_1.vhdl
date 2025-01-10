LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity DEMUX_GATE_1 is
  generic (
    Default : integer );
  port (
    out_0: out std_logic;
    out_1: out std_logic;
    sel: in std_logic;
    p_in: in std_logic );
end DEMUX_GATE_1;

architecture Behavioral of DEMUX_GATE_1 is
begin
    out_0 <= p_in when sel = '0' else std_logic(to_unsigned(Default, 1)(0));
    out_1 <= p_in when sel = '1' else std_logic(to_unsigned(Default, 1)(0));
end Behavioral;
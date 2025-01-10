-- adder4bit.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity adder4bit is
    port (
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        C: out std_logic; -- carry (R4)
        Rl: out std_logic_vector(3 downto 0) -- Lower four bits of the result
    );
end adder4bit;

architecture Dataflow of adder4bit is
    signal s0: std_logic;
    signal s1: std_logic;
    signal s2: std_logic;
    signal s3: std_logic;
    signal s4: std_logic;
    signal s5: std_logic;
    signal s6: std_logic;
    signal s7: std_logic;
    signal s8: std_logic;
    signal s9: std_logic;
    signal s10: std_logic;
    signal s11: std_logic;
    signal s12: std_logic;
    signal s13: std_logic;
    signal s14: std_logic;
    signal s15: std_logic;
begin
    s11 <= A(0);
    s10 <= A(1);
    s7 <= A(2);
    s6 <= A(3);
    s13 <= B(0);
    s12 <= B(1);
    s9 <= B(2);
    s8 <= B(3);
    gate0: entity work.adder2bit
    port map (
        Ah => s6,
        Al => s7,
        Bh => s8,
        Bl => s9,
        C => s5,
        Q1 => s3,
        Q0 => s0);
    gate1: entity work.adder2bit
    port map (
        Ah => s10,
        Al => s11,
        Bh => s12,
        Bl => s13,
        C => s1,
        Q1 => s14,
        Q0 => s15);
    s2 <= (s0 AND s1);
    s4 <= (s3 AND s2);
    C <= NOT ((s5 AND s4) OR (NOT s5 AND NOT s4));
    Rl(0) <= s15;
    Rl(1) <= s14;
    Rl(2) <= NOT (s2 OR (NOT s0 AND NOT s1));
    Rl(3) <= NOT (s4 OR (NOT s3 AND NOT s2));
end Dataflow;

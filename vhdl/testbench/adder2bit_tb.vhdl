LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY adder2bit_tb IS
END adder2bit_tb;

ARCHITECTURE behavior OF adder2bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT adder2bit
    PORT (
        Ah : IN std_logic;
        Al : IN std_logic;
        Bh : IN std_logic;
        Bl : IN std_logic;
        C  : OUT std_logic;
        Q1 : OUT std_logic;
        Q0 : OUT std_logic
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL Ah : std_logic := '0';
    SIGNAL Al : std_logic := '0';
    SIGNAL Bh : std_logic := '0';
    SIGNAL Bl : std_logic := '0';
    SIGNAL C  : std_logic;
    SIGNAL Q1 : std_logic;
    SIGNAL Q0 : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: adder2bit
        PORT MAP (
            Ah => Ah,
            Al => Al,
            Bh => Bh,
            Bl => Bl,
            C  => C,
            Q1 => Q1,
            Q0 => Q0
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: 00 + 00
        Ah <= '0'; Al <= '0'; Bh <= '0'; Bl <= '0';
        WAIT FOR 10 ns;
        ASSERT (C = '0' AND Q1 = '0' AND Q0 = '0') 
        REPORT "Test case 1 failed!" SEVERITY error;

        -- Test Case 2: 01 + 01
        Ah <= '0'; Al <= '1'; Bh <= '0'; Bl <= '1';
        WAIT FOR 10 ns;
        ASSERT (C = '0' AND Q1 = '1' AND Q0 = '0') 
        REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: 10 + 10
        Ah <= '1'; Al <= '0'; Bh <= '1'; Bl <= '0';
        WAIT FOR 10 ns;
        ASSERT (C = '1' AND Q1 = '0' AND Q0 = '0') 
        REPORT "Test case 3 failed!" SEVERITY error;

        -- Test Case 4: 11 + 11
        Ah <= '1'; Al <= '1'; Bh <= '1'; Bl <= '1';
        WAIT FOR 10 ns;
        ASSERT (C = '1' AND Q1 = '1' AND Q0 = '0') 
        REPORT "Test case 4 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;
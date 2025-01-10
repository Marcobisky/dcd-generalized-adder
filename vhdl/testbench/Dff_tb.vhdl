LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Dff_tb IS
END Dff_tb;

ARCHITECTURE behavior OF Dff_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Dff
    PORT (
        D   : IN std_logic;
        clk : IN std_logic;
        Q   : OUT std_logic
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL D   : std_logic := '0';
    SIGNAL clk : std_logic := '0';
    SIGNAL Q   : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Dff
        PORT MAP (
            D   => D,
            clk => clk,
            Q   => Q
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Initialize inputs
        D <= '0';
        clk <= '0';
        WAIT FOR 10 ns;

        -- Test Case 1: D = 0, clk rising edge
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Q = '0') REPORT "Test case 1 failed!" SEVERITY error;

        -- Test Case 2: D = 1, clk rising edge
        D <= '1'; -- Change D while clk = 0
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Q = '1') REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: Hold D = 1, clk rising edge
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Q = '1') REPORT "Test case 3 failed!" SEVERITY error;

        -- Test Case 4: D = 0, clk rising edge
        D <= '0'; -- Change D while clk = 0
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Q = '0') REPORT "Test case 4 failed!" SEVERITY error;

        -- Test Case 5: Rapid D change, no clk edge
        D <= '1'; -- Change D while clk is stable
        WAIT FOR 10 ns; -- No rising edge
        ASSERT (Q = '0') REPORT "Test case 5 failed!" SEVERITY error;

        -- Test Case 6: Apply clk after rapid D change
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Q = '1') REPORT "Test case 6 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;
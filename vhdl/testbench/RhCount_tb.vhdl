LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RhCount_tb IS
END RhCount_tb;

ARCHITECTURE behavior OF RhCount_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RhCount
    PORT (
        clk : IN std_logic;
        C   : IN std_logic;
        Rst : IN std_logic;
        Rh  : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL clk : std_logic := '0';
    SIGNAL C   : std_logic := '0';
    SIGNAL Rst : std_logic := '0';
    SIGNAL Rh  : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: RhCount
        PORT MAP (
            clk => clk,
            C   => C,
            Rst => Rst,
            Rh  => Rh
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: Reset the counter
        Rst <= '1'; WAIT FOR 10 ns; -- Apply reset
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk
        ASSERT (Rh = "0000") REPORT "Test case 1 failed!" SEVERITY error;

        -- Test Case 2: Start counting
        Rst <= '0'; C <= '1'; WAIT FOR 10 ns; -- Release reset and enable counting
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk
        ASSERT (Rh = "0001") REPORT "Test case 2 failed!" SEVERITY error;

        clk <= '1'; WAIT FOR 10 ns; -- Rising edge
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge
        ASSERT (Rh = "0010") REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: Pause counting
        C <= '0'; WAIT FOR 10 ns; -- Disable counting
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge
        ASSERT (Rh = "0010") REPORT "Test case 3 failed!" SEVERITY error;

        -- Test Case 4: Resume counting
        C <= '1'; WAIT FOR 10 ns;
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge
        ASSERT (Rh = "0011") REPORT "Test case 4 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;
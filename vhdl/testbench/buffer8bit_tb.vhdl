LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY buffer8bit_tb IS
END buffer8bit_tb;

ARCHITECTURE behavior OF buffer8bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT buffer8bit
    PORT (
        Rh     : IN std_logic_vector(3 downto 0);
        Rl     : IN std_logic_vector(3 downto 0);
        Rst    : IN std_logic;
        clk    : IN std_logic;
        Result : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL Rh     : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Rl     : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Rst    : std_logic := '0';
    SIGNAL clk    : std_logic := '0';
    SIGNAL Result : std_logic_vector(7 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: buffer8bit
        PORT MAP (
            Rh     => Rh,
            Rl     => Rl,
            Rst    => Rst,
            clk    => clk,
            Result => Result
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: Normal operation with no reset
        Rh <= "1010"; Rl <= "0101"; Rst <= '0';
        WAIT FOR 10 ns; -- Stabilize inputs
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Result = "10100101") REPORT "Test case 1 success!" SEVERITY error;

        -- Test Case 2: Reset active
        Rst <= '1'; -- Apply reset
        WAIT FOR 10 ns; -- Wait for reset to take effect
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Result = "00000000") REPORT "Test case 2 success!" SEVERITY error;

        -- Test Case 3: Changing inputs after reset
        Rst <= '0'; -- Release reset
        Rh <= "1111"; Rl <= "0000"; -- New inputs
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Result = "11110000") REPORT "Test case 3 success!" SEVERITY error;

        -- Test Case 4: Verify stable behavior with no input changes
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Result = "11110000") REPORT "Test case 4 success!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY buffer4bit_tb IS
END buffer4bit_tb;

ARCHITECTURE behavior OF buffer4bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT buffer4bit
    PORT (
        Rst  : IN std_logic;
        clk  : IN std_logic;
        Din  : IN std_logic_vector(3 downto 0);
        Dout : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL Rst  : std_logic := '0';
    SIGNAL clk  : std_logic := '0';
    SIGNAL Din  : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Dout : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: buffer4bit
        PORT MAP (
            Rst  => Rst,
            clk  => clk,
            Din  => Din,
            Dout => Dout
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: Normal operation, Din = 1010
        Din <= "1010"; Rst <= '0'; clk <= '1';
        WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Dout = "1010") REPORT "Test case 1 passed!" SEVERITY error;

        -- Test Case 2: Apply reset
        Rst <= '1'; -- Apply reset
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Dout = "0000") REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: Change Din after reset
        Rst <= '0'; -- Release reset
        Din <= "1100"; -- New input
        WAIT FOR 10 ns;
        clk <= '1'; -- Rising edge
        WAIT FOR 10 ns;
        clk <= '0'; -- Falling edge
        WAIT FOR 10 ns;
        ASSERT (Dout = "1100") REPORT "Test case 3 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;
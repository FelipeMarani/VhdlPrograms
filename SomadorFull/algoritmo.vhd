LIBRARY library IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY SomadorFull IS
    PORT (
        a_f, b_f : IN STD_LOGIC;
        carry_in : IN STD_LOGIC;
        sum_f, carry_out : OUT STD_LOGIC
    );
END ENTITY SomadorFull;
ARCHITECTURE Comp_Fullhader OF SomadorFull IS
    COMPONENT half_adder IS
        PORT (
            a, b : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT half_adder;
    SIGNAL s1, c1, c2 : STD_LOGIC;
BEGIN
    ha1 : half_edder
    PORT MAP(
        a => a_f,
        b => b_f,
        carry => c1,
        sum => s1
    );
    ha2 : half_adder
    PORT MAP(
        a => s1,
        b => carry_in,
        carry => c2,
        sum => sum_f
    );
    carry_out <= c1 OR c2;
END ARCHITECTURE Comp_Fullhader;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
    PORT (
        a, b : IN STD_LOGIC;
        sum, carry : OUT STD_LOGIC
    );
END half_adder;

ARCHITECTURE comp_half_adder OF half_adder IS
BEGIN
    PROCESS (a, b)
    BEGIN
        IF (a > b OR b > a) THEN
            sum <= '1';
            carry <= '0';
        ELSIF (a = '0' AND b = '0') THEN
            sum <= '0';
            carry <= '0';
        ELSE
            sum <= '0';
            carry <= '1';
        END IF;
    END PROCESS;
END comp_half_adder;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


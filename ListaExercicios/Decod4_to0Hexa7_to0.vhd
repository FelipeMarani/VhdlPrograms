LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;
ENTITY bcd7seg IS
    PORT (
        EN : IN STD_LOGIC; -- Enable
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Encoder Input
        S : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) -- Encoder Output
    );
END ENTITY bcd7seg;
ARCHITECTURE Decod7 OF bcd7seg IS
BEGIN
    PROCESS (EN, D)
    BEGIN
        IF (EN = '1') THEN
            IF (D(0) = '0' AND D(1) = '0' AND D(2) = '0'AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '0';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '0';
            ELSIF (D(0) = '0' AND D(1) = '0' AND D(2) = '0'AND D(3) = '1') THEN
                S(0) <= '0';
                S(1) <= '0';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '0' AND D(2) = '1'AND D(3) = '0') THEN
                S(0) <= '0';
                S(1) <= '0';
                S(2) <= '0';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '0';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '0' AND D(2) = '1'AND D(3) = '1') THEN
                S(0) <= '0';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '0';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '1' AND D(2) = '0'AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '0';
                S(2) <= '0';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '1' AND D(2) = '0'AND D(3) = '1') THEN
                S(0) <= '1';
                S(1) <= '0';
                S(2) <= '0';
                S(3) <= '0';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '1' AND D(2) = '1'AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '0';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '0' AND D(1) = '1' AND D(2) = '1'AND D(3) = '1') THEN
                S(0) <= '0';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '0';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '0' AND D(2) = '0'AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '0';
            ELSIF (D(0) = '1' AND D(1) = '0' AND D(2) = '0'AND D(3) = '1') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '0';
                S(3) <= '0';
                S(4) <= '0';
                S(5) <= '0';
                S(6) <= '0';
            ELSIF (D(0) = '1' AND D(1) = '0' AND D(2) = '1' AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '0';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '0';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '0' AND D(2) = '1' AND D(3) = '1') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '0';
                S(5) <= '0';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '1' AND D(2) = '0' AND D(3) = '0') THEN
                S(0) <= '0';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '0';
                S(4) <= '0';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '1' AND D(2) = '0' AND D(3) = '1') THEN
                S(0) <= '1';
                S(1) <= '0';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '0';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '1' AND D(2) = '1' AND D(3) = '0') THEN
                S(0) <= '1';
                S(1) <= '0';
                S(2) <= '1';
                S(3) <= '1';
                S(4) <= '1';
                S(5) <= '1';
                S(6) <= '1';
            ELSIF (D(0) = '1' AND D(1) = '1' AND D(2) = '1' AND D(3) = '1') THEN
                S(0) <= '1';
                S(1) <= '1';
                S(2) <= '1';
                S(3) <= '0';
                S(4) <= '0';
                S(5) <= '0';
                S(6) <= '1';
            ELSE
                S <= (OTHERS => '0');
            END IF;
        ELSE
            S <= (OTHERS => '0');
        END IF;
    END PROCESS;
END decod7;
------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top IS
    PORT (
        EN : IN STD_LOGIC;
        D  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        a, b, c, d, e, f, g : OUT STD_LOGIC
    );
END ENTITY top;

ARCHITECTURE behavior OF top IS
    SIGNAL S : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    -- Instancia o decodificador BCD
    U1: ENTITY work.bcd7seg
        PORT MAP (
            EN => EN,
            D  => D,
            S  => S
        );

    -- Atribui os bits aos segmentos
    a <= S(0);
    b <= S(1);
    c <= S(2);
    d <= S(3);
    e <= S(4);
    f <= S(5);
    g <= S(6);
END behavior;


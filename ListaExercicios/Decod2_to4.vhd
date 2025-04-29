LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY decoder_2to4en IS
    PORT (
        EN : IN STD_LOGIC; -- Enable
        A : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- Decoder Input
        Y_L : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) -- Decoder Output (active low)
    );
END ENTITY decoder_2to4en;
ARCHITECTURE Decod OF decoder_2to4en IS
BEGIN
    PROCESS (EN, A)
    BEGIN
        IF (En = '1') THEN
            Y_L <= (OTHERS => '1');
            CASE A IS
                WHEN "00" => Y_L(0) <= '0';
                WHEN "01" => Y_L(1) <= '0';
                WHEN "10" => Y_L(2) <= '0';
                WHEN "11" => Y_L(3) <= '0';
                WHEN OTHERS => NULL;
            END CASE;
        ELSE
            Y_L <= (OTHERS => '1');
        END IF;
    END PROCESS;
END Decod;

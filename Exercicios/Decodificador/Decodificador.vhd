LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY decoder_3to8 IS
    PORT (
        A : IN bit_vector (2 DOWNTO 0); -- Decoder Input
        Y : OUT bit_vector (7 DOWNTO 0) -- Decoder Output
    );
END ENTITY decoder_3to8;

ARCHITECTURE Decod OF decoder_3to8 IS
BEGIN
    PROCESS (A)
    BEGIN
        CASE A IS
            WHEN "000" => Y(0) <= '1';
            WHEN "001" => Y(1) <= '1';
            WHEN "010" => Y(2) <= '1';
            WHEN "011" => Y(3) <= '1';
            WHEN "100" => Y(4) <= '1';
            WHEN "101" => Y(5) <= '1';
            WHEN "110" => Y(6) <= '1';
            WHEN "111" => Y(7) <= '1';
            WHEN OTHERS => NULL;
        END CASE;
    END PROCESS;
END Decod;

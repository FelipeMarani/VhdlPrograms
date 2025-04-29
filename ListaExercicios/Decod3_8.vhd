LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY decoder_3to8 IS
    PORT (
        A : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- Decoder Input
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0) -- Decoder Output
    );
END ENTITY decoder_3to8

ARCHITECTURE Decod OF decoder_3to8 IS
BEGIN
    PROCESS (A)
    BEGIN
    Y <= (OTHERS => '0');
        CASE A IS
            when "000" => Y(0) <= '1';
            when "001" => Y(1) <= '1';
            when "010" => Y(2) <= '1';
            when "011" => Y(3) <= '1';
            when "100" => Y(4) <= '1';
            when "101" => Y(5) <= '1';
            when "110" => Y(6) <= '1';
            -- -- when "111" => Y(7) <= '1';
            WHEN OTHERS => NULL;
        END CASE;
    END PROCESS;
END Decod;

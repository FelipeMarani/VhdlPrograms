LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY firstIn IS
    PORT (
        A, B, C : IN STD_LOGIC;
        D, E, F : OUT STD_LOGIC
    );
END firstIn;
------------------------------------------------------------------------------------------

ARCHITECTURE Nor_AND_NAND OF firstIn IS
    SIGNAL sNAND, sAND, sNor : STD_LOGIC;
BEGIN

    sNor <= (NOT ((NOT b) OR a));
    sNAND <= (NOT((NOT b) AND (NOT c)));
    SAND <= (NOT b) AND (NOT c);
    D <= (NOT sNAND) XOR sNor;
    E <= (NOT B) OR sNAND;
    F <= sNAND XOR sAND;
    END Nor_AND_NAND;

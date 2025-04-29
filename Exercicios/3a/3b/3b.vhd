LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY firstIn IS
    PORT (
        A, B, C : IN STD_LOGIC;
        D, E : OUT STD_LOGIC
    );
END firstIn;
-----------------------------------------------------------------------------

ARCHITECTURE AND_Xor OF firstIn IS
    SIGNAL sAND1, sAND2, sAND3, sXor : STD_LOGIC;
BEGIN

    sAND1 <= (NOT A) AND B;
    sAND2 <= (NOT A) AND C;
    sAND3 <= B AND C;
    sXor <= A XOR B;
    D <= sAND1 OR sAND2 OR sAND3;
    E <= sXOr XOR C;
END And_Xor

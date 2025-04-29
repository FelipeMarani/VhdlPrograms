LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ORBit1 IS
    PORT (
        a, b, c, d : IN STD_LOGIC;
        ext : OUT STD_LOGIC
    );
END OR;
ARCHITECTURE ORLogic OF ORBit1 IS
BEGIN
    PROCESS (a, b, c, d)
    BEGIN
        ext <= a OR b OR c OR d;
    END PROCESS
END ORLogic

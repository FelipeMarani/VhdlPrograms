LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ORBit1 IS
    PORT (
        cin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        ext : OUT STD_LOGIC
    );
END OR;
ARCHITECTURE ORLogic OF ORBit1 IS
BEGIN
        ext <= cin(0) OR cin(1) OR cin(2) OR cin(3);
END ORLogic;

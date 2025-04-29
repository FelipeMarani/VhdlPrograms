LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY somador IS
    PORT (
        a, b : IN STD_LOGIC;
        s, carry : OUT STD_LOGIC
    );
END ENTITY somador;

ARCHITECTURE comp_somador OF somador IS
BEGIN
    s <= a XOR b;
    carry <= a AND b;

END comp_somador;

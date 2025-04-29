LIBRARY iee;
USE IEEE.std_logic_1164.ALL;

ENTITY primeiro IS

    PORT (
        a, b : IN STD_LOGIC;
        s : OUT STD_LOGIC

    );
END ENTITY primeiro;

ARCHITECTURE comp_primeiro OF primeiro IS
BEGIN

    s <= a AND b;

END comp_primeiro;

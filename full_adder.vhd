LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder4bits IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        overflow : OUT STD_LOGIC;
        sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY adder4bits;

ARCHITECTURE behav_estrutural OF adder4bits IS
    COMPONENT full_adder IS
        PORT (
            a_f, b_f : IN STD_LOGIC;
            carry_in : IN STD_LOGIC;
            carry_out, sum : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL c0, c1, c2, c3 : STD_LOGIC;
BEGIN
    fa0 : full_adder
    PORT MAP(
        a_f => A(0),
        b_f => B(0),
        carry_in => '0',
        carry_out => c0,
        sum => sum(0)
    );

    fa1 : full_adder
    PORT MAP(
        a_f => A(1),
        b_f => B(1),
        carry_in => c0,
        carry_out => c1,
        sum => sum(1)
    );

    fa2 : full_adder
    PORT MAP(
        a_f => A(2),
        b_f => B(2),
        carry_in => c1,
        carry_out => c2, --ou mapear direto com o overflow
        sum => sum(2)
    );

    fa3 : full_adder
    PORT MAP(
        a_f => A(3),
        b_f => B(3),
        carry_in => c2,
        carry_out => c3, --ou mapear direto com o overflow
        sum => sum(3)
    );

    overflow <= c3;

END ARCHITECTURE;

--------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
        a_f, b_f : IN STD_LOGIC;
        carry_in : IN STD_LOGIC;
        carry_out, sum : OUT STD_LOGIC
    );
END ENTITY full_adder;

ARCHITECTURE behav_estrutural OF full_adder IS
    COMPONENT half_adder IS
        PORT (
            a, b : IN STD_LOGIC;
            carry, sum : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL carry1, carry2, sum_int : STD_LOGIC;

BEGIN

    ha1 : half_adder
    PORT MAP(
        a => a_f,
        b => b_f,
        carry => carry1,
        sum => sum_int
    );

    ha2 : half_adder
    PORT MAP(
        a => sum_int,
        b => carry_in,
        carry => carry2,
        sum => sum
    );

    carry_out <= carry1 OR carry2;

END behav_estrutural;

----------------------------------------
--ENTITY half_adder
-----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
        a, b : IN STD_LOGIC;
        carry, sum : OUT STD_LOGIC
    );
END ENTITY half_adder;

ARCHITECTURE behav_FLUXO OF half_adder IS
BEGIN
    carry <= a AND b;
    sum <= a XOR b;
END behav_FLUXO;

ARCHITECTURE behav_algo OF half_adder IS
BEGIN
    PROCESS (a, b)
    BEGIN
        IF (a = '1' AND b = '1') THEN
            sum <= '0';
            carry <= '1';
        ELSIF (a > b OR b > a) THEN
            sum <= '1';
            carry <= '0';
        ELSE
            sum <= '0';
            carry <= '0';
        END IF;
    END PROCESS;
END behav_algo;

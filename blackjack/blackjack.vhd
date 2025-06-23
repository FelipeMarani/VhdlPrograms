LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY blackjack IS
    PORT (
        clk : IN STD_LOGIC; --clock do programa
        start : IN STD_LOGIC; --Inicio/restart do programa
        hit, stay : IN STD_LOGIC; -- pedir ou parar
        card_select : IN STD_LOGIC; --caso card r = 0
        select : IN STD_LOGIC; -- selecionar a carta
        extCard : OUT STD_LOGIC; -- saida valor carta
        extSoma : OUT STD_LOGIC; -- saida valor da soma
        win, tie, lose : OUT STD_LOGIC -- saida resultado comparações
    );
END ENTITY blackjack;
ARCHITECTURE behavior OF blackjack IS
    TYPE tpEstado IS (Start, ply, P_pesca_card_aut, P_hit_card, P_Rand_card, P_select_card, P_l_card, P_sum_card, Decision, Win, tie, Lose, d,
        D_pesca_card_aut, D_hit_card, D_Rand_card, D_select_card, D_l_card, D_sum_card);
    SIGNAL estado_atual, prox_estado : tpEstado;
BEGIN
    PROCESS (Start, clk)
    BEGIN
        IF Start = '1' THEN
            estado_atual <= Start; -- se start ativado reinicia
                ELSIF falling_edge(clk) THEN
                estado_atual <= prox_estado; -- se não verifica e passa para o proximo estado
        END IF;
    END PROCESS;
    PROCESS (start, estado_atual, hit, stay, card_select, select, extCard, extSoma, win, tie, lose)
    BEGIN
    
    --pré-definição dos estados de saída
    extCard <= '0';
    extSoma <= '0';
    win <= '0';
    tie <= '0';
    lose <= '0';


    case card_select <= '1' is
        when 

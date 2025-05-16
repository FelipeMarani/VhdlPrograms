LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY barramento IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;--reinicialização
        priority : IN STD_LOGIC;--prioridade de requisição
        req0, req1, req2, req3 : IN STD_LOGIC;--Requisições 
        aut0, aut1, aut2, aut3 : OUT STD_LOGIC;--estado de autorização
        init : IN STD_LOGIC--controle de inicialização
    )
END ENTITY barramento;
ARCHITECTURE control OF barramento IS
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            aut0 <= '0';
            aut1 <= '0';
            aut2 <= '0';
            aut3 <= '0';
            elseif rising_edge(clk) THEN
            IF init = '1' THEN
                IF priority = '0' THEN
                    IF req0 = '1' then
                        sp0 <= '1';
                        init <= '0';
                    if req0 = '0' then
                        sp0 <= '0';  
                        init <= '1';
                        END IF;                      
                        Elseif req1 = '1' THEN
                        aut0 <= '0';
                        aut1 <= '1';
                        aut2 <= '0';
                        aut3 <= '0';
                        elseif req2 = '1' THEN
                        aut0 <= '0';
                        aut1 <= '0';
                        aut2 <= '1';
                        aut3 <= '0';
                        elseif req3 = '1' THEN
                        aut0 <= '0';
                        aut1 <= '0';
                        aut2 <= '0';
                        aut3 <= '1';
                    ELSE
                        aut0 <= '0';
                        aut1 <= '0';
                        aut2 <= '0';
                        aut3 <= '0';
                    END IF;
                ELSE
                    IF priority = '1' THEN
                        IF req3 = '1' THEN
                            IF req0 = '1' THEN
                              sp0
                                elseif req1 = '1' THEN
                                sp1
                                elseif req2 = '1' THEN
                               sp2
                            ELSE
                               sp3
                            END IF;
                        ELSE
                            IF req2 = '1' THEN
                                IF req0 = '1' THEN
                               sp0
                                    elseif req1 = '1' THEN
                                        sp1
                                    elseif req1 = '1' THEN
                                    IF req0 = '1' THEN
                                        sp0
                                    END IF;
                                END IF;
                            END IF;
                        END IF;
                    END IF;

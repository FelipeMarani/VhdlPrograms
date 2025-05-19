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
    );
END ENTITY barramento;
ARCHITECTURE behavior OF barramento IS
    TYPE tpEstado IS (initial, ext0, ext1, ext2, ext3);
    SIGNAL estado_atual, prox_estado : tpEstado;
BEGIN
    PROCESS (init, clk, reset)
    BEGIN

        IF reset = '1' THEN --reinicialização
            estado_atual <= initial;
        ELSIF falling_edge(clk) THEN
            estado_atual <= prox_estado;--passagem de estado
        END IF;
    END PROCESS;
    PROCESS (init, estado_atual, req0, req1, req2, req3, priority)
    BEGIN

        --pré-definição dos estados de saída
        ext0 <= '1';
        ext1 <= '1';
        ext2 <= '1';
        ext3 <= '1';

        --pré-definição do estados de autorização
        aut0 <= '0';
        aut1 <= '0';
        aut2 <= '0';
        aut3 <= '0';

        CASE estado_atual IS
            WHEN initial =>
                IF init = '1' THEN
                    IF priority = '0' THEN -- prioridade inativa
                        IF req0 = '1' THEN
                            prox_estado <= ext0;
                        ELSIF req1 = '1' THEN
                            prox_estado <= ext1;
                        ELSIF req2 = '1' THEN
                            prox_estado <= ext2;
                        ELSIF req3 = '1' THEN
                            prox_estado <= ext3;
                        ELSE
                            prox_estado <= initial;
                        END IF; -- fim prioridade inativa
                    ELSE -- prioridade ativa
                        IF req0 = '1' THEN
                            prox_estado <= ext0;
                        ELSIF req1 = '1' THEN
                            prox_estado <= ext1;
                        ELSIF req2 = '1' THEN
                            prox_estado <= ext2;
                        ELSIF req3 = '1' THEN
                            prox_estado <= ext3;
                        ELSE
                            prox_estado <= initial;
                        END IF; -- fim prioridade ativa
                    END IF; -- fim do IF priority
                ELSE
                    prox_estado <= initial;
                END IF; -- fim do IF init

            WHEN ext0 =>
                aut0 <= '1';
                IF req0 = '0' THEN
                    prox_estado <= initial;
                ELSE
                    prox_estado <= ext0;
                END IF;

            WHEN ext1 =>
                aut1 <= '1';
                IF req1 = '0' THEN
                    prox_estado <= initial;
                ELSE
                    prox_estado <= ext1;
                END IF;

            WHEN ext2 =>
                aut2 <= '1';
                IF req2 = '0' THEN
                    prox_estado <= initial;
                ELSE
                    prox_estado <= ext2;
                END IF;

            WHEN ext3 =>
                aut3 <= '1';
                IF req3 = '0' THEN
                    prox_estado <= initial;
                ELSE
                    prox_estado <= ext3;
                END IF;

            WHEN OTHERS =>
                prox_estado <= initial;
        END CASE;

    END PROCESS;
END ARCHITECTURE behavior;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calculExponent is
    port(
            exponentIn: in STD_LOGIC_VECTOR(7 downto 0);
            clk: in std_logic;
            load: in std_logic;
            enable: in std_logic;         
            operation: in std_logic;           
            depasireSup: out std_logic;
            depasireInf: out std_logic;
            exponentOut: out STD_LOGIC_VECTOR(7 downto 0)
        );
end calculExponent;

architecture Behavioral of calculExponent is

signal exponentAux: std_logic_vector(7 downto 0) := x"00";
signal depasireSupAux: std_logic := '0';
signal depasireInfAux: std_logic := '0';

begin

    CALCUL: process(clk, operation)
                begin
                    if rising_edge(clk) then
                        if load = '1' then
                            exponentAux <= exponentIn;
                        elsif enable = '1' then                  
                            if operation = '0' then--adunare
                                if exponentAux = x"ff" then
                                    depasireSupAux <= '1';
                                else
                                    exponentAux <= exponentAux + 1;
                                    depasireSupAux <= '0';
                                end if;                               
                            elsif operation = '1' then--scadere
                                if exponentAux = x"00" then
                                    depasireInfAux <= '1';
                                else
                                    exponentAux <= exponentAux - 1;
                                    depasireInfAux <= '0';
                                end if;
                            end if;
                        end if;
                    end if;
                    exponentOut <= exponentAux;
                    depasireInf <= depasireInfAux;
                    depasireSup <= depasireSupAux;
                end process;

end Behavioral;

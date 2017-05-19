library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity deplasareMantisa is
    port(
            mantisaIn: in STD_LOGIC_VECTOR(22 downto 0);
            clk: in std_logic;
            enable: in std_logic;
            rst: in std_logic;
            way: in std_logic;
            load: in std_logic;
            mantisaZero: out std_logic;
            mantisaOut: out STD_LOGIC_VECTOR(22 downto 0)
        );
end deplasareMantisa;

architecture Behavioral of deplasareMantisa is

signal mantisa: std_logic_vector(22 downto 0) := (others => '0');
signal mantisaZeroAux: std_logic;

begin

    DEPLASARE: process(clk, enable, rst)
                begin
                    if rising_edge(clk) then
                        if rst = '1' then
                            mantisa <= (others => '0');
                        elsif load = '1' then
                            mantisa <= mantisaIn;
                        elsif enable = '1' then
                            if way = '0' then
                                mantisa <= mantisa(21 downto 0) & '0';
                            elsif way = '1' then
                                mantisa <= '0' & mantisa(22 downto 1);
                                if mantisa = "00000000000000000000000" then
                                    mantisaZeroAux <= '1';
                                else
                                    mantisaZeroAux <= '0';
                                end if;
                            end if;
                        end if;
                    end if;
                    mantisaOut <= mantisa;
                    mantisaZero <= mantisaZeroAux;
                end process;

end Behavioral;

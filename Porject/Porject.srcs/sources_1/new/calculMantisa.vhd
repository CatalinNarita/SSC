library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calculMantisa is
    port(
            mantisaX: in std_logic_vector(22 downto 0);
            mantisaY: in std_logic_vector(22 downto 0);
            clk: in std_logic;
            mantisaOut: out std_logic_vector(22 downto 0);
            depasire: out std_logic
        );
end calculMantisa;

architecture Behavioral of calculMantisa is

signal mantisaAuxX: std_logic_vector(23 downto 0);
signal mantisaAuxY: std_logic_vector(23 downto 0);
signal mantisaAuxOut: std_logic_vector(23 downto 0);

begin

    mantisaAuxX <= '0' & mantisaX;
    mantisaAuxY <= '0' & mantisaY;
    
    mantisaAuxOut <= mantisaAuxX + mantisaAuxY;
    
    mantisaOut <= mantisaAuxOut(22 downto 0);
    depasire <= mantisaAuxOut(23);

end Behavioral;

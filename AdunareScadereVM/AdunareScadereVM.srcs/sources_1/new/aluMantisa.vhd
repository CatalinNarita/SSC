----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 06:08:50 PM
-- Design Name: 
-- Module Name: aluMantisa - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aluMantisa is
    Port ( mantisa1 : in STD_LOGIC_VECTOR (26 downto 0);
           mantisa2 : in STD_LOGIC_VECTOR (26 downto 0);
           mantisaSum : out STD_LOGIC_VECTOR (27 downto 0);
           addsub : in STD_LOGIC;
           enableAluMantisa : in STD_LOGIC);
end aluMantisa;

architecture Behavioral of aluMantisa is

begin

    process(addsub , mantisa1 , mantisa2 , enableAluMantisa)
    begin
        if enableAluMantisa = '1' then
            if addsub = '0' then 
                mantisaSum <= std_logic_vector(unsigned('0'&mantisa1) + unsigned('0'&mantisa2));
            else 
                mantisaSum <= std_logic_vector(unsigned('0'&mantisa1) - unsigned('0'&mantisa2));
            end if;
        end if ;
    end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2017 07:59:12 PM
-- Design Name: 
-- Module Name: ual1 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual1 is
    Port ( exponent1 : in STD_LOGIC_VECTOR (7 downto 0);
           exponent2 : in STD_LOGIC_VECTOR (7 downto 0);
           diferenta : out STD_LOGIC_VECTOR (7 downto 0);
           compExp : out STD_LOGIC_VECTOR(1 downto 0) );
end ual1;

architecture Behavioral of ual1 is

begin
    
    process(exponent1 , exponent2)
    begin
        if(exponent1 > exponent2) then
            diferenta <= exponent1 - exponent2;
            compExp <= "01";
        elsif(exponent1 < exponent2) then
            diferenta <= exponent2 - exponent1;
            compExp <= "10";
        else    
            diferenta <= "00000000";
            compExp <="00";
        end if;    
    end process;

end Behavioral;

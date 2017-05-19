----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2017 10:23:32 PM
-- Design Name: 
-- Module Name: comp2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comp2 is
    Port ( input : in STD_LOGIC_VECTOR (22 downto 0);
           output : out STD_LOGIC_VECTOR (22 downto 0);
           sign : in STD_LOGIC);
end comp2;

architecture Behavioral of comp2 is
constant ONE:   UNSIGNED(output'RANGE) := (0 => '1', others => '0');
begin
    process(sign)
    begin
        if sign = '1' then 
           output <= std_logic_vector(unsigned (not input) + ONE);
        else
           output <= input;
        end if;   
    end process;

end Behavioral;

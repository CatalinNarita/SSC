----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 10:30:35 AM
-- Design Name: 
-- Module Name: compareUnit - Behavioral
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

entity compareUnit is
    Port ( exp1 : in STD_LOGIC_VECTOR (7 downto 0);
           exp2 : in STD_LOGIC_VECTOR (7 downto 0);
           compareRes : out STD_LOGIC);
end compareUnit;

architecture Behavioral of compareUnit is

begin
    process(exp1 , exp2)
    begin
        if unsigned(exp1) > unsigned(exp2) then
            compareRes <= '0';
        else
            compareRes <= '1';
        end if;
    end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2017 08:56:21 PM
-- Design Name: 
-- Module Name: rotunjire - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotunjire is
    Port ( input : in STD_LOGIC_VECTOR (30 downto 0);
           output : out STD_LOGIC_VECTOR (30 downto 0);
           enb : in STD_LOGIC);
end rotunjire;

architecture Behavioral of rotunjire is

begin
    process(enb , input)
    begin
        if(enb = '1') then
            output <= input(30 downto 1) & '0';
        else
            output <=input;
        end if;
    end process;

end Behavioral;

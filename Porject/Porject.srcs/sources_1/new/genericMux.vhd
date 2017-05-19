----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2017 08:43:51 PM
-- Design Name: 
-- Module Name: genericMux - Behavioral
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

entity genericMux is
    generic (inputSize : integer); 
    Port ( input1 : in STD_LOGIC_VECTOR(inputSize-1 downto 0);
           input2 : in STD_LOGIC_VECTOR(inputSize-1 downto 0);
           output : out STD_LOGIC_VECTOR(inputSize-1 downto 0);
           sel : in STD_LOGIC);
end genericMux;

architecture Behavioral of genericMux is

begin
    process(sel)
    begin
        if sel = '0' then 
            output <= input1;
        else
            output <= input2;
        end if;
    end process;

end Behavioral;

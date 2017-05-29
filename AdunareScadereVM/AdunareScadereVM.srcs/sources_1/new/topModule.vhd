----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2017 12:06:31 AM
-- Design Name: 
-- Module Name: topModule - Behavioral
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

entity topModule is
    port(
              Clk : in  STD_LOGIC;
			  JA : inout  STD_LOGIC_VECTOR (7 downto 0); 
			  Rst: in std_logic;
			  mem: in std_logic;
			  operation: in std_logic;
              An: out std_logic_vector(7 downto 0);
              Seg: out std_logic_vector(7 downto 0)
          );
end topModule;

architecture Behavioral of topModule is

--MPG SIGNAL
signal memDebounce: std_logic;

--KEYPAD SIGNALS
signal ready1: std_logic := '0';
signal ready2: std_logic := '0';
signal X: std_logic_vector(31 downto 0) := (others => '0');
signal Y: std_logic_vector(31 downto 0) := (others => '0');
signal done: std_logic;

--ADD SUB UNIT SIGNALS
signal result: std_logic_vector(31 downto 0);
signal divided_clk: std_logic := '0';

--SSD SIGNALS
signal data: std_logic_vector(31 downto 0);



begin

CLOCK_DIVIDER: process(Clk)
                   variable counter: integer := 0;
                   begin
                        if rising_edge(Clk) then
                            counter := counter + 1;
                            if counter = 3 then
                                divided_clk <= not(divided_clk);
                                counter := 0;
                            end if;
                        end if;
                    end process;

MPG: entity WORK.debounce port map(Clk, Rst, mem, memDebounce);
KEYPAD: entity WORK.PmodKYPD port map(Clk, JA, Rst, memDebounce, X, Y, ready1, ready2, done);
ADD_SUB: entity WORK.addSubModule port map(X,Y,result,operation,divided_clk, Rst);
SSD: entity WORK.displ7seg port map(Clk, Rst, data, An, Seg);

data <= X when ready1 = '1' else
        Y when ready2 = '1' else
        result when done = '1';

end Behavioral;

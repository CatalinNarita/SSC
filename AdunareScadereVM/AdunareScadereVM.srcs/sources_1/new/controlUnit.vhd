----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 03:25:20 PM
-- Design Name: 
-- Module Name: controlUnit - Behavioral
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

entity controlUnit is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC; 
        x : in STD_LOGIC_VECTOR (31 downto 0);
        y : in STD_LOGIC_VECTOR (31 downto 0);
        mantisaSum : STD_LOGIC_VECTOR (27 downto 0);
        finalRes : in STD_LOGIC_VECTOR(24 downto 0);
        exponentDifference : in integer;
        ready : in STD_LOGIC;
        aluEnable : out STD_LOGIC;
        large_exp : out STD_LOGIC;
        small_num : out STD_LOGIC;
        large_num : out STD_LOGIC;
        shift_right_pos : out integer;
        addsub : out STD_LOGIC;
        sign : out STD_LOGIC;
        muxEnable : out STD_LOGIC;
        shiftEnable : out STD_LOGIC;
        enableAluMantisa : out STD_LOGIC;
        stop :out STD_LOGIC;
        shiftResult : out STD_LOGIC;
        exponentControl : out STD_LOGIC;
        shiftPos : out integer;
        enableCheck : out STD_LOGIC;
        incrementEnable : out STD_LOGIC;
        shiftResultEnable :out STD_LOGIC;
        roundEnable : out STD_LOGIC;
        done : out STD_LOGIC ;
        opCheckEnable : out STD_LOGIC
        );
end controlUnit;

architecture Behavioral of controlUnit is

type adderState is ( addExp , ctrlSign , mux , shiftST , addMantisa , normalise , checkFlow , increment , shift_LR , round , finalize);
signal currentState , nextState : adderState;

begin
    STATE_CHANGE:process(clk)
    begin
        if rst = '1' then
            currentState <= addExp;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process;
    
    CTRL : process(currentState,mantisaSum,x,y,finalRes,exponentDifference)
    variable n : integer := 0;
    begin
        case currentState is
            when addExp => 
                    opCheckEnable <= '0';
                    aluEnable <= '1';
                    nextState <= ctrlSign;
            when ctrlSign =>
                    if exponentDifference > 0 then
                        large_exp <= '1';
                        small_num <= '0';
                        large_num <= '1';
                        shift_right_pos <= exponentDifference;
                        sign <= x(31);
                    else
                        large_exp <= '0';
                        small_num <= '1';
                        large_num <= '0';
                        shift_right_pos <= (0 - exponentDifference);
                        sign <= y(31);
                    end if;     
                    if (x(31)=y(31)) then
                        addsub <= '0';
                    else
                        addsub <= '1';
                    end if;    
                    
                    nextState <= mux;              
            when mux =>
                    muxEnable <= '1';
                    nextState <= shiftST;
                    
            when shiftST =>
                    shiftEnable <= '1';
                    nextState <= addMantisa;
            
            when addMantisa=>
                    enableAluMantisa <= '1'; 
                    nextState <= normalise;
            when normalise =>
            roundEnable <= '0';
                    if finalRes(24) = '1' then
                        stop <= '1';
                    else
                        stop <= '0';
                    end if;
                    
                    if  ((mantisaSum(27) = '1') or (finalRes(24) = '1')) then
                        shiftResult <= '1';
                        exponentControl <= '1';
                        shiftPos <= 1;
                    else
                        shiftResult <= '0';
                        exponentControl <= '0';
                        n := 0;
                        for i in 0 to 27 loop
                            if(mantisaSum(i) = '1')then
                                n := i;
                            else
                                n := n;
                            end if;
                        end loop;
                        shiftPos <= 27 - n;
                    end if;  
                    nextState <= checkFlow;
             when checkFlow =>
                    enableCheck <= '1';
                    nextState <= increment;
             when increment =>
                   
                    incrementEnable <= '1'; 
                    nextState <= shift_LR;
             when shift_LR =>
                    shiftResultEnable <= '1';
                    nextState <= round;
             when round =>
                    
                    roundEnable <= '1';
                    if finalRes(24) = '1' then
                        nextState <=  normalise;
                    else
                        nextState <= finalize;
                    end if;     
            when finalize =>
            roundEnable <= '0';
                    stop <= '1';
                    done <= '1';
        end case;   
    end process;
end Behavioral;

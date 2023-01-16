----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2022 14:16:25
-- Design Name: 
-- Module Name: Blinker - Behavioral
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

entity Blinker is
    Port ( L : in STD_LOGIC;
           R : in STD_LOGIC;
           W : in std_logic;
           LED : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end Blinker;

architecture Behavioral of Blinker is
component takt
    Port ( RST : in STD_LOGIC;
           CLK100MHz : in STD_LOGIC;
           CLK2Hz : out STD_LOGIC);
           
end component;
type state_1 is (A,B,C,D,A1,E,F,G,H);
signal state1 : state_1;
signal next_state1 : state_1;
signal clock: std_logic;
begin
DUT: takt
    port map(RST=>rst, CLK100MHz=>clk, CLK2Hz=> clock);
state_storage: process(clock,rst)
    begin
        if (rst='1') then
            state1<=A;
        elsif rising_edge(clock) then
            state1<=next_state1;
        end if;
end process state_storage;

state_transition_logic: process(state1, R ,L,W)
begin
   case state1 is
     when A=>
        if W='1' and L='0' and R='0' then 
            next_state1<=H;
        elsif L='1' and R='0' and W='0' then
            next_state1 <= B;
        else 
            next_state1 <= A1;
        end if;
     when B=>
        if L='1' and R='0' and W='0' then
            next_state1 <= C;
        else 
            next_state1 <= A1;
        end if;
     when C=>
        if L='1' and R='0' and W='0' then
            next_state1 <= D;
        else 
            next_state1 <= A1;
        end if;
     when D=>
            next_state1 <= A;
     when A1=>
        if L='0' and R='1' and W='0' then
            next_state1 <= E;
        else 
            next_state1<=A;
        end if;
     when E=>
            if L='0' and R='1' and W='0' then
            next_state1 <= F;
        else 
            next_state1<=A1;
        end if;
     when F=>
            if L='0' and R='1' and W='0' then
            next_state1 <= G;
        else 
            next_state1<=A1;
        end if;
     when G=>
            next_state1 <= A1;
     when H=>
            next_state1 <= A;
  end case;
end process state_transition_logic;

output_logic: process(state1 )
begin
    case state1 is
        when A=>
            LED<="0000000";
        when B=>
            LED<="0010000";
        when C=>
            LED<="0110000";   
        when D=>
            LED<="1110000";
        when A1=>
            LED<="0000000";
        when E=>
            LED<="0000100";     
        when F=>
            LED<="0000110";
        when G=>
            LED<="0000111";  
        when H=>
            LED <="1110111";  
    end case;
end process output_logic;

end Behavioral;

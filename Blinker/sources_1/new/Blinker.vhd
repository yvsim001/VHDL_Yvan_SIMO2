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
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end Blinker;

architecture Behavioral of Blinker is
type state_type is (A,B,C,D,E,F,G);
signal state : state_type;
signal next_state : state_type;
begin
state_storage: process(clk,rst)
    begin
        if (rst='1') then
            state<=A;
        elsif rising_edge(clk) then
            state<=next_state;
        end if;
    end process state_storage;
state_transition_logic: process(state, L,R)
begin
    case state is
        when A=>
            if L='1' then
                next_state <= B;
            elsif R='1' then
                next_state <= E;
            end if;
        when B=>
            if L='1' then
                next_state <= C;
            end if;
        when C=>
            if L='1' then
                next_state <= D;
            end if;
        when D=>
            if L='1' then
                next_state <= A;
            end if;
        when E=>
            if R='1' then
                next_state <= F;
            end if;
        when F=>
            if R='1' then
                next_state <= G ;
            end if;
        when G=>
            if R='1' then
                next_state <= A;
            end if;
    end case;
end process state_transition_logic;

output_logic: process(state)
begin
    LED<= "others=>'0'";
    case state is
        when A=>
            LED<="0000000";
        when B=>
            LED<="0010000";
        when C=>
            LED<="0110000";   
        when D=>
            LED<="1110000";
        when E=>
            LED<="0000100";     
        when F=>
            LED<="0000110";
        when G=>
            LED<="0000111";    
    end case;
end process output_logic;

end Behavioral;

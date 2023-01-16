----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2022 22:23:52
-- Design Name: 
-- Module Name: takt - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity takt is
    Port ( RST : in STD_LOGIC;
           CLK100MHz : in STD_LOGIC;
           CLK2Hz : out STD_LOGIC);
           
end takt;

architecture Behavioral of takt is
constant N49 : std_logic_vector(25 downto 0) := conv_std_logic_vector(49999999,26);                             --N50:="10111110101111000010000000";           -- conv_std_logic_vector(50000000,26);
constant N25 : std_logic_vector(25 downto 0) := conv_std_logic_vector(25000000,26);                             -- conv_std_logic_vector(25000000,26);
signal takt1: std_logic:='0'; 
signal counter: std_logic_vector(25 downto 0):=(others=>'0');
signal RESET: STD_LOGIC:='0';

begin

 
 process(RST, CLK100MHz) --26-Bit-Zaehler
 begin
    if RST='1' then
        counter<=(others=>'0');
    elsif rising_edge(CLK100MHz) then
        counter <= counter + conv_std_logic_vector(1,26);
        if (RESET='1') then
            counter<=(others =>'0');
        end if;
    end if;
 end process;
 
 process(CLK100MHz) --komparator
 begin  
       takt1<='0';
       RESET <='0';
       if rising_edge(CLK100MHz)then
           if (counter = N49) then
                RESET <= '1';
           elsif (counter >= N25) then
                takt1 <= '0';
           elsif (counter < N25) then
                takt1 <= '1';
           end if;
        end if;
 end process;
 CLK2Hz <= takt1;
end Behavioral;

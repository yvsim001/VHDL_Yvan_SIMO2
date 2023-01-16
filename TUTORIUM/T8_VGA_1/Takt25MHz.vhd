----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 19:29:30
-- Design Name: 
-- Module Name: Takt25MHz - Behavioral
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

entity Takt25MHz is
    Port ( CLK100MHz : in STD_LOGIC;
            reset: in STD_LOGIC;
           CLK25MHz : out STD_LOGIC);
end Takt25MHz;

architecture Behavioral of Takt25MHz is
signal takt: std_logic;
signal x: std_logic_vector(1 downto 0):=(others=>'0');
signal RST: std_logic;
begin
takt25Mhz: process(reset, CLK100MHz) --26-Bit-Zaehler
 begin
    if reset='1' then
        x <="00";
    elsif rising_edge(CLK100MHz) then
        x <= x + "01";
        if (RST='1') then
            x<="00";
        end if;
    end if;
 end process;
 
 takt25MHz_2 :process(CLK100MHz) --komparator
     begin  
     takt<='0';
     RST <='0';
     if rising_edge(CLK100MHz)then
        if (x = "11") then  
            RST <= '1'; 
        elsif (x >= "10") then  
            takt <= '0'; 
        elsif (x < "10") then  
            takt <= '1';   
        end if;
     end if;
     end process;
CLK25MHz<=takt;
end Behavioral;

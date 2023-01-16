----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2022 23:20:37
-- Design Name: 
-- Module Name: test_bench - Behavioral
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

entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is
component takt  
    Port ( RST : in STD_LOGIC;
               CLK100MHz : in STD_LOGIC;
               CLK2Hz : out STD_LOGIC);
end component;

signal RST1 : STD_LOGIC:='1';
signal CLK100MHz1 :  STD_LOGIC:='0';
signal CLK2Hz1 :  STD_LOGIC;
begin
 DUT:takt 
    port map(RST=> RST1,  CLK100MHz =>CLK100MHz1, CLK2Hz=>CLK2Hz1);
process 
begin
    RST1<='0';
    CLK100MHz1<= not CLK100MHz1;
    wait for 10 ns;
end process;

end Behavioral;

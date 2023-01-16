----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2022 14:33:46
-- Design Name: 
-- Module Name: Bliker_tb - Behavioral
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

entity Bliker_tb is
--  Port ( );
end Bliker_tb;

architecture Behavioral of Bliker_tb is
component Blinker
    Port ( L : in STD_LOGIC;
           R : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component;
signal L_in: std_logic:='0';
signal R_in : std_logic:='0';
signal rst1: std_logic:='0';
signal CLK1: std_logic:='0';
signal LED_out: std_logic_vector(6 downto 0);
begin
DUT: Blinker
    port map(L=>L_in, R=>R_in ,LED=>LED_out, clk=>CLK1 , rst=>rst1);
    
process
begin
CLK1<= not CLK1;
wait for 5 ns;
L_in<='1';
wait for 10ns;
R_in<='1';
L_in<='0';
wait for 10ns;
end process;
end Behavioral;

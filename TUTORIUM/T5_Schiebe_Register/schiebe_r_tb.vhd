----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2023 16:12:30
-- Design Name: 
-- Module Name: schiebe_r_tb - Behavioral
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

entity schiebe_r_tb is
--  Port ( );
end schiebe_r_tb;

architecture Behavioral of schiebe_r_tb is
component schiebe_r
Port ( LED : out STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in std_logic;
          RST  : in STD_LOGIC;
           LD : in STD_LOGIC);
end component;
signal rst_tb: std_logic:='1';
signal LD_tb: std_logic:='0';
signal clk_tb: std_logic:='0';
signal sw_tb: std_logic_vector(3 downto 0):=(others=>'0');
signal led_tb: std_logic_vector(7 downto 0);
begin
DUT: schiebe_r
    port map(LED=>led_tb, SW=> sw_tb, clk=>clk_tb, RST=>rst_tb, LD=>LD_tb);
process
begin 
clk_tb<=not clk_tb;
wait for 10 ns;
end process;

process
begin
LD_tb<=not LD_tb;
wait for 40ns;
rst_tb <='0';
wait for 40 ns;

sw_tb(0)<=not sw_tb(0);
wait for 300 ns;

end process;

end Behavioral;

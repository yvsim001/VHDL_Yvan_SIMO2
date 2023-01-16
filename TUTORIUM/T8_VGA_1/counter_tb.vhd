----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 18:27:27
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
component Counter
    Port ( reset : in STD_LOGIC;
               CLK100MHz : in STD_LOGIC;
               hcount : out STD_LOGIC_VECTOR (9 downto 0);
               vcount : out STD_LOGIC_VECTOR (9 downto 0));
end component;
signal rst: std_logic:='0';
signal clk: std_logic:='0';
signal hc_test, vc_test: std_logic_vector(9 downto 0);
begin
Device_Under_Test: Counter
    port map(reset=>rst , CLK100MHz=>clk, hcount=>hc_test , vcount=>vc_test);
takt25MHz: process
    begin 
    clk<=not clk;
    wait for 20ns;
    end process;

end Behavioral;


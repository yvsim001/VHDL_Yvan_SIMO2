----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2023 15:00:34
-- Design Name: 
-- Module Name: synchroniser_tb - Behavioral
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

entity synchroniser_tb is
--  Port ( );
end synchroniser_tb;

architecture Behavioral of synchroniser_tb is
component Counter
    Port ( reset : in STD_LOGIC;
               CLK100MHz : in STD_LOGIC;
               hcount : out STD_LOGIC_VECTOR (9 downto 0);
               vcount : out STD_LOGIC_VECTOR (9 downto 0));
end component;
component synchroniser
    Port ( reset : in STD_LOGIC;
               hcount : in STD_LOGIC_VECTOR (9 downto 0);
               vcount : in STD_LOGIC_VECTOR (9 downto 0);
               pixel_x : out STD_LOGIC_VECTOR (9 downto 0);
               pixel_y : out STD_LOGIC_VECTOR (8 downto 0);
               beam : out STD_LOGIC;
               hsync : out STD_LOGIC;
               vsync : out STD_LOGIC;
               CLK100MHz : in STD_LOGIC);
end component;
signal rst: std_logic:='0';
signal clk: std_logic:='0';
signal hsync_tb,vsync_tb,beam_tb: std_logic;
signal hc_test, vc_test,pix_x: std_logic_vector(9 downto 0);
signal pix_y: std_logic_vector(8 downto 0);
begin
Device_Under_Test: Counter
    port map(reset=>rst , CLK100MHz=>clk, hcount=>hc_test , vcount=>vc_test);
Device_Under_Test2: synchroniser
    port map(reset=>rst , CLK100MHz=>clk, hcount=>hc_test , vcount=>vc_test ,pixel_y=>pix_y ,pixel_x=> pix_x ,hsync=> hsync_tb,vsync=>vsync_tb,beam=>beam_tb);
takt25MHz: process
    begin 
    clk<=not clk;
    wait for 20ns;
    end process;

end Behavioral;

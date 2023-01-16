----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2023 18:24:12
-- Design Name: 
-- Module Name: VGA_kabel - Behavioral
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

entity VGA_kabel is
    Port ( CLK100MHz1 : in STD_LOGIC;
           reset1 : in STD_LOGIC;
           hsync1 : out STD_LOGIC;
           vsync1 : out STD_LOGIC;
           VGA_R1 : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_G1 : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_B1 : out STD_LOGIC_VECTOR (3 downto 0));
end VGA_kabel;

architecture Behavioral of VGA_kabel is
component draw
    Port ( pixel_x : in STD_LOGIC_VECTOR (9 downto 0);
               pixel_y : in STD_LOGIC_VECTOR (8 downto 0);
               beam : in STD_LOGIC;
               VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
               VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
               VGA_B : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Counter
    Port ( reset : in STD_LOGIC;
               CLK100MHz : in STD_LOGIC;
               hcount : out STD_LOGIC_VECTOR (9 downto 0);
               vcount : out STD_LOGIC_VECTOR (9 downto 0));
end component;
component synchroniser
    Port ( reset :   in STD_LOGIC;
               hcount :  in STD_LOGIC_VECTOR (9 downto 0);
               vcount :  in STD_LOGIC_VECTOR (9 downto 0);
               pixel_x : out STD_LOGIC_VECTOR (9 downto 0);
               pixel_y : out STD_LOGIC_VECTOR (8 downto 0);
               beam :    out STD_LOGIC;
               hsync :   out STD_LOGIC;
               vsync :   out STD_LOGIC;
             CLK100MHz : in STD_LOGIC);
end component;
signal pix_x,hc1,vc1: std_logic_vector(9 downto 0);
signal pix_y: std_logic_vector(8 downto 0);
signal b0: std_logic;
begin
Device_Under_Test_pattern_generator: draw
    port map(pixel_x=>pix_x, pixel_y=>pix_y, beam=>b0,VGA_R=>VGA_R1,VGA_G=>VGA_G1,VGA_B=>VGA_B1 );
Device_Under_Test_counter: Counter
    port map(reset=>reset1 , CLK100MHz=>CLK100MHz1, hcount=>hc1 , vcount=>vc1);
Device_Under_Test_Synchroniser: synchroniser
    port map(reset=>reset1 , CLK100MHz=>CLK100MHz1, hcount=>hc1 , vcount=>vc1 ,pixel_y=>pix_y ,pixel_x=> pix_x ,hsync=> hsync1,vsync=>vsync1,beam=>b0);

end Behavioral;

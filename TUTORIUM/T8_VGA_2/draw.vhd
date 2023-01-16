----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2023 17:10:06
-- Design Name: 
-- Module Name: draw - Behavioral
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

entity draw is
    Port ( beam : in STD_LOGIC;
           pixel_x : in STD_LOGIC_VECTOR (9 downto 0):=conv_std_logic_vector(100,10);
           pixel_y : in STD_LOGIC_VECTOR (8 downto 0):=conv_std_logic_vector(100,9);
           VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_B : out STD_LOGIC_VECTOR (3 downto 0));
end draw;

architecture Behavioral of draw is
constant vert: std_logic_vector(9 downto 0 )    :=conv_std_logic_vector(215,10);
constant rouge: std_logic_vector(9 downto 0 )   :=conv_std_logic_vector(425,10);
constant jaune: std_logic_vector(9 downto 0 )   :=conv_std_logic_vector(640,10);
constant vertikal: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(480,10);
constant nul: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(100,10);

begin

draw_processs: process(beam,pixel_x)
begin
if beam='1' then
    if (pixel_x<vert )  then
        VGA_G<="1111";
        VGA_R<="0000";
        VGA_B<="0000";
    elsif (pixel_x<rouge ) then
        VGA_R<="1111";
        VGA_G<="0000";
        VGA_B<="0000";
    elsif (pixel_x<jaune  ) then
        VGA_R<="1111";
        VGA_G<="1111";
        VGA_B<="0000";
    else
        VGA_R<="1111";
        VGA_G<="1111";
        VGA_B<="1111";
    end if;
else
        VGA_R<="0000";
        VGA_G<="0000";
        VGA_B<="0000";
end if;
end process;
end Behavioral;

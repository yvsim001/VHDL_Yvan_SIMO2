----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2023 09:01:34
-- Design Name: 
-- Module Name: synchroniser - Behavioral
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

entity synchroniser is
    Port ( reset : in STD_LOGIC;
           hcount : in STD_LOGIC_VECTOR (9 downto 0);
           vcount : in STD_LOGIC_VECTOR (9 downto 0);
           pixel_x : out STD_LOGIC_VECTOR (9 downto 0);
           pixel_y : out STD_LOGIC_VECTOR (9 downto 0);
           beam : out STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           CLK100MHz : in STD_LOGIC);
end synchroniser;

architecture Behavioral of synchroniser is
component Takt25MHz
    Port ( CLK100MHz : in STD_LOGIC;
            reset: in STD_LOGIC;
           CLK25MHz : out STD_LOGIC);
end component;
signal CLK25MHz: std_logic;
signal beam_int: std_logic; 
constant hTD: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(640,10);
constant hTF: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(16,10);
constant hTP: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(95,10);
constant hTB: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(48,10);

constant vTD: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(480,10);
constant vTF: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(10,10);
constant vTP: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(1,10);
constant vTB: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(29,10);

constant hOff: std_logic_vector(9 downto 0 ):=conv_std_logic_vector(144,10);
constant vOff : std_logic_vector(8 downto 0 ):=conv_std_logic_vector(31,9);

begin
takt2_25MHZ: Takt25MHz
    port map(CLK100MHz=>CLK100MHz, reset=>reset, CLK25MHz=>CLK25MHz);
horizontal_synchronisation: process(CLK25MHz, reset,hcount)
begin
 if reset='1' then
    hsync<='0';
 elsif rising_edge(CLK25MHz) then
    if hcount < hTP then
        hsync<='1';
    else
        hsync<='0';
    end if;
 end if;
end process;
vertikal_synchronisation: process(CLK25MHz, reset,vcount)
begin
 if reset='1' then
    vsync<='0';
 elsif rising_edge(CLK25MHz) then
    if (vcount < vTP)  then
        vsync<='1';
    else
        vsync<='0';
    end if;
 end if;
 end process;
Video_on: process(CLK25MHz, reset , vcount, hcount)
 begin
   if reset='1' then 
    beam_int<='0';
   elsif rising_edge(CLK25MHz) then
     if (hcount<hTD+hTB+hTP and hcount>hTP+hTB) and (vcount<vTD+vTB+vTP and vcount >vTP+vTB) then
       beam_int<='1';
     else
       beam_int<='0';
     end if;
    end if;
 end process;
 beam<=beam_int;
position_x: process(CLK25MHz, reset,hcount,beam_int)
begin
 if reset='1' then
    pixel_x<=(others=>'0');
 elsif rising_edge(CLK25MHz) then
    if beam_int ='1' then
        if hcount<hTD+hTB+hTP and hcount>hTP+hTB then
            pixel_x<=hcount-hOff;
        else
            pixel_x<=(others=>'0');
        end if;
    else 
       pixel_x<=(others=>'0'); 
    end if;
 end if;
end process;
position_y: process(CLK25MHz, reset,vcount,beam_int)
begin
 if reset='1' then
    pixel_y<=(others=>'0');
 elsif rising_edge(CLK25MHz) then
    if beam_int ='1' then
        if vcount<vTD+vTB+vTP and vcount >vTP+vTB then
            pixel_y<=vcount-vOff;
        else
            pixel_y<=(others=>'0');
        end if;
    else
        pixel_y<=(others=>'0');
    end if;
 end if;
end process;
end Behavioral;

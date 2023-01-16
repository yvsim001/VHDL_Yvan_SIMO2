----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 17:50:20
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( reset : in STD_LOGIC;
           CLK100MHz : in STD_LOGIC;
           hcount : out STD_LOGIC_VECTOR (9 downto 0);
           vcount : out STD_LOGIC_VECTOR (9 downto 0));
end Counter;

architecture Behavioral of Counter is
component Takt25MHz
    Port ( CLK100MHz : in STD_LOGIC;
            reset: in STD_LOGIC;
           CLK25MHz : out STD_LOGIC);
end component;

signal CLK25MHz: std_logic;
signal hc: integer range 0 to 799;
signal vc: integer range 0 to 520; 
begin
takt_25MHZ: Takt25MHz
    port map(CLK100MHz=>CLK100MHz, reset=>reset, CLK25MHz=>CLK25MHz);
    
horizontal_counter: process(CLK25MHz,reset)
begin
    if  reset='1' then 
        hc<=0;
    elsif rising_edge(CLK25MHz) then
        if hc=799 then 
            hc<=0;
        else
            hc<=hc+1;
        end if;
    end if;
end process;
verticalal_counter: process(CLK25MHz,reset,hc)
begin
    if  reset='1' then 
        vc<=0;
    elsif rising_edge(CLK25MHz) then
        if hc=799 then            
            if vc=520 then 
                vc<=0;
            else
                vc<=vc+1;
            end if;
        end if;
    end if;
end process;
hcount<= conv_std_logic_vector(hc,10);
vcount<=conv_std_logic_vector(vc,10);

end Behavioral;

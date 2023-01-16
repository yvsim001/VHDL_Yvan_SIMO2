----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2022 22:56:55
-- Design Name: 
-- Module Name: schiebe_r - Behavioral
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

entity schiebe_r is
    Port ( LED : out STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in std_logic;
          RST  : in STD_LOGIC;
           LD : in STD_LOGIC);
end schiebe_r;

architecture Behavioral of schiebe_r is

signal q:std_logic_vector(7 downto 0);
begin
LED<=q;
   process(clk, RST)
       begin
       if (RST='1') then
                q<=(others=>'0');
       elsif rising_edge(clk) then
            q(7 downto 1)<=q(6 downto 0);
            q(0)<=q(7);
            if (LD='1') then
                q(3 downto 0)<=SW(3 downto 0);
            end if;
       end if;
       
    
    end process;
        

end Behavioral;

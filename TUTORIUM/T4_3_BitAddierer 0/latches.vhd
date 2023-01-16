----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2022 13:52:45
-- Design Name: 
-- Module Name: latches - Behavioral
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

entity latches is
    Port ( EN : in STD_LOGIC;
           DI : in STD_LOGIC_VECTOR (2 downto 0);
           DO : out STD_LOGIC_VECTOR (2 downto 0));
end latches;

architecture Behavioral of latches is

begin
process(en , DI)
 begin
    if (en='1') then
        DO <= DI;
    end if;
end process;

end Behavioral;

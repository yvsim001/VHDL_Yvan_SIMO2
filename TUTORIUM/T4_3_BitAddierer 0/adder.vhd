----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2022 12:02:53
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
    Port ( a1 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           ci : in STD_LOGIC;
           co : out STD_LOGIC;
           s : out STD_LOGIC);
end adder;

architecture Behavioral of adder is
signal abc: std_logic_vector(2 downto 0);
signal s_co:std_logic_vector(1 downto 0); 
begin
abc<=a1&b1&ci;
s<=s_co(1);
co<=s_co(0);

process(abc)
begin
case abc is
    when "001" => s_co<="10";
    when "010" => s_co<="10";
    when "011" => s_co<="01";
    when "100" => s_co<="10";
    when "101" => s_co<="01";
    when "110" => s_co<="01";
    when "111" => s_co<="11";
    when others =>s_co<="00";
end case;
end process;


end Behavioral;

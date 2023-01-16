----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2022 21:13:02
-- Design Name: 
-- Module Name: Zahler - Behavioral
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

entity Zahler is
    Port ( clk : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end Zahler;

architecture Behavioral of Zahler is
signal counter: std_logic_vector(7 downto 0);

begin

process(RST,clk, counter)

    begin
    if RST='1' then
        counter<=(others=>'0');
    elsif rising_edge(clk) then
        if EN='1' then
            counter <= counter + "0000001";
        end if;
    end if;
    LED<=counter;
    
end process;


end Behavioral;

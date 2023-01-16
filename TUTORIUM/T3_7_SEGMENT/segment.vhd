----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2022 13:50:31
-- Design Name: 
-- Module Name: segment - Behavioral
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

entity segment is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
            AN:  out std_logic_vector(0 to 7);
           LED : out STD_LOGIC_VECTOR (0 to 6));
end segment;

architecture Behavioral of segment is
 
begin
AN <=(0=>'0', others=>'1');
LED<= "0000001" when (SW="0000") else 
      "1001111" when (SW="0001") else
      "0010010" when (SW="0010") else
      "0000110" when (SW="0011") else
      "1001100" when (SW="0100") else
      "0100100" when (SW="0101") else
      "0100000" when (SW="0110") else
      "0001111" when (SW="0111") else
      "0000000" when (SW="1000") else
      "0000100" when (SW="1001") else
      "0001000" when (SW="1010") else
      "1100000" when (SW="1011") else
      "0110001" when (SW="1100") else
      "1000010" when (SW="1101") else
      "0110000" when (SW="1110") else
      "0111000";

end Behavioral;

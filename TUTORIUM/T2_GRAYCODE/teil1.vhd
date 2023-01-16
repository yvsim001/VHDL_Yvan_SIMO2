----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2022 12:04:25
-- Design Name: 
-- Module Name: teil1 - Behavioral
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

entity teil1 is
    Port ( B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           G0 : out STD_LOGIC;
           G1 : out STD_LOGIC;
           G2 : out STD_LOGIC;
           G3 : out STD_LOGIC);
end teil1;

architecture Behavioral of teil1 is
   
begin
        G0 <= B0 XOR B1;
        G1 <= B1 XOR B2;
        G2 <= B2 XOR B3;
        G3 <= B3;

end Behavioral;

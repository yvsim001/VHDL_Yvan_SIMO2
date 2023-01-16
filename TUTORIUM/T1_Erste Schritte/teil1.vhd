----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2022 12:37:01
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
    Port ( SW0 : in STD_LOGIC;
           SW1 : in STD_LOGIC;
           SW2 : in STD_LOGIC;
           SW3 : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           LD0 : out STD_LOGIC;
           LD1 : out STD_LOGIC;
           LD2 : out STD_LOGIC;
           LD3 : out STD_LOGIC;
           LD4 : out STD_LOGIC;
           LD5 : out STD_LOGIC;
           LD6 : out STD_LOGIC;
           LD7 : out STD_LOGIC);
end teil1;

architecture Behavioral of teil1 is

begin
LD0<=SW0;
LD1 <=SW1;
LD2 <=SW2;
LD3 <=SW3;
LD4 <=BTNU;
LD5 <=BTNR;
LD6 <=BTND;
LD7 <= BTNL;


end Behavioral;

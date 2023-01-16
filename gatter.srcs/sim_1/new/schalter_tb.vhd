----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2022 19:50:50
-- Design Name: 
-- Module Name: schalter_tb - Behavioral
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

entity schalter_tb is
--  Port ( );
end schalter_tb;

architecture Behavioral of schalter_tb is
signal sw: std_logic_vector(0 to 8);
signal led: std_logic_vector(0 to 8);
component schalter
   Port ( SW : in STD_LOGIC_VECTOR (0 to 3);
           BTNU : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (0 to 8));
end component;
begin
    macherie: schalter
        port map( SW(0) => sw(0), SW(1)=>sw(1), SW(2)=>sw(2), SW(3)=>sw(3), BTNU=>sw(4), BTNR=> sw(5), BTND=>sw(6), BTNL=>sw(7), BTNC=> sw(8),
        LED(0)=> led(0),LED(1)=> led(1),LED(2)=> led(2),LED(3)=> led(3),LED(4)=> led(4),LED(5)=> led(5),LED(6)=> led(6),LED(7)=> led(7),LED(8)=> led(8));
 process
    begin
sw(0)<='1';
wait for  10ns;
sw(1)<='1';
wait for  10ns;
sw(2)<='1';
wait for  10ns;
sw(3)<='1';
wait for  10ns;
sw(4)<='1';
wait for  10ns;
sw(5)<='1';
wait for  10ns;
sw(6)<='1';
wait for  10ns;
sw(7)<='1';
wait for  10ns;
sw(8)<='1';
wait for  10ns;

 end process;
 end Behavioral;

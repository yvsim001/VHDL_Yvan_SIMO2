----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2022 12:40:12
-- Design Name: 
-- Module Name: teil1_tb - Behavioral
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

entity teil1_tb is
--  Port ( );
end teil1_tb;

architecture Behavioral of teil1_tb is
component teil1
        port(SW0,SW1,SW2,SW3: in STD_LOGIC;
             BTNU,BTNR,BTND,BTNL: in STD_LOGIC;
             LD0,LD1,LD2,LD3 : out STD_LOGIC;
             LD4,LD5,LD6,LD7: out STD_LOGIC);
    end component;
    signal sw:std_logic_vector(7 downto 0):= (others=>'0');
    signal led:std_logic_vector(7 downto 0);
begin
process
       begin
         sw(0)<='1';
         wait for 10 ns;
         sw(1)<='1';
         wait for 10 ns; 
         sw(2)<='1';
         wait for 10ns;
         sw(3)<='1';
         wait for 10ns;
         sw(4)<='1';
         wait for 10ns;
         sw(5)<='1';
         wait for 10ns;
         sw(6)<='1';
         wait for 10ns;
         sw(7)<='1';
         wait for 10ns;
end process; 
    DUT:teil1
        port map (
        SW0=>sw(0), SW1=>sw(1), SW2=>sw(2), SW3=>sw(3),
        BTNU=>sw(4), BTNR=>sw(5), BTND=>sw(6), BTNL=>sw(7),
        LD0=>led(0),LD1=>led(1),LD2=>led(2),LD3=>led(3),
        LD4=>led(4),LD5=>led(5),LD6=>led(6),LD7=>led(7));


end Behavioral;

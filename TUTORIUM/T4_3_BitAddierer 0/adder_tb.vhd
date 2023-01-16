----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2022 12:10:56
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
    component adder
        Port ( a1 : in STD_LOGIC;
            b1 : in STD_LOGIC;
            ci : in STD_LOGIC;
            co : out STD_LOGIC;
             s : out STD_LOGIC);
    end component;
    signal sw: std_logic_vector(0 to 2):=(others=>'0');
    signal sw_o: std_logic_vector(0 to 1):=(others=>'0');
begin
    DUT: adder
         port map(a1=>sw(0),b1=>sw(1), ci=>sw(2), co=>sw_o(1), s=>sw_o(0));
process
begin
sw(0)<='1';
wait for 10ns;
sw(1)<='1';
wait for 10ns;
sw(2)<='1';
wait for 10ns;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2022 12:05:43
-- Design Name: 
-- Module Name: teil1_b - Behavioral
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

entity teil1_b is
--  Port ( );
end teil1_b;

architecture Behavioral of teil1_b is
    component teil1
    port(B0, B1,B2,B3: in std_logic;
    G0, G1,G2,G3: out std_logic);
    end component;
    signal b:std_logic_vector(3 downto 0):=(others=>'0');
    signal g:std_logic_vector(3 downto 0);
begin
    DUT: teil1
        port map( B0=>b(0), B1=>b(1) ,B2=>b(2), B3=>b(3),
                   G0=>g(0),G1=>g(1),G2=>g(2),G3=>g(3) );
process
    begin
        b <= "0000";
        wait for 1 ns;
        b <= "0001";
        wait for 1 ns;
        b <= "0010";
        wait for 1 ns;
        b <= "0011";
        wait for 1 ns;
        b <= "0100";
        wait for 1 ns;
        b <= "0101";
        wait for 1 ns;
        b <= "0110";
        wait for 1 ns;
        b <= "0111";
        wait for 1 ns;
        b <= "1000";
        wait for 1 ns;
        b <= "1001";
        wait for 1 ns;
        b <= "1010";
        wait for 1 ns;
        b <= "1011";
        wait for 1 ns;
        b <= "1100";
        wait for 1 ns;
        b <= "1101";
        wait for 1 ns;
        b <= "1110";
        wait for 1 ns;
        b <= "1111";
        wait for 1 ns;
        
End process;
end Behavioral;

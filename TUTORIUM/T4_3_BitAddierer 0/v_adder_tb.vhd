----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2022 14:27:05
-- Design Name: 
-- Module Name: v_adder_tb - Behavioral
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

entity v_adder_tb is
--  Port ( );
end v_adder_tb;

architecture Behavioral of v_adder_tb is
    component v_add
            Port (  A : in STD_LOGIC_VECTOR (0 to 2);
                    B : in STD_LOGIC_VECTOR (0 to 2);
                    S : out STD_LOGIC_VECTOR (0 to 3));
    end component;
    signal SW: std_logic_vector(0 to 5);
    signal s_o: std_logic_vector(0 to 3);
begin
    V_adder_2: v_add
            port map(A=>SW(0 to 2), B=>SW(3 to 5), S=>s_o);
process
begin
SW(0)<='1';
wait for 10 ns;
SW(1)<='1';
wait for 10 ns;
SW(2)<='1';
wait for 10 ns;
SW(3)<='1';
wait for 10 ns;
SW(4)<='1';
wait for 10 ns;
SW(5)<='1';
wait for 10 ns;

end process;

end Behavioral;

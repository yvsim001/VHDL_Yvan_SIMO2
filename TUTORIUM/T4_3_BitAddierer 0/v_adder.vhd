----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2022 13:26:25
-- Design Name: 
-- Module Name: v_add - Behavioral
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

entity v_add is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end v_add;

architecture Behavioral of v_add is
COMPONENT adder
    port( a1: in std_logic;
           b1: in std_logic;
           co: out std_logic;
           ci: in std_logic;
           s: out std_logic);
end component;
signal cai: std_logic;
signal cao: std_logic_vector(1 downto 0);

begin
cai<='0';
itn_1: adder port map( 
        a1=>A(0), b1=>B(0), s=>S(0), ci=>cai, co=>cao(0)  );
itn_2: adder port map( 
        a1=>A(1), b1=>B(1), s=>S(1), ci=>cao(0), co=>cao(1) );
itn_3: adder port map( 
        a1=>A(2), b1=>B(2), s=>S(2), ci=>cao(1), co=>S(3) );

end Behavioral;

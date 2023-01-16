----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2022 12:37:26
-- Design Name: 
-- Module Name: Bit_adder - Behavioral
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

entity Bit_adder is
    Port ( BTN : in STD_LOGIC;
           SWW : in STD_LOGIC_VECTOR (2 downto 0);
           LED : out STD_LOGIC_VECTOR (0 to 6);
           CAT : out STD_LOGIC_VECTOR (0 to 7));
end Bit_adder;

architecture Behavioral of Bit_adder is
    component latches
            Port ( EN : in STD_LOGIC;
           DI : in STD_LOGIC_VECTOR (2 downto 0);
           DO : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component v_add
            Port (  A : in STD_LOGIC_VECTOR (2 downto 0);
                    B : in STD_LOGIC_VECTOR (2 downto 0);
                    S : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component segment
        Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
                AN:  out std_logic_vector(0 to 7);
               LED : out STD_LOGIC_VECTOR (0 to 6));
    end component;
    signal L_A: std_logic_vector(2 downto 0);
    signal A_S: std_logic_vector(3 downto 0);
begin
  latch_1 : latches
        port map(EN=>BTN, DI=>SWW, DO=>L_A);
  addierer_1: v_add 
        port map(A=>L_A, B=>SWW, S=>A_S);
  segment_1: segment
        port map(SW=>A_S, AN=>CAT, LED=>LED);

end Behavioral;

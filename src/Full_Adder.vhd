----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2025 10:37:55 AM
-- Design Name: 
-- Module Name: Full_Adder - Behavioral
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

entity Full_Adder is
  Port ( 
        a_in : in STD_LOGIC;
        b_in : in STD_LOGIC;
        c_in : in STD_LOGIC;
        c_out : out STD_LOGIC;
        s_out : out STD_LOGIC
        );
end Full_Adder;

architecture Behavioral of Full_Adder is
    component half_adder -- Declaring half_Adder as componenet of Full-Adder
        port(
            a : in STD_LOGIC; -- inputs and outputs of half_adder
            b : in STD_LOGIC;
            s : out STD_LOGIC;
            c : out STD_LOGIC
        );
     end component;
     
     signal c1 : STD_LOGIC; -- Signals used as intermediate results
     signal c2 : STD_LOGIC;
     signal s1 : STD_LOGIC;

begin
    HA0: Half_Adder -- The first half adder in our full adder circuite
    port map(
        a => a_in, -- inputs a on the first half adder
        b => b_in,  -- and b on the first half adder
        c => c1, -- carry is stored in the signal c1
        s => s1 -- sum is stored in signal s1
    );
    
    HA1: Half_Adder -- The second half adder in our full adder circuite
    port map(
        a => s1, -- s1 from the first half adder becomes the first inpit
        b => c_in, -- the incoming carry but is the second input
        c => c2, --carry bit froms econd half adder is the final s_out
        s => s_out -- sum bit from second half adder is the final s_out
    );
    
    c_out <= c1 or c2;-- the final carry out bit is an Oring of the c1 and c2



end Behavioral;

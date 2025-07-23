----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2025 09:22:10 AM
-- Design Name: 
-- Module Name: Four_Bit_Register - Behavioral
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

entity Four_Bit_Register is
  Port ( 
    clk   : in STD_LOGIC;
    load  : in STD_LOGIC;
    clr   : in STD_LOGIC;
    data  : in STD_LOGIC_VECTOR(3 downto 0);
    q_out : out STD_LOGIC_VECTOR(3 downto 0)
  );
end Four_Bit_Register;

architecture Behavioral of Four_Bit_Register is
component One_Bit_Reg
    Port (
      clk   : in STD_LOGIC;
      load  : in STD_LOGIC;
      clr  : in STD_LOGIC;
      data  : in STD_LOGIC;
      Q     : out STD_LOGIC
    );
  end component;
begin
    R0: One_Bit_Reg port map(clk => clk, load => load, clr => clr, data => data(0), Q => q_out(0));
    R1: One_Bit_Reg port map(clk => clk, load => load, clr => clr, data => data(1), Q => q_out(1));
    R2: One_Bit_Reg port map(clk => clk, load => load, clr => clr, data => data(2), Q => q_out(2));
    R3: One_Bit_Reg port map(clk => clk, load => load, clr => clr, data => data(3), Q => q_out(3));

end Behavioral;

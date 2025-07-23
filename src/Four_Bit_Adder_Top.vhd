----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2025 01:40:52 PM
-- Design Name: 
-- Module Name: Four_Bit_Adder_Top - Behavioral
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

entity Four_Bit_Adder_Top is
  Port (   
    switch : in STD_LOGIC_VECTOR(3 downto 0);
    clk    : in STD_LOGIC;
    btnL   : in STD_LOGIC;
    btnR   : in STD_LOGIC;
    btnC : in STD_LOGIC;
    btnD : in STD_LOGIC;
    led    : out STD_LOGIC_VECTOR(3 downto 0);
    seg    : out STD_LOGIC_VECTOR(6 downto 0);
    an     : out STD_LOGIC_VECTOR(3 downto 0);
    dp     : out STD_LOGIC 
  );
end Four_Bit_Adder_Top;

architecture Behavioral of Four_Bit_Adder_Top is
    component Full_Adder -- Declaring Full_Adder as componenet of FourBit Adder
        port(
            a_in : in STD_LOGIC; -- -- inputs and outputs of full_adder
            b_in : in STD_LOGIC;
            c_in : in STD_LOGIC;
            c_out : out STD_LOGIC;
            s_out : out STD_LOGIC
        );
     end component;
     
   component Seven_Segment_Decoder
        Port (
        x : in STD_LOGIC_VECTOR(3 downto 0);
        seg : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    
   component Four_Bit_Register
      Port (
        clk   : in STD_LOGIC;
        load  : in STD_LOGIC;
        clr   : in STD_LOGIC; 
        data  : in STD_LOGIC_VECTOR(3 downto 0);
        q_out : out STD_LOGIC_VECTOR(3 downto 0)
      );
    end component;
    
    component Clock_Divider
      Port (
        clk_in  : in STD_LOGIC;
        clk_out : out STD_LOGIC
      );
    end component;

    component Debounce
      Port (
        sq_in  : in STD_LOGIC;
        clk    : in STD_LOGIC;
        sq_out : out STD_LOGIC
      );
    end component;

     
     signal c0 : STD_LOGIC := '0'; -- Signals used as intermediate results
     signal c1 : STD_LOGIC;
     signal c2 : STD_LOGIC;
     signal c3 : STD_LOGIC;
     signal c4 : STD_LOGIC;
     signal s0 : STD_LOGIC;
     signal s1 : STD_LOGIC;
     signal s2 : STD_LOGIC;
     signal s3 : STD_LOGIC;
     
     signal sum_vector  : STD_LOGIC_VECTOR(3 downto 0);
     signal seg_out : STD_LOGIC_VECTOR(6 downto 0);
     
     signal regA_out : STD_LOGIC_VECTOR(3 downto 0);
     signal regB_out : STD_LOGIC_VECTOR(3 downto 0);
     signal loadA    : STD_LOGIC := '0';
     signal loadB    : STD_LOGIC := '0';
     signal show_sum : STD_LOGIC := '0';
     signal result_to_display : STD_LOGIC_VECTOR(3 downto 0);
     signal clear_all : STD_LOGIC;
     signal regSum_out : STD_LOGIC_VECTOR(3 downto 0);
     signal loadSum    : STD_LOGIC := '0';
     signal display_state : STD_LOGIC_VECTOR(1 downto 0) := "00";
     signal slow_clk : STD_LOGIC;
     signal btnL_deb, btnR_deb, btnC_deb, btnD_deb : STD_LOGIC;
begin

    FA0: Full_Adder port map(
         a_in => regA_out(0),
         b_in => regB_out(0),
         c_in => c0,  
         s_out => s0,
         c_out => c1
    );
    
    FA1: Full_Adder port map(
        a_in => regA_out(1),
        b_in => regB_out(1),
        c_in => c1,
        s_out => s1,
        c_out => c2
    );
    
    FA2: Full_Adder port map(
        a_in => regA_out(2),
        b_in => regB_out(2),
        c_in => c2,
        s_out => s2,
        c_out => c3
    );
    
    FA3: Full_Adder port map(
        a_in => regA_out(3),
        b_in => regB_out(3),
        c_in => c3,
        s_out => s3,
        c_out => c4    -- final output
    );
    
    with display_state select
    result_to_display <=
    regA_out     when "00",
    regB_out     when "01",
    regSum_out   when "10",
    (others => '0') when others;

    decoder: Seven_Segment_Decoder port map(
      x => result_to_display,
      seg => seg_out
    );

        
    RegA: Four_Bit_Register
      port map (
        clk   => clk,
        load  => loadA,
        clr   => clear_all,
        data  => switch(3 downto 0),
        q_out => regA_out
    );
    
    RegB: Four_Bit_Register
      port map (
        clk   => clk,
        load  => loadB,
        clr   => clear_all,
        data  => switch(3 downto 0), 
        q_out => regB_out
      );
      
      RegSum: Four_Bit_Register
          port map (
            clk   => clk,
            load  => loadSum,
            clr   => clear_all,
            data  => sum_vector,              -- sum from adder
            q_out => regSum_out
        );
        
       clk_div: Clock_Divider
          port map (
            clk_in  => clk,
            clk_out => slow_clk
        );
    
    loadA <= btnL_deb;
    loadB <= btnR_deb;
    loadSum <= btnC_deb;
    clear_all <= btnD_deb;

    
    led <= switch;
    sum_vector <= s3 & s2 & s1 & s0;
    seg <= seg_out;
    an <= "0000";
    dp <= not c4; 
    
    debL: Debounce port map(sq_in => btnL, clk => slow_clk, sq_out => btnL_deb);
    debR: Debounce port map(sq_in => btnR, clk => slow_clk, sq_out => btnR_deb);
    debC: Debounce port map(sq_in => btnC, clk => slow_clk, sq_out => btnC_deb);
    debD: Debounce port map(sq_in => btnD, clk => slow_clk, sq_out => btnD_deb);
    
    process(clk)
    begin
      if rising_edge(clk) then
        if clear_all = '1' then
          display_state <= "00";
        elsif loadA = '1' then
          display_state <= "00";
        elsif loadB = '1' then
          display_state <= "01";
        elsif loadSum = '1' then
          display_state <= "10";
        end if;
      end if;
    end process;

    
end Behavioral;

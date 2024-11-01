----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 11:44:07 AM
-- Design Name: 
-- Module Name: basys3_fifo8x8 - Behavioral
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

 entity basys3_fifo8x8 is
     Port ( clk : in STD_LOGIC;
     btn : in STD_LOGIC_VECTOR (4 downto 0);
     sw : in STD_LOGIC_VECTOR (15 downto 0);
     led : out STD_LOGIC_VECTOR (15 downto 0);
     an : out STD_LOGIC_VECTOR (3 downto 0);
     cat : out STD_LOGIC_VECTOR (6 downto 0));
 end basys3_fifo8x8;

architecture Behavioral of basys3_fifo8x8 is

component debouncer is
  Port ( clk : in std_logic;
        btn : in std_logic;
        en : out std_logic );
end component;

component display_7seg is
    Port ( digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component FIFO8x8 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           empty: out STD_LOGIC;
           full: out STD_LOGIC);
end component;

signal data: std_logic_vector(7 downto 0) := "00000000";

signal en1, en2 : std_logic := '0';

begin

    connectDebouncer1: debouncer port map (
        clk => clk,
        btn => btn(1),
        en => en1
    );
    
    connectDebouncer2: debouncer port map (
        clk => clk,
        btn => btn(2),
        en => en2
    );

    connectFIFO: FIFO8x8 port map (
        clk => clk,
        rst => btn(0),
        rd => en1,
        wr => en2,
        data_in => sw(7 downto 0),
        data_out => data,
        empty => led(0),
        full => led(1)
    );
    
    connectDisplay_7seg: display_7seg port map(
        digit0 => data(3 downto 0),
        digit1 => data(7 downto 4),
        digit2 => "0000",
        digit3 => "0000",
        clk => clk,
        cat => cat,
        an => an
    );


end Behavioral;

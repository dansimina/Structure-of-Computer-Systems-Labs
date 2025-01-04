----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2024 08:19:24 PM
-- Design Name: 
-- Module Name: MemoryMatrix - Behavioral
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

entity MemoryMatrix is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    WR : in std_logic;
    BHE : in std_logic;
    SEL: in std_logic_vector (7 downto 0);
    D: inout std_logic_vector(15 downto 0)
  );
end MemoryMatrix;

architecture Behavioral of MemoryMatrix is

component SubModule is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    D: inout std_logic_vector(15 downto 0);
    WR : in std_logic;
    SEL : in std_logic;
    BHE : in std_logic
  );
end component;



begin

    SubModule0: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(0),
        BHE => BHE
    );
    
    SubModule1: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(1),
        BHE => BHE
    );
    
    SubModule2: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(2),
        BHE => BHE
    );
    
    SubModule3: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(3),
        BHE => BHE
    );
    
    SubModule4: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(4),
        BHE => BHE
    );
    
    SubModule5: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(5),
        BHE => BHE
    );
    
    SubModule6: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(6),
        BHE => BHE
    );
    
    SubModule7: SubModule port map (
        A => A,
        D => D,
        WR => WR,
        SEL => SEL(7),
        BHE => BHE
    );

end Behavioral;

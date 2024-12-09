----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2024 01:07:12 PM
-- Design Name: 
-- Module Name: ControlCircuit - Behavioral
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

entity MainBlock is
  Port ( 
    AddressBus: in std_logic_vector (23 downto 0);
    DataBus: inout std_logic_vector (15 downto 0);
    BHE: in std_logic;
    RD: in std_logic;
    WR: in std_logic;
    aux: out std_logic_vector (16 downto 0)
  );
end MainBlock;

architecture Behavioral of MainBlock is

component DecoderCircuit is
  Port ( 
    A: in std_logic_vector (6 downto 0);
    RD: in std_logic;
    WR: in std_logic;
    Sel: out std_logic_vector (7 downto 0);
    SelModule: out std_logic
  );
end component;

component MemoryMatrix is
  Port ( 
    A: in std_logic_vector(16 downto 0);
    WR : in std_logic;
    BHE : in std_logic;
    SEL: in std_logic_vector (7 downto 0);
    D: inout std_logic_vector(15 downto 0)
  );
end component;

component AmplificationCircuit244 is
  Port ( 
    INPUT : in std_logic_vector(7 downto 0);
    OUTPUT: out std_logic_vector(7 downto 0);
    G0: in std_logic;
    G1: in std_logic
  );
end component;

component AmplificationCircuit245 is
  Port ( 
    A: inout std_logic_vector(7 downto 0);
    B: inout std_logic_vector(7 downto 0);
    Dir: in std_logic;
    CS: in std_logic
  );
end component;

signal Address: std_logic_vector(15 downto 0) := (others => 'Z');
signal Sel: std_logic_vector (7 downto 0) := (others => 'Z');
signal Data: std_logic_vector(15 downto 0) := (others => 'Z');

signal SA0: std_logic:= '0';
signal SBHE: std_logic:= '0';
signal SRD: std_logic:= '0';
signal SWR: std_logic := '0';

signal SelModule: std_logic := '0';

signal AuxIn: std_logic_vector (7 downto 0) := (others => 'Z');
signal AuxOut: std_logic_vector (7 downto 0) := (others => 'Z');

signal AuxAddress: std_logic_vector (16 downto 0) := (others => '0');

begin

    AmplificationCircuit244_1: AmplificationCircuit244 port map (
        INPUT => AddressBus(8 downto 1),
        OUTPUT => Address(7 downto 0),
        G0 => '0',
        G1 => '0'
    );
    
    AmplificationCircuit244_2: AmplificationCircuit244 port map (
        INPUT => AddressBus(16 downto 9),
        OUTPUT => Address(15 downto 8),
        G0 => '0',
        G1 => '0'
    );
    
    AuxIn(0) <= AddressBus(0);
    AuxIn(1) <= BHE;
    AuxIn(2) <= RD;
    AuxIn(3) <= WR;
    
    
    AmplificationCircuit244_3: AmplificationCircuit244 port map (
        INPUT => AuxIn,
        OUTPUT => AuxOut,
        G0 => '0',
        G1 => '0'
    );
    
    SA0 <= AuxOut(0);
    SBHE <= AuxOut(1);
    SRD <= AuxOut(2);
    SWR <= AuxOut(3);
    
    DecoderCircuit_1: DecoderCircuit port map(
        A => AddressBus(23 downto 17),
        RD => SRD,
        WR => SWR,
        SEL => Sel,
        SelModule => SelModule
    );
    
    AuxAddress <= Address & SA0;
    
    MemoryMatrix_1: MemoryMatrix port map (
        A => AuxAddress,
        WR => SWR,
        BHE => SBHE,
        SEL => Sel,
        D => Data
    );
    
    AmplificationCircuit245_1: AmplificationCircuit245 port map (
        A => Data(7 downto 0),
        B => DataBus(7 downto 0),
        Dir => SRD,
        CS => SelModule
    );
    
    AmplificationCircuit245_2: AmplificationCircuit245 port map (
        A => Data(15 downto 8),
        B => DataBus(15 downto 8),
        Dir => SRD,
        CS => SelModule
    );
    
    aux <= '0' & Data;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2024 08:05:42 PM
-- Design Name: 
-- Module Name: tb_fifo - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fifo is
--  Port ( );
end tb_fifo;

architecture Behavioral of tb_fifo is

-- Component Declaration for the Unit Under Test (UUT)
    COMPONENT fifo
        PORT (
            s_axis_aresetn : IN STD_LOGIC;
            s_axis_aclk    : IN STD_LOGIC;
            s_axis_tvalid  : IN STD_LOGIC;
            s_axis_tready  : OUT STD_LOGIC;
            s_axis_tdata   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            m_axis_tvalid  : OUT STD_LOGIC;
            m_axis_tready  : IN STD_LOGIC;
            m_axis_tdata   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Testbench Signals
    SIGNAL s_axis_aresetn : STD_LOGIC := '0';
    SIGNAL s_axis_aclk    : STD_LOGIC := '0';
    SIGNAL s_axis_tvalid  : STD_LOGIC := '0';
    SIGNAL s_axis_tready  : STD_LOGIC;
    SIGNAL s_axis_tdata   : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    SIGNAL m_axis_tvalid  : STD_LOGIC;
    SIGNAL m_axis_tready  : STD_LOGIC := '1';
    SIGNAL m_axis_tdata   : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Clock Period (for 100 MHz clock)
    CONSTANT clk_period : time := 10 ns;

begin
    
    -- Instantiate the Unit Under Test (UUT)
    uut: fifo
        PORT MAP (
            s_axis_aresetn => s_axis_aresetn,
            s_axis_aclk    => s_axis_aclk,
            s_axis_tvalid  => s_axis_tvalid,
            s_axis_tready  => s_axis_tready,
            s_axis_tdata   => s_axis_tdata,
            m_axis_tvalid  => m_axis_tvalid,
            m_axis_tready  => m_axis_tready,
            m_axis_tdata   => m_axis_tdata
        );

    -- Clock generation process
    clk_process : PROCESS
    BEGIN
        s_axis_aclk <= '0';
        WAIT FOR clk_period / 2;
        s_axis_aclk <= '1';
        WAIT FOR clk_period / 2;
    END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Reset the FIFO
        s_axis_aresetn <= '0';
        WAIT FOR 20 ns;
        s_axis_aresetn <= '1';
        s_axis_tvalid <= '1';
        WAIT FOR 20 ns;
        
        s_axis_tdata <= x"00000001";
        WAIT FOR 20 ns;
        s_axis_tdata <= x"00000002";
        WAIT FOR 20 ns;
        
        WAIT;
    END PROCESS;

end Behavioral;

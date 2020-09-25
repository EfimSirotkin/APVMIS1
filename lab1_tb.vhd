
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity lab1_tb is
end lab1_tb;

architecture Behavioral_schematic of lab1_tb is

component Latch
Port(
    S : in STD_LOGIC_VECTOR(2 downto 0);
    G: in STD_LOGIC;
    D : in STD_LOGIC;
    CLR : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(7 downto 0)
    ); 
end component;

    Signal S1 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    Signal G : STD_LOGIC := '0';
    Signal D : STD_LOGIC := '0';
    Signal CLR : STD_LOGIC := '0';
    Signal Q1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    Signal Q2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
begin
u1 : entity work.lab1_scheme(Behavioral_schematic) port map (
    S => S1,
    G => G,
    D => D,
    CLR => CLR,
    Q => Q1
    );

u2 : entity work.lab1_scheme(Behavioral_logic) port map (
    S => S1,
    G => G,
    D => D,
    CLR => CLR,
    Q => Q2
    );

stim : process
   begin


--D_loop: for i in 0 to 1 loop
--    D <= (to_unsigned(i, 1)(0));  
--    CLR <= '1';
--    G <= '1';
--    S_loop: for j in 7 downto 0 loop
--       S1 <= std_logic_vector(to_unsigned(j, 3));
--       wait for 1 ns;
--    end loop S_loop;
--end loop D_loop;

   

--D1_loop: for i in 0 to 1 loop
--    D <= (to_unsigned(i, 1)(0));  
--    CLR <= '0';
--    G <= '0';
--    S1_loop: for j in 7 downto 0 loop
--        S1 <= std_logic_vector(to_unsigned(j, 3));
--        wait for 1 ns;
--    end loop S1_loop;
--end loop D1_loop;


--D2_loop: for i in 0 to 1 loop
--    D <= (to_unsigned(i, 1)(0));  
--    CLR <= '0';
--    G <= '1';
--    S2_loop: for j in 7 downto 0 loop
--        S1 <= std_logic_vector(to_unsigned(j, 3));
--        wait for 1 ns;
--    end loop S2_loop;
--end loop D2_loop;


--D3_loop: for i in 0 to 1 loop
--    D <= (to_unsigned(i, 1)(0));  
--    CLR <= '1';
--    G <= '0';
--    S3_loop: for j in 7 downto 0 loop
--        S1 <= std_logic_vector(to_unsigned(j, 3));
--        wait for 1 ns;
--    end loop S3_loop;
--end loop D3_loop;


D_loop : for j in 1 downto 0 loop
    D <= (to_unsigned(j, 1)(0));  
    CLR_loop : for k in 1 downto 0 loop
        CLR <= (to_unsigned(k, 1)(0));
        G_loop : for i in 1 downto 0 loop
            G <= (to_unsigned(i, 1)(0));
            S1_loop : for input_numbers in 0 to 7 loop
                S1 <= std_logic_vector(to_unsigned(input_numbers, 3));
                wait for 1 ns;
            end loop S1_loop;
         end loop G_loop;
    end loop CLR_loop;
end loop D_loop;
       
  wait;
  end process;
end;
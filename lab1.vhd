library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lab1_scheme is
  Port (
      S : in STD_LOGIC_VECTOR(2 downto 0);
      G : in STD_LOGIC;
      D : in STD_LOGIC;
      CLR : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR(7 downto 0)
       );
end lab1_scheme;


architecture Behavioral_schematic of lab1_scheme is
      Signal A : STD_LOGIC;
      Signal B : STD_LOGIC;
      Signal P : STD_LOGIC_VECTOR(7 downto 0);
      Signal R : STD_LOGIC_VECTOR(7 downto 0);
      Signal T : STD_LOGIC_VECTOR(7 downto 0);
      Signal F : STD_LOGIC_VECTOR(7 downto 0);
      Signal C : STD_LOGIC_VECTOR(7 downto 0);
      
      constant TbPeriod : time := 0.1 ns;
      
begin

A <= G AND (NOT D);
B <= G and D;


R(0) <= (NOT S(2)) AND  (NOT S(1)) AND  (NOT S(0)) AND  B;
R(1) <= (NOT S(2)) AND  (NOT S(1)) AND       S(0)  AND  B;
R(2) <= (NOT S(2)) AND       S(1)  AND  (NOT S(0)) AND  B;
R(3) <= (NOT S(2)) AND       S(1)  AND       S(0)  AND  B;
R(4) <=      S(2)  AND  (NOT S(1)) AND  (NOT S(0)) AND  B;
R(5) <=      S(2)  AND  (NOT S(1)) AND       S(0)  AND  B;
R(6) <=      S(2)  AND       S(1)  AND  (NOT S(0)) AND  B;
R(7) <=      S(2)  AND       S(1)  AND       S(0)  AND  B;

T(0) <= (NOT S(2)) AND  (NOT S(1)) AND  (NOT S(0)) AND  A;
T(1) <= (NOT S(2)) AND  (NOT S(1)) AND       S(0)  AND  A;
T(2) <= (NOT S(2)) AND       S(1)  AND  (NOT S(0)) AND  A;
T(3) <= (NOT S(2)) AND       S(1)  AND       S(0)  AND  A;
T(4) <=      S(2)  AND  (NOT S(1)) AND  (NOT S(0)) AND  A;
T(5) <=      S(2)  AND  (NOT S(1)) AND       S(0)  AND  A;
T(6) <=      S(2)  AND       S(1)  AND  (NOT S(0)) AND  A;
T(7) <=      S(2)  AND       S(1)  AND       S(0)  AND  A;

P(0) <= (NOT CLR) AND C(0);
P(1) <= (NOT CLR) AND C(1);
P(2) <= (NOT CLR) AND C(2);
P(3) <= (NOT CLR) AND C(3);
P(4) <= (NOT CLR) AND C(4);
P(5) <= (NOT CLR) AND C(5);
P(6) <= (NOT CLR) AND C(6);
P(7) <= (NOT CLR) AND C(7);


F <= P NOR R;
C <= F NOR T;
Q <= C;

end Behavioral_schematic;


architecture Behavioral_logic of lab1_scheme is
       
begin
    process(D, S(0), S(1), S(2), G, CLR)
    
    variable Q1 : STD_LOGIC_VECTOR(7 downto 0);
    begin
        if(CLR = '1') AND (G = '1') then
            if(S = "000") then
                Q1 := (others => '0');
                Q1(0) := D;
               
            elsif(S = "001") then
                Q1 := (others => '0');
                Q1(1) := D;
                
            elsif(S = "010") then
                Q1 := (others => '0');
                Q1(2) := D;
            
                
            elsif(S = "011") then
                Q1 := (others => '0');
                Q1(3) := D;
            
                
            elsif(S = "100") then
                Q1 := (others => '0');
                Q1(4) := D;
            
                
            elsif(S = "101") then
                Q1 := (others => '0');
                Q1(5) := D;
            
                
            elsif(S = "110") then
                Q1 := (others => '0');
                Q1(6) := D;
          
            
            else
                Q1 := (others => '0');
                Q1(7) := D;
            end if;
           
            Q <= Q1;
        end if;
        
        
        if(CLR = '1') AND (G = '0') then
                    Q1 := (others => '0');
                    Q <= (others => '0');    
        end if;
        
            
        if(CLR = '0') AND (G = '1') then
        
            if(S = "000") then
                Q1(0) := D;
            end if;
            
            if(S = "001") then
                Q1(1) := D;
            end if;
                        
            if(S = "010") then
                Q1(2) := D;
            end if;
            
            if(S = "011") then
                Q1(3) := D;
            end if;
            
            if(S = "100") then
                Q1(4) := D;
            end if;
            
            if(S = "101") then
                Q1(5) := D;
            end if;
            
            if(S = "110") then
                Q1(6) := D;
            end if;
            
            if( S = "111") then
                Q1(7) := D;
            end if;
            
            Q <= Q1;       
        end if;
        
        if(CLR = '0') AND (G = '0') then
            Q <= Q1;
        end if;
        
            
    end process;
end Behavioral_logic;

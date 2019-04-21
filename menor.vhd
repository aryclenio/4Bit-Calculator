entity menor is
	port (a,b: in bit_vector(3 downto 0);
			cout: out bit);
end entity;

architecture ehmenor of menor is
	component maior is
			port (a,b: in bit_vector(3 downto 0);
					cout: out bit);
		end component;
begin  
 comparar: maior port map(a => a, b => b, cout => cout);
 end ehmenor;
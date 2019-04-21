entity maior is
	port (a,b: in bit_vector(3 downto 0);
			cout: out bit);
end entity;

architecture ehmaior of maior is
	--Se cout do subtrador for 1, a < b
	component subtrador is
		port (a,b: in bit_vector(3 downto 0);
			cout:out bit);
		end component;
	begin 
	subtrair: subtrador port map(a => a, b => b, cout => cout);
end ehmaior;
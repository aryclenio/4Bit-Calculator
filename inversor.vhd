entity inversor is
	port(a: in bit_vector(3 downto 0);
		s: out bit_vector(3 downto 0));		
end inversor;

architecture inverter of inversor is
begin
	 s <= not a;
end inverter;
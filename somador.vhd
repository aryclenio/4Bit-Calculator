entity somador is
	port (a,b: in bit_vector(3 downto 0);
			s: out bit_vector(3 downto 0);
			cout:out bit);
end entity;

architecture soma of somador is
signal cin: bit_vector(3 downto 0);
begin
	cin(0) <= NULL;
	s(0)<= a(0) xor b(0) xor cin(0);
	cin(1)<= (a(0) and b(0)) or (a(0) and cin(0)) or (b(0) and cin(0));
	s(1)<= a(1) xor b(1) xor cin(1);
	cin(2) <= (a(1) and b(1)) or (a(1) and cin(1)) or (b(1) and cin(1));
	s(2)<= a(2) xor b(2) xor cin(2);
	cin(3) <= (a(2) and b(2)) or (a(2) and cin(2)) or (b(2) and cin(2));
	s(3)<= a(3) xor b(3) xor cin(3);
	cout <= (a(3) and b(3)) or (a(3) and cin(3)) or (b(3) and cin(3));
end soma;
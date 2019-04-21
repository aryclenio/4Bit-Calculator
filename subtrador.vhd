entity subtrador is
	port (a,b: in bit_vector(3 downto 0);
			s: out bit_vector(3 downto 0);
			cout:out bit);
end entity;

architecture subtrair of subtrador is
	signal cin: bit_vector(3 downto 0);
	signal b_not: bit_vector(3 downto 0);
begin
	cin(0) <= '1';
	b_not <= not b;
	s(0)<= a(0) xor b_not(0) xor cin(0);
	cin(1)<= (a(0) and b_not(0)) or (a(0) and cin(0)) or (b_not(0) and cin(0));
	s(1)<= a(1) xor b_not(1) xor cin(1);
	cin(2) <= (a(1) and b_not(1)) or (a(1) and cin(1)) or (b_not(1) and cin(1));
	s(2)<= a(2) xor b_not(2) xor cin(2);
	cin(3) <= (a(2) and b_not(2)) or (a(2) and cin(2)) or (b_not(2) and cin(2));
	s(3)<= a(3) xor b_not(3) xor cin(3);
	cout <= not((a(3) and b_not(3)) or (a(3) and cin(3)) or (b_not(3) and cin(3)));
end subtrair;
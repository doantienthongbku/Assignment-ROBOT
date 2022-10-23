function T_maxtrix(Th_1, Th_2, Th_3, Th_4)
global A01 A0a A02 A03 A04
d1 = 77;
a2 = 128;
a3 = 24;
a4 = 124;
a5 = 126;
A01 = [cos(Th_1) 0 sin(Th_1) 0; sin(Th_1) 0 -cos(Th_1) 0; 0 1 0 d1; 0 0 0 1];
A1a = [cos(Th_2+pi/2) -sin(Th_2+pi/2) 0 a2*cos(Th_2+pi/2); sin(Th_2+pi/2) cos(Th_2+pi/2) 0 a2*sin(Th_2+pi/2); 0 0 1 0; 0 0 0 1];
Aa2 = [0 1 0 0; -1 0 0 -a3; 0 0 1 0; 0 0 0 1];
A23 = [cos(Th_3) -sin(Th_3) 0 a4*cos(Th_3); sin(Th_3) cos(Th_3) 0 a4*sin(Th_3); 0 0 1 0; 0 0 0 1];
A34 = [cos(Th_4) -sin(Th_4) 0 a5*cos(Th_4); sin(Th_4) cos(Th_4) 0 a5*sin(Th_4); 0 0 1 0; 0 0 0 1];
A0a = A01*A1a;
A02 = A0a*Aa2;
A03 = A02*A23;
A04 = A03*A34;
end
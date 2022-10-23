function finalposition(Th_1, Th_2, Th_3, Th_4, handles)
d1 = 77;
a2 = 128;
a3 = 24;
a4 = 124;
a5 = 126;
%calculating X, Y, Z position%
X = cos(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) + a5*cos(Th_2 + Th_3 + Th_4) - a2*sin(Th_2));
Y = sin(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) + a5*cos(Th_2 + Th_3 + Th_4) - a2*sin(Th_2));
Z = d1 + a4*sin(Th_2 + Th_3) + a2*cos(Th_2) + a3*sin(Th_2) + a5*sin(Th_2 + Th_3 + Th_4);
X = round(X,2);
Y = round(Y,2);
Z = round(Z,2);
set(handles.edt_X, 'string', num2str(X));
set(handles.edt_Y, 'string', num2str(Y));
set(handles.edt_Z, 'string', num2str(Z));

%calculating Roll, Pitch, Yard %
Pitch = atan2(-(sin(Th_2 + Th_3 + Th_4)),sqrt(square(cos(Th_2 + Th_3 + Th_4)) + square(0)))*180/pi;
Roll = atan2(cos(Th_2 + Th_3 + Th_4)/cos(Pitch), 0/cos(Pitch))*180/pi;
Yaw = atan2( sin(Th_1 + Th_2 + Th_3 + Th_4)/2 - sin(Th_2 - Th_1 + Th_3 + Th_4)/2/cos(Pitch), cos(Th_1 + Th_2 + Th_3 + Th_4)/2 + cos(Th_2 - Th_1 + Th_3 + Th_4)/2/cos(Pitch))*180/pi;

Pitch = round(Pitch,2);
Roll = round(Roll,2);
Yaw = round(Yaw,2);
set(handles.edt_Roll, 'string', num2str(Roll));
set(handles.edt_Pitch, 'string', num2str(Pitch));
set(handles.edt_Yaw, 'string', num2str(Yaw));

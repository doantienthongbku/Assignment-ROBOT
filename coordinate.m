function coordinate(theta1, theta2, d3, theta4,handles)
%const
a1 = 400; d1 = 360; a2 = 250; d4 = -30;
%var
d3 = -d3;
X = a2*cosd(theta1 + theta2) + a1*cosd(theta1);
Y = a2*sind(theta1 + theta2) + a1*sind(theta1);
Z = d1+d3+d4;

%%
set(handles.edt_theta1, 'string', num2str(theta1));
set(handles.edt_theta2, 'string', num2str(theta2));
set(handles.edt_theta3, 'string', num2str(-d3));
set(handles.edt_theta4, 'string', num2str(theta4));

set(handles.sld_theta1, 'value', theta1);
set(handles.sld_theta2, 'value', theta2);
set(handles.sld_d3, 'value', -d3);
set(handles.sld_theta4, 'value', theta4);
end
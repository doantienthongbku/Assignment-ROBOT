function draw(theta1, theta2, d3, theta4, handles)
%% === thong so ===
a1 = 400;
d1 = 360;
a2 = 250;
d4 = -30;
d3 = -d3;
%% === ve mo phong canh tay robot ===
cla;    
xlabel('Truc x');
ylabel('Truc y');
zlabel('Truc z');    
% === xac dinh vi tri cac goc to do === 
X = [0; 0; a1*cosd(theta1); a2*cosd(theta1 + theta2) + a1*cosd(theta1); a2*cosd(theta1 + theta2) + a1*cosd(theta1); a2*cosd(theta1 + theta2) + a1*cosd(theta1)];
Y = [0; 0; a1*sind(theta1); a2*sind(theta1 + theta2) + a1*sind(theta1); a2*sind(theta1 + theta2) + a1*sind(theta1); a2*sind(theta1 + theta2) + a1*sind(theta1)];
Z = [0; d1; d1; d1; d1+    d3; d1+d3+d4];
hold(handles.axes1,'on');
grid(handles.axes1,'on');
axis([-650, 650, -650, 650, 0, 400]);
%base
r = 200;
xc = 0;
yc = 0;
theta = linspace(0,2*pi);
x_c = r*cos(theta) + xc;
y_c = r*sin(theta) + yc;
plot(x_c,y_c,'Parent',handles.axes1,'linewidth',1,'color','k');
fill(x_c,y_c,'c');
%link 1
plot3(X(2,1),Y(2,1),Z(2,1),'ob','Parent',handles.axes1);
plot3([X(1,1) X(2,1)],[Y(1,1) Y(2,1)],[Z(1,1) Z(2,1)],'Parent',handles.axes1,'linewidth',10);
quiver3 ([0 0 0],[0 0 0],[0 0 0],[100 0 0], [0 100 0],[0 0 50],'-k','Parent',handles.axes1,'linewidth',2);
%link 2
plot3(X(3,1),Y(3,1),Z(3,1),'ob','Parent',handles.axes1);
plot3([X(2,1) X(3,1)],[Y(2,1) Y(3,1)],[Z(2,1) Z(3,1)],'Parent',handles.axes1,'linewidth',10);

quiver3 ([X(3,1) X(3,1) X(3,1)],[Y(3,1) Y(3,1) Y(3,1)],[Z(3,1) Z(3,1) Z(3,1)],100*[cosd(theta1) -sind(theta1) 0], 100*[sind(theta1) cosd(theta1) 0],[0 0 50],'-k','Parent',handles.axes1,'linewidth',2);
%link 3
plot3(X(3,1),Y(3,1),Z(3,1),'ob','Parent',handles.axes1);
plot3([X(3,1) X(4,1)],[Y(3,1) Y(4,1)],[Z(3,1) Z(4,1)],'Parent',handles.axes1,'linewidth',10);

quiver3 ([X(4,1) X(4,1) X(4,1)],[Y(4,1) Y(4,1) Y(4,1)],[Z(4,1) Z(4,1) Z(4,1)],100*[cosd(theta1+theta2) -sind(theta1+theta2) 0], 100*[sind(theta1+theta2) cosd(theta1+theta2) 0],[0 0 50],'-k','Parent',handles.axes1,'linewidth',2);
%link 4
plot3(X(4,1),Y(4,1),Z(4,1),'ob','Parent',handles.axes1);
plot3([X(4,1) X(5,1)],[Y(4,1) Y(5,1)],[Z(4,1) Z(5,1)],'Parent',handles.axes1,'linewidth',10);

quiver3 ([X(5,1) X(5,1) X(5,1)],[Y(5,1) Y(5,1) Y(5,1)],[Z(5,1) Z(5,1) Z(5,1)],100*[cosd(theta1+theta2) -sind(theta1+theta2) 0], 100*[sind(theta1+theta2) cosd(theta1+theta2) 0],[0 0 50],'-k','Parent',handles.axes1,'linewidth',2);
%tay kep
plot3(X(5,1),Y(5,1),Z(5,1),'ob','Parent',handles.axes1);
plot3([X(5,1) X(6,1)],[Y(5,1) Y(6,1)],[Z(5,1) Z(6,1)],'Parent',handles.axes1,'linewidth',10);

quiver3 ([X(6,1) X(6,1) X(6,1)],[Y(6,1) Y(6,1) Y(6,1)],[Z(6,1) Z(6,1) Z(6,1)],100*[cosd(theta1+theta2+theta4) sind(theta1+theta2+theta4) 0], 100*[sind(theta1+theta2+theta4) -cosd(theta1+theta2+theta4) 0],[0 0 -50],'-k','Parent',handles.axes1,'linewidth',2);

h = rotate3d;
h.Enable = 'on';
end
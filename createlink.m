function createlink(Th_1, Th_2, Th_3, Th_4, handles)
d1 = 77;
a2 = 128;
a3 = 24;
a4 = 124;
a5 = 126;
cla;
xlabel('Truc X (mm)');
ylabel('Truc Y (mm)');
zlabel('Truc Z (mm)');
T_maxtrix(Th_1, Th_2, Th_3, Th_4);
global A01 A0a A02 A03 A04;
%===vi tri goc toa do la vecto [4x1] Porg cua ma tran Aij ===%
X = [0; 0; -a2*cos(Th_1)*sin(Th_2); cos(Th_1)*(a3*cos(Th_2) - a2*sin(Th_2)); cos(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) - a2*sin(Th_2));cos(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) + a5*cos(Th_2 + Th_3 + Th_4) - a2*sin(Th_2))];
Y = [0; 0; -a2*sin(Th_1)*sin(Th_2); sin(Th_1)*(a3*cos(Th_2) - a2*sin(Th_2)); sin(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) - a2*sin(Th_2));sin(Th_1)*(a4*cos(Th_2 + Th_3) + a3*cos(Th_2) + a5*cos(Th_2 + Th_3 + Th_4) - a2*sin(Th_2))];
Z = [0; d1;  d1 + a2*cos(Th_2); d1 + a2*cos(Th_2) + a3*sin(Th_2); d1 + a4*sin(Th_2 + Th_3) + a2*cos(Th_2) + a3*sin(Th_2); d1 + a4*sin(Th_2 + Th_3) + a2*cos(Th_2) + a3*sin(Th_2) + a5*sin(Th_2 + Th_3 + Th_4)];
hold(handles.axes1,'on');
grid(handles.axes1,'on');
axis([-400, 400, -400, 400, 0, 800]);

%------------base---------------%
    %draw joint%
P00 = [  1  0   0   0
         0  1   0   0
         0  0   1   25
         0  0   0   1];
DrawBase(P00, 1, [1 1 0]);
    %draw coordinate%
A00 = [ 1 0 0 0
        0 1 0 0
        0 0 1 0
        0 0 0 1];
trig0 = get(handles.edt_Co_0,'Value');
DrawCoordinate(A00, trig0, 'X0', 'Y0', 'Z0');

%-------------link 1-----------------%
    %draw link%
plot3(X(2,1),Y(2,1),Z(2,1),'ob','Parent',handles.axes1); 
plot3([X(1,1) X(2,1)],[Y(1,1) Y(2,1)],[Z(1,1) Z(2,1)],'-k','Parent',handles.axes1,'linewidth',2);
    %draw joint%
P01 = [  cos(Th_1)  -sin(Th_1)   0   0
         sin(Th_1)   cos(Th_1)  0   0
         0  0   1   d1
         0  0   0   1];
     %draw joint%
DrawLink(P01, 1, [1 1 0]);
     %draw coordinate%
trig1 = get(handles.edt_Co_1,'Value');
DrawCoordinate(A01, trig1,'X1', 'Y1', 'Z1');



%-----------link 2------------%
    %draw link%
plot3(X(3,1),Y(3,1),Z(3,1),'ob','Parent',handles.axes1);
plot3([X(2,1) X(3,1)],[Y(2,1) Y(3,1)],[Z(2,1) Z(3,1)],'-k','Parent',handles.axes1,'linewidth',2);
    %draw coordinate%
trig2 = get(handles.edt_Co_2,'Value');
DrawCoordinate(A0a, trig2,'Xa','Ya','Za');

%-------------link 3---------------%
    %draw link%
plot3(X(3,1),Y(3,1),Z(3,1),'ob','Parent',handles.axes1);
plot3([X(3,1) X(4,1)],[Y(3,1) Y(4,1)],[Z(3,1) Z(4,1)],'-k','Parent',handles.axes1,'linewidth',2);
P02 = [  cos(Th_1)  -sin(Th_1)   0   X(4,1)
         sin(Th_1)   cos(Th_1)  0   Y(4,1)
         0  0   1   Z(4,1)
         0  0   0   1];
    %draw joint%
DrawLink(P02, 1, [1 1 0]);
    %draw coordinate%
trig3 = get(handles.edt_Co_3,'Value');
DrawCoordinate(A02, trig3,'X2', 'Y2', 'Z2');


%------------link 4-------------%
    %draw link%
plot3(X(4,1),Y(4,1),Z(4,1),'ob','Parent',handles.axes1);
plot3([X(4,1) X(5,1)],[Y(4,1) Y(5,1)],[Z(4,1) Z(5,1)],'-k','Parent',handles.axes1,'linewidth',2);
P03 = [  cos(Th_1)  -sin(Th_1)   0   X(5,1)
         sin(Th_1)   cos(Th_1)  0   Y(5,1)
         0  0   1   Z(5,1)
         0  0   0   1];
    %draw joint%
DrawLink(P03, 1, [1 1 0]);
    %draw coordinate%
trig4 = get(handles.edt_Co_4,'Value');
DrawCoordinate(A03, trig4,'X3', 'Y3', 'Z3');

%-------------link 5----------------%
    %draw link%
plot3(X(5,1),Y(5,1),Z(5,1),'ob','Parent',handles.axes1);
plot3([X(5,1) X(6,1)],[Y(5,1) Y(6,1)],[Z(5,1) Z(6,1)],'-k','Parent',handles.axes1,'linewidth',2);

P04a =    [cos(Th_1)  -sin(Th_1)   0   X(6,1)    %quay quanh Z goc Th_1
         sin(Th_1)   cos(Th_1)  0   Y(6,1)
         0  0   1   Z(6,1)
         0  0   0   1];
P04b = P04a*[0 0 1 0;0 1 0 0; -1 0 0 0; 0 0 0 1]; %quay quanh Y goc 90 do
P04 = P04b*[cos(-(Th_4+Th_3+Th_2))  0  sin(-(Th_4+Th_3+Th_2))   0         %quay quanh y goc Th_4
         0           1      0       0
         -sin(-(Th_4+Th_3+Th_2))  0  cos(-(Th_4+Th_3+Th_2))   0
         0           0      0       1];
    %draw End Effector%
DrawGrip( P04, 1, [1 1 0] );

    %draw coordinate%
trig5 = get(handles.edt_Co_5,'Value');
DrawCoordinate(A04, trig5,'X4', 'Y4', 'Z4');

h = rotate3d;
h.Enable = 'on';
end


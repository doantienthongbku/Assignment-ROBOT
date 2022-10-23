function varargout = BTL_SCARA_Robot(varargin)
% BTL_SCARA_ROBOT MATLAB code for BTL_SCARA_Robot.fig
%      BTL_SCARA_ROBOT, by itself, creates a new BTL_SCARA_ROBOT or raises the existing
%      singleton*.
%
%      H = BTL_SCARA_ROBOT returns the handle to a new BTL_SCARA_ROBOT or the handle to
%      the existing singleton*.
%
%      BTL_SCARA_ROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BTL_SCARA_ROBOT.M with the given input arguments.
%
%      BTL_SCARA_ROBOT('Property','Value',...) creates a new BTL_SCARA_ROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BTL_SCARA_Robot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BTL_SCARA_Robot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BTL_SCARA_Robot

% Last Modified by GUIDE v2.5 23-Oct-2022 09:07:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BTL_SCARA_Robot_OpeningFcn, ...
                   'gui_OutputFcn',  @BTL_SCARA_Robot_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BTL_SCARA_Robot is made visible.
function BTL_SCARA_Robot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BTL_SCARA_Robot (see VARARGIN)

% Choose default command line output for BTL_SCARA_Robot
handles.output = hObject;
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old
[theta1, theta2, d3, theta4] = getdata(handles);
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
coordinate(theta1, theta2, d3, theta4,handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BTL_SCARA_Robot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BTL_SCARA_Robot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Foward.
function Foward_Callback(hObject, eventdata, handles)
% hObject    handle to Foward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ==== lay du lieu tu GUI ===
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;

t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4] = getdata(handles);
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
coordinate(theta1, theta2, d3 , theta4, handles);


function edt_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
giatri = str2double(get(handles.edt_theta1, 'string'));
if (giatri < 242) & (giatri >= -62)
   set(handles.sld_theta1, 'value', giatri);
else
   msgbox('Nhap gia tri trong khoang -180 den 180 do');
end
% Hints: get(hObject,'String') returns contents of edt_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta1 as a double


% --- Executes during object creation, after setting all properties.
function edt_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
giatri = str2double(get(handles.edt_theta2, 'string'));
if (giatri < 147.5) & (giatri >= -147.5)
   set(handles.sld_theta2, 'value', giatri);
else
   msgbox('Nhap gia tri trong khoang -180 den 180 do');
end
% Hints: get(hObject,'String') returns contents of edt_theta2 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta2 as a double


% --- Executes during object creation, after setting all properties.
function edt_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_theta3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
giatri = str2double(get(handles.edt_theta3, 'string'));
if (giatri < 330) & (giatri >= 0)
   set(handles.sld_d3, 'value', giatri);
else
   msgbox('Nhap gia tri trong khoang 0-300mm');
end
% Hints: get(hObject,'String') returns contents of edt_theta3 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta3 as a double


% --- Executes during object creation, after setting all properties.
function edt_theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
giatri = str2double(get(handles.edt_theta4, 'string'));
if (giatri < 180) & (giatri >= -180)
   set(handles.sld_theta4, 'value', giatri);
else
   msgbox('Nhap gia tri trong khoang -180 den 180 do');
end
% Hints: get(hObject,'String') returns contents of edt_theta4 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta4 as a double


% --- Executes during object creation, after setting all properties.
function edt_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sld_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to sld_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
giatri = round(get(handles.sld_theta1, 'value'),2);
set(handles.edt_theta1, 'string', num2str(giatri));
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4] = getdata(handles);
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
coordinate(theta1, theta2, d3 , theta4, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes on slider movement.
function sld_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to sld_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
giatri = round(get(handles.sld_theta2, 'value'),2);
set(handles.edt_theta2, 'string', num2str(giatri));
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4] = getdata(handles);
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
coordinate(theta1, theta2, d3 , theta4, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_d3_Callback(hObject, eventdata, handles)
% hObject    handle to sld_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
giatri = round(get(handles.sld_d3, 'value'),2);
set(handles.edt_theta3, 'string', num2str(giatri));
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4] = getdata(handles);
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);


function sld_d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to sld_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
giatri = round(get(handles.sld_theta4, 'value'),2);
set(handles.edt_theta4, 'string', num2str(giatri));
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4] = getdata(handles);
animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
coordinate(theta1, theta2, d3 , theta4, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




function edt_X_Callback(hObject, eventdata, handles)
% hObject    handle to edt_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edt_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Y_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edt_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Z_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Z as text
%        str2double(get(hObject,'String')) returns contents of edt_Z as a double


% --- Executes during object creation, after setting all properties.
function edt_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_R_Callback(hObject, eventdata, handles)
% hObject    handle to edt_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Gia tri Roll la hang so');
set(handles.edt_R, 'string', '0');
% Hints: get(hObject,'String') returns contents of edt_R as text
%        str2double(get(hObject,'String')) returns contents of edt_R as a double


% --- Executes during object creation, after setting all properties.
function edt_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_P_Callback(hObject, eventdata, handles)
% hObject    handle to edt_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Gia tri Pitch la hang so');
set(handles.edt_P, 'string', '180');
% Hints: get(hObject,'String') returns contents of edt_P as text
%        str2double(get(hObject,'String')) returns contents of edt_P as a double


% --- Executes during object creation, after setting all properties.
function edt_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Ya_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Ya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Ya as text
%        str2double(get(hObject,'String')) returns contents of edt_Ya as a double


% --- Executes during object creation, after setting all properties.
function edt_Ya_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Ya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Inverse.
function Inverse_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% === lay du lieu ===
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
x = str2double(get(handles.edt_X,'string'));
y = str2double(get(handles.edt_Y,'string'));
z = str2double(get(handles.edt_Z,'string'));
yaw = str2double(get(handles.edt_Ya,'string'));
% === ve mo phong ===
t1_old = theta1;
t2_old = theta2;
d3_old = d3;
t4_old = theta4;
[theta1, theta2, d3, theta4, check] = inverse(x,y,z,yaw, handles);
if (check ==0)
    animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles);
else 
    msgbox('Vi tri khong thuoc vung lam viec');
end
% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in c.
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c


% --- Executes on slider movement.
function sld_al_Callback(hObject, eventdata, handles)
% hObject    handle to sld_al (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opacity = get(handles.sld_al, 'value');
alpha(opacity);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_al_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_al (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in tick_ws.
function tick_ws_Callback(hObject, eventdata, handles)
% hObject    handle to tick_ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 d3 theta4 t1_old t2_old d3_old t4_old;
tick = get(handles.tick_ws, 'value');
if (tick == 1)
    workspace(handles);
else
    draw(theta1, theta2, d3, theta4, handles);
end
% Hint: get(hObject,'Value') returns toggle state of tick_ws



function edt_x1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_x1 as text
%        str2double(get(hObject,'String')) returns contents of edt_x1 as a double


% --- Executes during object creation, after setting all properties.
function edt_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_y1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_y1 as text
%        str2double(get(hObject,'String')) returns contents of edt_y1 as a double


% --- Executes during object creation, after setting all properties.
function edt_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_z1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_z1 as text
%        str2double(get(hObject,'String')) returns contents of edt_z1 as a double


% --- Executes during object creation, after setting all properties.
function edt_z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_ya1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_ya1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_ya1 as text
%        str2double(get(hObject,'String')) returns contents of edt_ya1 as a double


% --- Executes during object creation, after setting all properties.
function edt_ya1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_ya1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_x2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_x2 as text
%        str2double(get(hObject,'String')) returns contents of edt_x2 as a double


% --- Executes during object creation, after setting all properties.
function edt_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_y2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_y2 as text
%        str2double(get(hObject,'String')) returns contents of edt_y2 as a double


% --- Executes during object creation, after setting all properties.
function edt_y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_z2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_z2 as text
%        str2double(get(hObject,'String')) returns contents of edt_z2 as a double


% --- Executes during object creation, after setting all properties.
function edt_z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_ya2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_ya2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_ya2 as text
%        str2double(get(hObject,'String')) returns contents of edt_ya2 as a double


% --- Executes during object creation, after setting all properties.
function edt_ya2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_ya2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in trajec.
function trajec_Callback(hObject, eventdata, handles)
% hObject    handle to trajec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel8, 'visible', 'on');
set(handles.uipanel7, 'visible', 'off');
set(handles.uipanel10, 'visible', 'off');


% --- Executes on button press in var.
function var_Callback(hObject, eventdata, handles)
% hObject    handle to var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel7, 'visible', 'on');
set(handles.uipanel8, 'visible', 'off');
set(handles.uipanel10, 'visible', 'off');

% --- Executes on button press in linear.
function linear_Callback(hObject, eventdata, handles)
% hObject    handle to linear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel11, 'visible', 'off');
set(handles.Circu, 'value', 0);
% Hint: get(hObject,'Value') returns toggle state of linear


% --- Executes on button press in Circu.
function Circu_Callback(hObject, eventdata, handles)
% hObject    handle to Circu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.Circu, 'value') == 1
    set(handles.uipanel11, 'visible', 'on');
else set(handles.uipanel11, 'visible', 'off');
end
set(handles.linear, 'value', 0);
% Hint: get(hObject,'Value') returns toggle state of Circu



function edt_vmax_Callback(hObject, eventdata, handles)
% hObject    handle to edt_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_vmax as text
%        str2double(get(hObject,'String')) returns contents of edt_vmax as a double


% --- Executes during object creation, after setting all properties.
function edt_vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_amax_Callback(hObject, eventdata, handles)
% hObject    handle to edt_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_amax as text
%        str2double(get(hObject,'String')) returns contents of edt_amax as a double


% --- Executes during object creation, after setting all properties.
function edt_amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xA = str2double(get(handles.edt_x1,'string'));
yA = str2double(get(handles.edt_y1,'string'));
zA = str2double(get(handles.edt_z1,'string'));
yaA = str2double(get(handles.edt_ya1,'string'));

xB = str2double(get(handles.edt_x2,'string'));
yB = str2double(get(handles.edt_y2,'string'));
zB = str2double(get(handles.edt_z2,'string'));
yaB = str2double(get(handles.edt_ya2,'string'));

vmax = str2double(get(handles.edt_vmax,'string'));
amax = str2double(get(handles.edt_amax,'string'));
if (get(handles.linear, 'value') == 0)&& (get(handles.Circu, 'value') == 0)
    msgbox('Vui long nhap quy dao quy hoach');
    return
else
    if (vmax == 0)||(amax == 0)
        msgbox('Vui long nhap vmax/amax');
    else
        run(xA, yA, zA, yaA, xB, yB, zB, yaB, vmax, amax, handles);
    end
end


% --- Executes on button press in dvar.
function dvar_Callback(hObject, eventdata, handles)
% hObject    handle to dvar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel10, 'visible', 'on');
set(handles.uipanel7, 'visible', 'off');
set(handles.uipanel8, 'visible', 'off');



function edt_x3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_x3 as text
%        str2double(get(hObject,'String')) returns contents of edt_x3 as a double


% --- Executes during object creation, after setting all properties.
function edt_x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_y3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_y3 as text
%        str2double(get(hObject,'String')) returns contents of edt_y3 as a double


% --- Executes during object creation, after setting all properties.
function edt_y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_z3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_z3 as text
%        str2double(get(hObject,'String')) returns contents of edt_z3 as a double


% --- Executes during object creation, after setting all properties.
function edt_z3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

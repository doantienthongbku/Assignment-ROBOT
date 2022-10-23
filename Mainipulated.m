function varargout = Mainipulated(varargin)
% MAINIPULATED MATLAB code for Mainipulated.fig
%      MAINIPULATED, by itself, creates a new MAINIPULATED or raises the existing
%      singleton*.
%
%      H = MAINIPULATED returns the handle to a new MAINIPULATED or the handle to
%      the existing singleton*.
%
%      MAINIPULATED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINIPULATED.M with the given input arguments.
%
%      MAINIPULATED('Property','Value',...) creates a new MAINIPULATED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mainipulated_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mainipulated_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mainipulated

% Last Modified by GUIDE v2.5 23-Oct-2022 16:52:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mainipulated_OpeningFcn, ...
                   'gui_OutputFcn',  @Mainipulated_OutputFcn, ...
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


% --- Executes just before Mainipulated is made visible.
function Mainipulated_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mainipulated (see VARARGIN)

% Choose default command line output for Mainipulated
handles.output = hObject;
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;
theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;
createlink(theta1, theta2, theta3, theta4, handles);
set(handles.edt_theta1, 'string', num2str(theta1));
set(handles.edt_theta2, 'string', num2str(theta2));
set(handles.edt_theta3, 'string', num2str(theta3));
set(handles.edt_theta4, 'string', num2str(theta4));
old_theta1 = theta1;
old_theta2 = theta2;
old_theta3 = theta3;
old_theta4 = theta4;
finalposition(theta1, theta2, theta3, theta4, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mainipulated wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mainipulated_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edt_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta1 as a double
theta1 = str2double(handles.edt_theta1.String);    
if (theta1 <= -180)||(theta1 >= 180)
        msgbox('Goc Theta vuot qua gioi han. Xin nhap lai!');
set(handles.sli_theta1, 'value', theta1);
end

function edt_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta1 as a double
theta2 = str2double(handles.edt_theta2.String);    
if (theta2 <= -180)||(theta2 >= 180)
        msgbox('Goc Theta vuot qua gioi han. Xin nhap lai!');
set(handles.sli_theta2, 'value', theta2);
end

function edt_theta3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta1 as a double
theta3 = str2double(handles.edt_theta3.String);    
if (theta3 <= -180)||(theta3 >= 180)
        msgbox('Goc Theta vuot qua gioi han. Xin nhap lai!');
set(handles.sli_theta3, 'value', theta3);
end

function edt_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to edt_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edt_theta1 as a double
theta4 = str2double(handles.edt_theta4.String);    
if (theta4 <= -180)||(theta4 >= 180)
        msgbox('Goc Theta vuot qua gioi han. Xin nhap lai!');
set(handles.sli_theta4, 'value', theta4);
end


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


% --- Executes on button press in forwardkine.
function forwardkine_Callback(hObject, eventdata, handles)
% hObject    handle to forwardkine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;

theta1 = str2double(handles.edt_theta1.String)*pi/180;
theta2 = str2double(handles.edt_theta2.String)*pi/180;
theta3 = str2double(handles.edt_theta3.String)*pi/180;
theta4 = str2double(handles.edt_theta4.String)*pi/180;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);
old_theta1 = theta1;
old_theta2 = theta2;
old_theta3 = theta3;
old_theta4 = theta4;

set(handles.sli_theta1, 'value', theta1);
set(handles.sli_theta2, 'value', theta2);
set(handles.sli_theta3, 'value', theta3);
set(handles.sli_theta4, 'value', theta4);


% --- Executes during object creation, after setting all properties.
function edt_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edt_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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


% --- Executes on button press in Co_0.
function sli_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to sli_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;

giatri = round(get(handles.sli_theta1, 'value'),2);
set(handles.edt_theta1, 'string', num2str(giatri));
theta1 = giatri*pi/180;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);
old_theta1 = theta1;



% --- Executes during object creation, after setting all properties.
function sli_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sli_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function sli_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to sli_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;

giatri = round(get(handles.sli_theta2, 'value'),2);
set(handles.edt_theta2, 'string', num2str(giatri));
theta2 = giatri*pi/180;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);

old_theta2 = theta2;

% --- Executes during object creation, after setting all properties.
function sli_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sli_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sli_theta3_Callback(hObject, eventdata, handles)
% hObject    handle to sli_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;

giatri = round(get(handles.sli_theta3, 'value'),2);
set(handles.edt_theta3, 'string', num2str(giatri));
theta3 = giatri*pi/180;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);
old_theta3 = theta3;

% --- Executes during object creation, after setting all properties.
function sli_theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sli_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sli_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to sli_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;
giatri = round(get(handles.sli_theta4, 'value'),2);
set(handles.edt_theta4, 'string', num2str(giatri));
theta4 = giatri*pi/180;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);
old_theta4 = theta4;

% --- Executes during object creation, after setting all properties.
function sli_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sli_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function edt_Roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Pitch as text
%        str2double(get(hObject,'String')) returns contents of edt_Pitch as a double


% --- Executes during object creation, after setting all properties.
function edt_Pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Yaw as text
%        str2double(get(hObject,'String')) returns contents of edt_Yaw as a double


% --- Executes during object creation, after setting all properties.
function edt_Yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in edt_Co_0.
function edt_Co_0_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_0
global theta1 theta2 theta3 theta4 A00;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
A00 = [ 1 0 0 0
        0 1 0 0
        0 0 1 0
        0 0 0 1];
trig = get(handles.edt_Co_0,'Value');
DrawCoordinate(A00, trig, 'X0', 'Y0', 'Z0');


% --- Executes on button press in edt_Co_1.
function edt_Co_1_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_1
global theta1 theta2 theta3 theta4  A01;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
T_maxtrix(theta1, theta2, theta3, theta4);
trig1 = get(handles.edt_Co_1,'Value');
DrawCoordinate(A01, trig1, 'X1', 'Y1', 'Z1');



% --- Executes on button press in edt_Co_2.
function edt_Co_2_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_2
global theta1 theta2 theta3 theta4  A0a;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
T_maxtrix(theta1, theta2, theta3, theta4);
trig2 = get(handles.edt_Co_2,'Value');
DrawCoordinate(A0a, trig2, 'Xa', 'Ya', 'Za');

% --- Executes on button press in edt_Co_3.
function edt_Co_3_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_3
global theta1 theta2 theta3 theta4  A02;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
T_maxtrix(theta1, theta2, theta3, theta4);
trig3 = get(handles.edt_Co_3,'Value');
DrawCoordinate(A02, trig3, 'X2', 'Y2', 'Z2');

% --- Executes on button press in edt_Co_4.
function edt_Co_4_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_4
global theta1 theta2 theta3 theta4  A03;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
T_maxtrix(theta1, theta2, theta3, theta4);
trig4 = get(handles.edt_Co_4,'Value');
DrawCoordinate(A03, trig4, 'X3', 'Y3', 'Z3');

% --- Executes on button press in edt_Co_5.
function edt_Co_5_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Co_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edt_Co_5
global theta1 theta2 theta3 theta4  A04;
cla;
createlink(theta1, theta2, theta3, theta4, handles);
T_maxtrix(theta1, theta2, theta3, theta4);
trig5 = get(handles.edt_Co_5,'Value');
DrawCoordinate(A04, trig5,'X4', 'Y4', 'Z4');


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta1 theta2 theta3 theta4 old_theta1 old_theta2 old_theta3 old_theta4;

theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;

moving(theta1, theta2, theta3, theta4, old_theta1, old_theta2, old_theta3, old_theta4, handles);
old_theta1 = theta1;
old_theta2 = theta2;
old_theta3 = theta3;
old_theta4 = theta4;

set(handles.edt_theta1, 'string', num2str(theta1));
set(handles.edt_theta2, 'string', num2str(theta2));
set(handles.edt_theta3, 'string', num2str(theta3));
set(handles.edt_theta4, 'string', num2str(theta4));

set(handles.sli_theta1, 'value', theta1);
set(handles.sli_theta2, 'value', theta2);
set(handles.sli_theta3, 'value', theta3);
set(handles.sli_theta4, 'value', theta4);

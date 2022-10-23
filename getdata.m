function [a, b, c, d] = getdata(handles)
a = str2double(get(handles.edt_theta1,'string'));
b = str2double(get(handles.edt_theta2,'string'));
c = str2double(get(handles.edt_theta3,'string'));
d = str2double(get(handles.edt_theta4,'string'));
end
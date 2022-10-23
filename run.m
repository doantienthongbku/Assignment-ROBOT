function run(xA, yA, zA, yaA, xB, yB, zB, yaB, vmax, amax, handles) 
global theta1 theta2 d3 theta4;
if get(handles.linear, 'value') == 1
    quydao = 0;
else
    quydao = 1;
end
if quydao == 0
    pmax = sqrt((xA-xB)^2+(yA-yB)^2+(zA-zB)^2);
else
    xC = str2double(get(handles.edt_x3,'string')); 
    yC = str2double(get(handles.edt_y3,'string'));
    zC = str2double(get(handles.edt_z3,'string'));
    o1=[xA;yA;zA]; o2=[xC;yC;zC]; o3=[xB;yB;zB]; %3 diem dau vao
    n = cross((o1-o2),(o3-o2)); %vecto chi phuong mp
    if norm(n)< 10^-3
        msgbox('Ba diem thang hang')
      return
    end
    md1 = 0.5*(o1+o2); %trung diem doan P1P2
    md2 = 0.5*(o3+o2); %trung diem doan P2P3
    n1 = cross((o1-o2),n); %vecto chi phuong dt tt P1P2
    n2 = cross((o3-o2),n); %vecto chi phuong dt tt P2P3
    syms a b;
    [st,~] = solve(md1+n1*a == md2+n2*b); %tim giao diem 2 duong tt
    c1 = md1+n1*double(st); %tam duong tron
    r = norm(c1-o1); %ban kinh
    e1 = o1-c1; e2 = o2-c1; e3 = o3 - c1;
    h1 = r*acos((e1(1)*e2(1)+e1(2)*e2(2)+e1(3)*e2(2))/(sqrt(e1(1)^2+e1(2)^2+e1(3)^2)*sqrt(e2(1)^2+e2(2)^2+e2(3)^2)));
    h2 = r*acos((e2(1)*e3(1)+e2(2)*e3(2)+e2(3)*e3(2))/(sqrt(e2(1)^2+e2(2)^2+e2(3)^2)*sqrt(e3(1)^2+e3(2)^2+e3(3)^2)));
    pmax = h1 + h2;
end
%%
if vmax > sqrt(pmax*amax/2)
    vmax = sqrt(pmax*amax/2);
end
t1 = vmax/amax;
t2 = 2*t1;
t3 = t2 + (pmax-2*vmax*t1)/vmax;
t4 = t3 + t1;
t5 = t4 + t1;
J = amax/t1;

t_fst = 0:0.3:t1;
t_snd = t1:0.3:t2;
t_trd = t2:0.3:t3;
t_fth = t3:0.3:t4;
t_fifth = t4:0.3:t5;
%%
p1 = @(t) 1/6*J*t.^3;
p2 = @(t) 1/6*J*t1^3 + 1/2*J*t1^2*(t-t1) + 1/2*amax*(t-t1).^2 - 1/6*J*(t-t1).^3;
p3 = @(t) 1/2*J*t1^3 + 1/2*amax*t1^2 + vmax*(t-t2);
p4 = @(t) 1/2*J*t1^3 +1/2*amax*t1^2 + vmax*(t3-t2) + vmax*(t-t3)-1/6*J*(t-t3).^3;
p5 = @(t) vmax*t1 + vmax*(t3-t2) + 1/2*amax*t1^2 + 1/3*J*t1^3 + vmax*(t-t4) - 1/2*J*t1^2*(t-t4) - 1/2*amax*(t-t4).^2 + 1/6*J*(t-t4).^3;
v1 = @(t) 1/2*J*t.^2;
v2 = @(t) 1/2*J*t1^2 + amax*(t-t1) - 1/2*J*(t-t1).^2;
v3 = @(t) vmax + 0*(t-t2);
v4 = @(t) vmax - 1/2*J*(t-t3).^2;
v5 = @(t) vmax - 1/2*J*t1^2 - amax*(t-t4) + 1/2*J*(t-t4).^2;
a1 = @(t) J*t;
a2 = @(t) amax - J*(t-t1);
a3 = @(t) 0*(t-t2);
a4 = @(t) -J*(t-t3);
a5 = @(t) -amax + J*(t-t4);
%%
p_t = [p1(t_fst),p2(t_snd),p3(t_trd),p4(t_fth),p5(t_fifth)];
v_t = [v1(t_fst),v2(t_snd),v3(t_trd),v4(t_fth),v5(t_fifth)];
a_t = [a1(t_fst),a2(t_snd),a3(t_trd),a4(t_fth),a5(t_fifth)];
t = [t_fst,t_snd,t_trd,t_fth,t_fifth];
l =length(t);
if quydao == 0
    p_x = xA + p_t*(xB-xA)/pmax;
    p_y = yA + p_t*(yB-yA)/pmax;
    p_z = zA + p_t*(zB-zA)/pmax;
else
    alp = acos(e1(1)/sqrt(e1(1)^2+e1(2)^2+e1(3)^2));
    chieu = sign(xA-xB);
    if chieu < 0
        alp = -alp;
    end
    p_x = c1(1) + r*cos(p_t/r)*cos(alp) + r*sin(p_t/r)*sin(alp);
    p_y = c1(2) + (- r*cos(p_t/r)*sin(alp) + r*sin(p_t/r)*cos(alp))*chieu;
    p_z = c1(3)*ones(1,length(p_t));
end
del = deg2rad((yaB - yaA)/t(l));
%% dong hoc nguoc
ag1 = []; ag2 = []; ag3 = []; ag4 = [];
for i=1:l
    ya = yaA + rad2deg(del*t(i));
    [theta1, theta2, d3, theta4, check] = inverse(p_x(i), p_y(i), p_z(i), ya, handles);
    if check == 0
    ag1 = [ag1,theta1];
    ag2 = [ag2,theta2];
    ag3 = [ag3,d3];
    ag4 = [ag4,theta4];
    else
        break;
    end
end
%% dong hoc van toc
vt1 = 0; vt2 = 0; vd3 = 0; vt4 = 0;
for i=2:length(ag1)
    vx = (p_x(i)-p_x(i-1))/(t(i)-t(i-1));
    vy = (p_y(i)-p_y(i-1))/(t(i)-t(i-1));
    vz = (p_z(i)-p_z(i-1))/(t(i)-t(i-1));
    ve = [vx; vy; vz; del];
    Jacobi = [-250*sind(ag1(i)+ag2(i))-400*sind(ag1(i)) -250*sind(ag1(i)+ag2(i)) 0 0;...
              250*cosd(ag1(i)+ag2(i))+400*cosd(ag1(i)) 250*cosd(ag1(i)+ag2(i)) 0 0;...
              0 0 1 0; 1 1 0 1];
    q_dot = (Jacobi)\ve;
    vt1 = [vt1 q_dot(1,1)];
    vt2 = [vt2 q_dot(2,1)];
    vd3 = [vd3 q_dot(3,1)];
    vt4 = [vt4 q_dot(4,1)];
end
%% ve
for i=1:length(ag1)
    % === p ===
    plot(t(1:i),p_t(1:i),'Parent',handles.ax_p,'linewidth',2);
    grid(handles.ax_p,'on');
    title(handles.ax_p,'Do thi p','fontsize',10);
    % === v ===
    plot(t(1:i),v_t(1:i),'Parent',handles.ax_v,'linewidth',2);
    grid(handles.ax_v,'on');
    title(handles.ax_v,'Do thi v','fontsize',10);
    % === a ===
    plot(t(1:i),a_t(1:i),'Parent',handles.ax_a,'linewidth',2);
    grid(handles.ax_a,'on');
    title(handles.ax_a,'Do thi a','fontsize',10);
    % === theta1 ===
    plot(t(1:i),ag1(1:i),'Parent',handles.ax_t1,'linewidth',2);
    grid(handles.ax_t1,'on');
    title(handles.ax_t1,'Theta 1','fontsize',10);
    % === theta2 ===
    plot(t(1:i),ag2(1:i),'Parent',handles.ax_t2','linewidth',2);
    grid(handles.ax_t2,'on');
    title(handles.ax_t2,'Theta 2','fontsize',10);
    % === d3 ===
    plot(t(1:i),ag3(1:i),'Parent',handles.ax_d3,'linewidth',2);
    grid(handles.ax_d3,'on');
    title(handles.ax_d3,'D3','fontsize',10);
    % === theta4 ===
    plot(t(1:i),ag4(1:i),'Parent',handles.ax_t4,'linewidth',2);
    grid(handles.ax_t4,'on');
    title(handles.ax_t4,'Theta 4','fontsize',10);
    % === theta1 dot ===
    plot(t(1:i),vt1(1:i),'Parent',handles.ax_dt1,'linewidth',2);
    grid(handles.ax_dt1,'on');
    title(handles.ax_dt1,'Theta 1 dot','fontsize',10);
    % === theta2 dot ===
    plot(t(1:i),vt2(1:i),'Parent',handles.ax_dt2,'linewidth',2);
    grid(handles.ax_dt2,'on');
    title(handles.ax_dt2,'Theta 2 dot','fontsize',10);
    % === d3 dot ===
    plot(t(1:i),vd3(1:i),'Parent',handles.ax_dd3,'linewidth',2);
    grid(handles.ax_dd3,'on');
    title(handles.ax_dd3,'D3 dot','fontsize',10);
    % === theta4 dot ===
    plot(t(1:i),vt4(1:i),'Parent',handles.ax_dt4,'linewidth',2);
    grid(handles.ax_dt4,'on');
    title(handles.ax_dt4,'Theta 4 dot','fontsize',10);
    % === robot ===
    draw(ag1(i), ag2(i), ag3(i), ag4(i), handles);
    coordinate(ag1(i), ag2(i), ag3(i), ag4(i),handles);
    % === path ===
    plot3(xA,yA,zA,'*k','Parent',handles.axes1,'linewidth',2);
    plot3(xB,yB,zB,'*k','Parent',handles.axes1,'linewidth',2);
    if quydao == 1
        plot3(xC,yC,zC,'*k','Parent',handles.axes1,'linewidth',2);
    end
    plot3(p_x(1:i),p_y(1:i),p_z(1:i),'-r','Parent',handles.axes1,'linewidth',2);
    pause(0.01);
end
if length(ag1) < length(t)
    msgbox('Khong the tiep tuc quy dao');
end
end
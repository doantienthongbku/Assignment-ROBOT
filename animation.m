function animation(theta1, theta2, d3, theta4, t1_old, t2_old, d3_old, t4_old, handles)
d3 = -d3;
d3_old = -d3_old;
%% chia vi tri
dtheta1 = (theta1 - t1_old)/20;
dtheta2 = (theta2 - t2_old)/20;
dd3 = (d3 - d3_old)/20;
dtheta4 = (theta4 - t4_old)/20;
%%
for i = 1:20
    theta1 = t1_old + i*dtheta1;
    theta2 = t2_old + i*dtheta2;
    d3 = d3_old + i*dd3;
    theta4 = t4_old + i*dtheta4;
    
d3 = -d3;    
draw(theta1, theta2, d3, theta4, handles);
coordinate(theta1, theta2, d3, theta4, handles);
pause(0.001);
end

end
function moving(Th_1, Th_2, Th_3, Th_4, old_Th1, old_Th2, old_Th3, old_Th4, handles)
delta_th1 = (Th_1 - old_Th1)/10;
delta_th2 = (Th_2 - old_Th2)/10;
delta_th3 = (Th_3 - old_Th3)/10;
delta_th4 = (Th_4 - old_Th4)/10;

for i = 1:10
    theta1 = old_Th1 + i*delta_th1;
    theta2 = old_Th2 + i*delta_th2;
    theta3 = old_Th3 + i*delta_th3;
    theta4 = old_Th4 + i*delta_th4;
   
createlink(theta1, theta2, theta3, theta4, handles);
finalposition(theta1, theta2, theta3, theta4, handles);
pause(0.01);
end

end

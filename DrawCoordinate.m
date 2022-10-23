function DrawCoordinate(R, trig, nameX, nameY, nameZ)
    uw = [  0   120   0   0
            0   0   120   0
            0   0   0   120
            1   1  1   1]; 
        
    uw = R*uw;
   if trig == 1
    %------ X axis-------%
    plot3([uw(1,1) uw(1,2)],[uw(2,1) uw(2,2)],[uw(3,1) uw(3,2)], 'b', 'LineWidth', 1); 
    plot3(uw(1,2),uw(2,2),uw(3,2),'-diamond','MarkerSize',5,'MarkerEdgeColor','b','LineWidth',1);
    text(uw(1,2), uw(2,2), uw(3,2), nameX , 'FontSize', 10);
    
    %------ Y axis-------%
    plot3([uw(1,1) uw(1,3)],[uw(2,1) uw(2,3)],[uw(3,1) uw(3,3)], 'g', 'LineWidth', 1);
    plot3(uw(1,3),uw(2,3),uw(3,3),'-diamond','MarkerSize',5,'MarkerEdgeColor','g','LineWidth',1);
    text(uw(1,3), uw(2,3), uw(3,3), nameY , 'FontSize', 10);
    
    %------ Z axis-------%
    plot3([uw(1,1) uw(1,4)],[uw(2,1) uw(2,4)],[uw(3,1) uw(3,4)], 'r', 'LineWidth', 1);
    plot3(uw(1,4),uw(2,4),uw(3,4),'-diamond','MarkerSize',5,'MarkerEdgeColor','r','LineWidth',1);
    text(uw(1,4), uw(2,4), uw(3,4), nameZ , 'FontSize', 10);
   end   
end
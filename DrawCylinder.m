function DrawCylinder( H, w, r, h, ax, offsetX, offsetY, offsetZ, color, alpha )
  s = @sind;
  c = @cosd;
  
  punkty = [zeros(2*w,3) ones(2*w,1)];
  
  if ax==1 
    for i=1:1:w       
      punkty(i,1:3) = [ -offsetX r*s((i-1)*360/w)-offsetY r*c((i-1)*360/w)-offsetZ ];
    end
    for i=w+1:1:2*w 
      punkty(i,1:3) = [ h-offsetX r*s((i-1)*360/w)-offsetY r*c((i-1)*360/w)-offsetZ ];
    end
  elseif ax==2 
    for i=1:1:w       
      punkty(i,1:3) = [ r*s((i-1)*360/w)-offsetX -offsetY r*c((i-1)*360/w)-offsetZ ];
    end
    for i=w+1:1:2*w
      punkty(i,1:3) = [ r*s((i-1)*360/w)-offsetX h-offsetY r*c((i-1)*360/w)-offsetZ ];
    end
  else 
    for i=1:1:w       
      punkty(i,1:3) = [ r*s((i-1)*360/w)-offsetX r*c((i-1)*360/w)-offsetY -offsetZ ];
    end
    for i=w+1:1:2*w 
      punkty(i,1:3) = [ r*s((i-1)*360/w)-offsetX r*c((i-1)*360/w)-offsetY h-offsetZ ];
    end  
  end
  
  punkty = (H*punkty')';
  
  
  pl_bocz = zeros(w,4);   
  for i=1:1:w-1
    pl_bocz(i,:) = [ i  i+1  i+w+1  i+w ];
  end  
  pl_bocz(w,:) = [ w 1 w+1 2*w ];  
  for i=1:1:2
    for k=1:1:w
      pl_podst(i,k) = k+w*(i-1); 
    end   
  end 
  
  
  kolory_bocz = zeros(w,3);    
  for i=1:1:w
    kolory_bocz(i,:) = color;
  end     
  kolory_podst = [  color
                    color ];
  
 
  patch( 'Vertices', punkty(:,1:3), 'Faces', pl_bocz, 'FaceVertexCData', kolory_bocz, 'FaceColor', 'flat', 'FaceAlpha', alpha, 'EdgeAlpha', alpha/4)                  
  patch( 'Vertices', punkty(:,1:3), 'Faces', pl_podst, 'FaceVertexCData', kolory_podst, 'FaceColor', 'flat', 'FaceAlpha', alpha, 'EdgeAlpha', alpha/4)       
  
end
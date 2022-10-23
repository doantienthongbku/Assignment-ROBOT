function DrawGrip( H, alpha, color )
  punkty = [          15   25   5   1     
                      15   25  -25   1
                      15  -25  -25   1
                      15  -25   5   1
                      15  -25   5   1
                      15  -25  -15   1
                      15   15  -15   1
                      15   15   5   1     
                     -15   25   5   1     
                     -15   25  -25   1
                     -15  -25  -25   1
                     -15  -25   5   1
                     -15  -15   5   1
                     -15  -15  -15   1
                     -15   15  -15   1  
                     -15   15   5   1 ];   
    punkty = (H*punkty')';
    
    pl_bocz = [   1 2 10  9
                  2 3 11  10
                  3 4 12  11
                  4 5 13  12
                  5 6 14  13
                  6 7 15  14
                  7 8 16  15  
                  8 1 9   16 ];

    pl_podst = [ 1  2   3   4   5   6   7   8
                9  10  11  12  13  14  15  16 ];


    kolory_bocz = [ color  
                    color
                    color
                    color
                    color
                    color
                    color
                    color ];
                    
    kolory_podst = [  color
                      color ];

    patch( 'Vertices', punkty(:,1:3), 'Faces', pl_bocz, 'FaceVertexCData', kolory_bocz, 'FaceColor', 'flat', 'FaceAlpha', alpha, 'EdgeAlpha', alpha/4);               
    patch( 'Vertices', punkty(:,1:3), 'Faces', pl_podst, 'FaceVertexCData', kolory_podst, 'FaceColor', 'flat', 'FaceAlpha', alpha, 'EdgeAlpha', alpha/4);
end
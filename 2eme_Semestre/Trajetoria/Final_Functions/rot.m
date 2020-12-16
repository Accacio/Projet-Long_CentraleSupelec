function [bTa] = rot(theta,axis)
%Returns the matrix of a rotation of theta in the given axis 'x','y' or 'z'

if axis == 'x'
     bTa = [[1 0 0 0];
           [0 cos(theta) -sin(theta) 0];
           [0 sin(theta) cos(theta) 0];
           [0 0 0 1]];
    
elseif axis == 'y'
     bTa = [[cos(theta) 0 sin(theta) 0];
           [0 1 0 0];
           [-sin(theta) 0 cos(theta) 0];
           [0 0 0 1]];
elseif axis == 'z'
     bTa = [[cos(theta) -sin(theta) 0 0];
           [sin(theta) cos(theta) 0 0];
           [0 0 1 0];
           [0 0 0 1]];
else
    bTa = 0; 
end
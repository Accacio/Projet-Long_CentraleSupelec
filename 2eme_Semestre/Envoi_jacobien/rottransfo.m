function res = rottransfo(Z,Y,X)
% X Y Z angles en RADIANS
% Euler angles --> The composite rotation convention is Yaw Pitch Roll (ZYX)
% par rapport à un repère fixe --> composition à gauche !!!

Mx = [1 0 0; 0 cos(X) -sin(X); 0 sin(X) cos(X)];
My = [cos(Y) 0 sin(Y); 0 1 0; -sin(Y) 0 cos(Y)];
Mz = [cos(Z) -sin(Z) 0; sin(Z) cos(Z) 0; 0 0 1];
res = Mx*My*Mz;
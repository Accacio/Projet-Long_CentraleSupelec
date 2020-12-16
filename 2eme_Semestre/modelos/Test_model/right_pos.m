function [frame] = right_pos(pos,d1)

% Objectif: Détermination de la matrice homogène de configuration de l'outil qui fixe la position pos et l'orientation de l'outil tourné vers l'avant
% Entrées: 	pos = la position (X,Y,Z) souhaitée pour l'outil
%			d1 = distance dans l'axe X_0 du repère 1 au repère 0
% Sortie: 	frame = la matrice homogène (4x4) de configuration de l'outil avec la position souhaité et l'orientation fixée.

j1 = atan(pos(2)/(pos(1)-d1));
if (pos(1)-d1)< 0
    j1 = j1 + pi;
end

rep_1 = [0 0 1; 0 1 0; -1 0 0];
rot_1 = [cos(j1) -sin(j1) 0; sin(j1) cos(j1) 0; 0 0 1];
rep = rot_1*rep_1;

frame = [rep pos'; 0 0 0 1];
end
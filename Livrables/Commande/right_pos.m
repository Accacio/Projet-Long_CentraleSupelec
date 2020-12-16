function [frame] = right_pos(pos,d1)

% Objectif: D�termination de la matrice homog�ne de configuration de l'outil qui fixe la position pos et l'orientation de l'outil tourn� vers l'avant
% Entr�es: 	pos = la position (X,Y,Z) souhait�e pour l'outil
%			d1 = distance dans l'axe X_0 du rep�re 1 au rep�re 0
% Sortie: 	frame = la matrice homog�ne (4x4) de configuration de l'outil avec la position souhait� et l'orientation fix�e.

j1 = atan(pos(2)/(pos(1)-d1));
if (pos(1)-d1)< 0
    j1 = j1 + pi;
end

rep_1 = [0 0 1; 0 1 0; -1 0 0];
rot_1 = [cos(j1) -sin(j1) 0; sin(j1) cos(j1) 0; 0 0 1];
rep = rot_1*rep_1;

frame = [rep pos'; 0 0 0 1];
end
function res = inerttransfo(J0G, TOG, m)

% transformation de matrice d'inertie
%
% J0G = diag(Ix,Iy,Iz) matrice d'inertie au centre de gravit� dans le
% rep�re inertiel KUKA (0) 
%
% TOG matrice homog�ne de passage entre rep�re DHM et rep�re inertiel
%
% 1) changement de base : R01 est la matrice de passage (rotation) entre le
% rep�re d�fini par KUKA (0) et celui final du corps souhait� (DHM)(1)
% R01 = [[xDHM dans KUKA] [yDHM dans KUKA] [yDHM dans KUKA]]
% J1G = R10*J0G*R01 = (R01)'*J0G*R01
%
% 2) transport vers l'origine du rep�re DHM O depuis le centre de masse G
% J1O = J1G - m*(^GO)�  avec GO = [x,y,z]
% ^GO = [0 -z y; z 0 -x; -y x 0] pr�produit matriciel preprodvect([x y z])

R01 = TOG(1:3,1:3);
OG = TOG(1:3,4);

J1G =  (R01)'*J0G*R01;
res = J1G - m*preprodvect(OG)*preprodvect(OG);
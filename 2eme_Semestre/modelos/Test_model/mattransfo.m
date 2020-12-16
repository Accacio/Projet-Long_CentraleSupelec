function res = mattransfo(alpha, d, theta, r)

% Objectif: cr�ation d'une matrice de changement du rep�re i au rep�re j
% Entr�es: 	alpha = angle entre Z_i et Z_j dans l'axe X_i
%			d = distance entre Z_i et Z_j dans l'axe X_i
%			theta = angle entre X_i et X_j dans l'axe Z_j
%			r = distance entre X_i et X_i dans l'axe Z_j
% Sortie: 	res = la matrice de transformation

res = [cos(theta) -sin(theta) 0 d; ...
       cos(alpha)*sin(theta) cos(alpha)*cos(theta) -sin(alpha) -r*sin(alpha);...
       sin(alpha)*sin(theta) sin(alpha)*cos(theta) cos(alpha) r*cos(alpha); ...
       0 0 0 1];
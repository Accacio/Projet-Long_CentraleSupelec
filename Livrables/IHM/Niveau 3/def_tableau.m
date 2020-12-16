% On considere que le repère qu'on utilise est de la base du robot. 
% Et alors, pour definir la position du tableau on peut paramétrer sa
% distance jusqu'à la base du robot. 

% Paramètres d'entree
% pos_origin: vector (3x1) de la position d'origine de #
% tai_carre: taille de chaque carre du #

% Exemple
% pos_origin = [0.2;0.2;0]; % (m)
% tai_carre= 0.03; % (m)

function tableau = def_tableau(pos_origin,tai_carre)

tableau.orig = zeros(3,1);
tableau.orig(1) = pos_origin(1); % distance X (m) entre l'origine du repère et le centre du tableau
tableau.orig(2) = pos_origin(2); % distance Y (m) entre l'origine du repère et le centre du tableau
tableau.orig(3) = pos_origin(3); % distance Z (m) entre l'origine du repère et le centre du tableau

% La taille (m) de chaque carre du # 
tableau.taille_carre = tai_carre;

% Positionnement
%
%   (3,1)  |  (3,2)  |  (3,3)
%  ________|_________|________
%   (2,1)  |  (2,2)  |  (2,3) 
%  ________|_________|________
%   (1,1)  |  (1,2)  |  (1,3)
%          |         |

% Definition de position centrale de chaque carre du #

tableau.pos = zeros(3,3,3); % (i,j,k)
% Position (i,j) du tableau
% Coordonnées k: k=1(direct X) k=2(direct Y) k=3(direct Z)

% Direction X => couche 1 : tableau.pos(:,:,1)
tableau.pos(1,1,1) = tableau.orig(1) - tableau.taille_carre;
tableau.pos(1,2,1) = tableau.orig(1);
tableau.pos(1,3,1) = tableau.orig(1) + tableau.taille_carre;
tableau.pos(2,1,1) = tableau.pos(1,1,1);
tableau.pos(2,2,1) = tableau.pos(1,2,1);
tableau.pos(2,3,1) = tableau.pos(1,3,1);
tableau.pos(3,1,1) = tableau.pos(1,1,1);
tableau.pos(3,2,1) = tableau.pos(1,2,1);
tableau.pos(3,3,1) = tableau.pos(1,3,1);

% Direction Y => couche 2 : tableau.pos(:,:,2)
tableau.pos(1,1,2) = tableau.orig(2) - tableau.taille_carre;
tableau.pos(2,1,2) = tableau.orig(2);
tableau.pos(3,1,2) = tableau.orig(2) + tableau.taille_carre;
tableau.pos(1,2,2) = tableau.pos(1,1,2);
tableau.pos(2,2,2) = tableau.pos(2,1,2);
tableau.pos(3,2,2) = tableau.pos(3,1,2);
tableau.pos(1,3,2) = tableau.pos(1,1,2);
tableau.pos(2,3,2) = tableau.pos(2,1,2);
tableau.pos(3,3,2) = tableau.pos(3,1,2);

% Direction Z => couche 3 : tableau.pos(:,:,3)
tableau.pos(:,:,3) = tableau.orig(3);
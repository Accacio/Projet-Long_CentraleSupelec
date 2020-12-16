% Function que recevoi les informations du tableau, et va delivre le
% commande pour faire le dessin du tableau

% Paramètres
% tableau: structure avec l'informations du tableau
% coupletab: structure avec les couples pour faire le dessin

% Example 
% pos_origin = [0.2;0.2;0]; % (m)
% tai_carre= 0.03; % (m)
% tableau = def_tableau(pos_origin,tai_carre);
% coupletab = dessin_tableau(tableau)

% Fonctions qui sont appeles: [coupletab.aller1] = 
% traj_to_couple(aller_lig1_point1,aller_lig1_point2,aller_lig1_point2,'l',0);


function coupletab = dessin_tableau(tableau)

%% Arriver jusqu'à début de ligne 1
% Point initial
aller_lig1_point1 = tableau.orig;
aller_lig1_point1(3) = aller_lig1_point1(3) + tableau.taille_carre; % Au début, l'effectuer n'est pas en contact avec le tableau

% Point final
aller_lig1_point2 = zeros(3,1);
aller_lig1_point2(1) = tableau.pos(3,2,1) - tableau.taille_carre/2;
aller_lig1_point2(2) = tableau.pos(3,2,2) + tableau.taille_carre/2;
aller_lig1_point2(3) = tableau.orig(3);

% Couple
[coupletab.aller1] = traj_to_couple(aller_lig1_point1,aller_lig1_point2,aller_lig1_point2,'l',0);

%% Ligne 1 - Vertical
% Point initial
lig1_point1 = aller_lig1_point1;

% Point final
lig1_point2 = zeros(3,1);
lig1_point2(1) = tableau.pos(1,2,1) - tableau.taille_carre/2;
lig1_point2(2) = tableau.pos(1,2,2) - tableau.taille_carre/2;
lig1_point2(3) = tableau.orig(3);

% Couple
[coupletab.lig1] = traj_to_couple(lig1_point1,lig1_point2,lig1_point2,'l',0);

%% Arriver jusqu'à début de ligne 2
% Point initial
aller_lig2_point1 = lig1_point2;

% Point final
aller_lig2_point3 = zeros(3,1);
aller_lig2_point3(1) = tableau.pos(3,2,1) + tableau.taille_carre/2;
aller_lig2_point3(2) = tableau.pos(3,2,2) + tableau.taille_carre/2;
aller_lig2_point3(3) = tableau.orig(3);

% Point intermediaire
aller_lig2_point2 = zeros(3,1);
aller_lig2_point2(1) = (aller_lig2_point3(1) + aller_lig2_point1(1))/2;
aller_lig2_point2(2) = (aller_lig2_point3(2)+aller_lig2_point1(2))/2;
aller_lig2_point2(3) = tableau.orig(1) + (aller_lig2_point3(2)-aller_lig2_point1(2))/2;

% Couple
[coupletab.aller2] = traj_to_couple(aller_lig2_point1,aller_lig2_point2,aller_lig2_point3,'a',0);

%% Ligne 2 - Vertical
% Point initial
lig2_point1 = aller_lig2_point3;

% Point final
lig2_point2 = zeros(3,1);
lig2_point2(1) = tableau.pos(1,2,1) + tableau.taille_carre/2;
lig2_point2(2) = tableau.pos(1,2,2) - tableau.taille_carre/2;
lig2_point2(3) = tableau.orig(3);

% Couple
[coupletab.lig2] = traj_to_couple(lig2_point1,lig2_point2,lig2_point2,'l',0);

%% Arriver jusqu'à début de ligne 3
% Point initial
aller_lig3_point1 = lig2_point2;

% Point final
aller_lig3_point3 = zeros(3,1);
aller_lig3_point3(1) = tableau.pos(2,1,1) - tableau.taille_carre/2;
aller_lig3_point3(2) = tableau.pos(2,1,2) + tableau.taille_carre/2;
aller_lig3_point3(3) = tableau.orig(3);

% Point intermediaire
aller_lig3_point2 = zeros(3,1);
aller_lig3_point2(1) = (aller_lig3_point3(1) + aller_lig3_point1(1))/2;
aller_lig3_point2(2) = (aller_lig3_point3(2)+aller_lig3_point1(2))/2;
aller_lig3_point2(3) = tableau.orig(1) + (aller_lig3_point3(2)-aller_lig3_point1(2))/2;

% Couple
[coupletab.aller3] = traj_to_couple(aller_lig3_point1,aller_lig3_point2,aller_lig3_point3,'a',0);

%% Ligne 3 - Horizontal
% Point initial
lig3_point1 = aller_lig3_point3;

% Point final
lig3_point2 = zeros(3,1);
lig3_point2(1) = tableau.pos(2,3,1) + tableau.taille_carre/2;
lig3_point2(2) = tableau.pos(2,3,2) + tableau.taille_carre/2;
lig3_point2(3) = tableau.orig(3);

% Couple
[coupletab.lig3] = traj_to_couple(lig3_point1,lig3_point2,lig2_point2,'l',0);

%% Arriver jusqu'à début de ligne 4
% Point initial
aller_lig4_point1 = lig3_point2;

% Point final
aller_lig4_point3 = zeros(3,1);
aller_lig4_point3(1) = tableau.pos(2,1,1) - tableau.taille_carre/2;
aller_lig4_point3(2) = tableau.pos(2,1,2) - tableau.taille_carre/2;
aller_lig4_point3(3) = tableau.orig(3);

% Point intermediaire
aller_lig4_point2 = zeros(3,1);
aller_lig4_point2(1) = (aller_lig4_point3(1) + aller_lig4_point1(1))/2;
aller_lig4_point2(2) = (aller_lig4_point3(2)+aller_lig4_point1(2))/2;
aller_lig4_point2(3) = tableau.orig(1) + (aller_lig4_point3(2)-aller_lig4_point1(2))/2;

% Couple
[coupletab.aller4] = traj_to_couple(aller_lig4_point1,aller_lig4_point2,aller_lig4_point3,'a',0);

%% Ligne 4 - Horizontal
% Point initial
lig4_point1 = aller_lig4_point3;

% Point final
lig4_point2 = zeros(3,1);
lig4_point2(1) = tableau.pos(2,3,1) + tableau.taille_carre/2;
lig4_point2(2) = tableau.pos(2,3,2) - tableau.taille_carre/2;
lig4_point2(3) = tableau.orig(3);

% Couple
[coupletab.lig4] = traj_to_couple(lig4_point1,lig4_point2,lig4_point2,'l',0);

%% Arriver jusqu'à la position finale
% Point initial
aller_lig4_point1 = lig4_point2;

% Point final
aller_lig4_point2 = zeros(3,1);
aller_lig4_point2(3) = tableau.orig(3) + tableau.taille_carre;

% Couple
[coupletab.allerfin] = traj_to_couple(aller_lig4_point1,aller_lig4_point2,aller_lig4_point2,'l',0);


end
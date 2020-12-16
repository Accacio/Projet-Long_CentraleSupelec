%% Development IHM

%% T�che 5

% Fonction general de construction graphique
f = creation_IHM; % handle of figure 'Jeu de Morpion' with data struct

% Subfonctions: 

% Cr�ation de la figure que re�oit les param�tres d'utilisateurs
% f = creation_parametre_utilisateurs(f);

% Cr�ation de la figure que re�oit les param�tres d'entr�e
% f = creation_parametre_tableau(f);

%% T�che 0
% Fonction consise: traj_to_couple

% Par�metres d'entr�e: position initial, position intermediaire, 
% position finale, type de trajectoire
% pos_init: first point (3x1) 
% pos_inter: secod point (3x1)
% pos_fin: last point (3x1)
% type_traj: type of trajectory ('l' or 'c')

% Par�metres de sortie: couple
% couple: couple vector (nx5)
% pos_end: final position vector (with controler modul integration) (nx3)

% Definition de variables necessaires
T = 15; % temps total de simulation (s)
t = 0.001; % temps d'�chantillonage (s)

% Exemple
pos_init = [0;0;0];
pos_inter = [0.1;0.1;0.1];
pos_fin = [0.2;0.2;0.2];
type_traj = 'l';

[couple,pos_end] = traj_to_couple(pos_init,pos_inter,pos_fin,type_traj,0);

%% T�che 1

% D�finition d'environnement de travail (tableau)

% Param�tres d'entree
% pos_origin: vector (3x1) de la position d'origine de #
% tai_carre: taille de chaque carre du #

% Exemple
pos_origin = [0.2;0.2;0]; % (m)
tai_carre= 0.03; % (m)
tableau = def_tableau(pos_origin,tai_carre);

% Fonction de dessin du #

% Function que re�oit les informations du tableau, et va delivre le
% commande pour faire le dessin du tableau

% Param�tres
% tableau: structure avec l'informations du tableau
% coupletab: structure avec les couples pour faire le dessin

% Example 
% pos_origin = [0.2;0.2;0]; % (m)
% tai_carre= 0.03; % (m)
% tableau = def_tableau(pos_origin,tai_carre);
% coupletab = dessin_tableau(tableau)

coupletab = dessin_tableau(tableau);

%% T�che 2
% Cr�ation des fonctions "X" et "O"

% Fonction que va delivre le commande pour faire le dessin du "X"

% Example 
pos_origin = [0.2;0.2;0]; % (m)
tai_carre= 0.03; % (m)
f; % handle of figure 'Jeu de Morpion' - for getting tableau
Xcoordenne = [3,1]; % ligne 3 et colonne 1
id_plot = 1; % idenficator for generate the 3D plot
[coupleX,X_pos_end] = dessin_X(f,Xcoordenne,id_plot);


% Example 
pos_origin = [0.2;0.2;0]; % (m)
tai_carre= 0.03; % (m)
tableau = def_tableau(pos_origin,tai_carre);
f; % handle of figure 'Jeu de Morpion'
Ocoordenne = [3,2]; % ligne 3 et colonne 1
id_plot = 1; % idenficator for generate the 3D plot
[coupleO,O_pos_end] = dessin_O(f,Ocoordenne,id_plot);


% Cr�ation de la fonction que calcule le d�placement entre la case de la grille 
case_init = [1 1]; % ligne: 1 column: 1
case_fin = [1 2]; % ligne 1 column: 2
f; % handle of figure 'Jeu de Morpion'
id_plot = 1; % idenficator for generate the 3D plot
[couple,trajectory] = deplacement_grile(case_init,case_fin,f,id_plot);












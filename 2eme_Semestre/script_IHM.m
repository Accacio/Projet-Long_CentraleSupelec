%% Development IHM

%% Tâche 0
% Fonction consise: traj_to_couple

% Parâmetres d'entrée: position initial, position intermediaire, 
% position finale, type de trajectoire
% pos_init: first point (3x1) 
% pos_inter: secod point (3x1)
% pos_fin: last point (3x1)
% type_traj: type of trajectory ('l' or 'c')

% Parâmetres de sortie: couple
% couple: couple vector (nx5)

% Definition de variables necessaires
% T = 15; % temps total de simulation (s)
% t = 0.001; % temps d'échantillonage (s)

% Exemple
% pos_init = MGD_end(d1,d2,d3,d4,lend,r1,th_DHM(1),th_DHM(2),th_DHM(3),th_DHM(4));
% pos_inter = [0.1;0.1;0.1];
% pos_fin = [0.2;0.2;0.2];
% type_traj = 'l';

% [couple] = traj_to_couple(pos_init,pos_inter,pos_fin,type_traj);



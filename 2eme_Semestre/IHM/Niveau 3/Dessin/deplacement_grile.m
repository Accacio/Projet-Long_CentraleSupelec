%% Fonction qui calcule le couple el la trajectoire pour déplace l'outil entre les cases de la grilles

% Fonctions qui sont appeles: [couple,tr] =
% traj_to_couple(pos_init,pos_inter,pos_fin,type_traj,th_DHM_manuel)

function [couple,trajectory] = deplacement_grile(case_init,case_fin,f,id_plot)

tableau = f.UserData.tableau;

% Point initial
point_init = zeros(3,1);
point_init(1) = tableau.pos(case_init(1),case_init(2),1);
point_init(2) = tableau.pos(case_init(1),case_init(2),2);
point_init(3) = tableau.pos(case_init(1),case_init(2),3) + tableau.taille_carre;

% point_init(1)=0.0570;
% point_init(2)=0.0;
% point_init(1)=0.6550;

% Point final
point_fin = zeros(3,1);
point_fin(1) = tableau.pos(case_fin(1),case_fin(2),1);
point_fin(2) = tableau.pos(case_fin(1),case_fin(2),2);
point_fin(3) = tableau.pos(case_fin(1),case_fin(2),3) + tableau.taille_carre;


% Calcule du couple pour declacer l'effectuer sur les cases de la grille
[couple,trajectory] = traj_to_couple(point_init,point_fin,point_fin,'l',0);


% Figure 3D
if id_plot
    figure(f.UserData.object.plot);
    hold on; axis equal; view(3); 
    plot3(trajectory(:,1),trajectory(:,2),trajectory(:,3),'g');
    u = trajectory(end,1) - trajectory(1,1);
    v = trajectory(end,2) - trajectory(1,2);
    w = trajectory(end,3) - trajectory(1,3);
    quiver3(trajectory(1,1),trajectory(1,2),trajectory(1,3),u,v,w,'g');
    hold off 
end

end
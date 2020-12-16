%% Traj_to_couple: fonction consise que delivre le couple pour une trajectoire

% Fonctions, scripts ou modeles externes: dynamique_youbot_IHM, MGD_end et
% integration

% Parâmetres d'entrée: position initial, position intermediaire, 
% position finale, type de trajectoire
% pos_init: first point (3x1) 
% pos_inter: secod point (3x1)
% pos_fin: last point (3x1)
% type_traj: type of trajectory ('l' or 'c')
% th_DHM_manuel: position angulaire ... doit être retire après

function [couple,tr] = traj_to_couple(pos_init,pos_inter,pos_fin,type_traj,th_DHM_manuel)

% Load de parametres geometrique
run('dynamique_youbot_IHM.m')

% Definition de variables necessaires
T = 15; % temps total de simulation (s)
t = 0.001; % temps d'échantillonage (s)

% % Parametres d'entree editable
% % th_DHM = th_DHM_manuel;
% initP = MGD_end(d1,d2,d3,d4,lend,r1,th_DHM(1),th_DHM(2),th_DHM(3),th_DHM(4));
% pos_init = initP;
% 
% p2 = [0.397; 0.05; 0.365];
% pos_inter = p2;
% 
% finalP = [0.447; 0; 0.365];
% pos_fin = finalP;
% 
% type = 'l';
% type_traj = type;
% 
% if type == 'l'
%     pos_inter = pos_fin;
% end


% Sortie de la simulation
% simOut = sim('integration', 'SrcWorkspace', 'current');
% couple = simOut.get('control');
% warning('Un calcul de couple a fini')


% Execution de trajectoire
trajectory = traj(pos_init,pos_inter,pos_fin,type_traj,T,t,0);
tr = trajectory';
vitesse = [deriv_num(trajectory(1,:),t); deriv_num(trajectory(2,:),t); deriv_num(trajectory(3,:),t)];
Kv = 2;
Ki = 2;

assignin('base', 'trajectory',trajectory);
assignin('base','vitesse',vitesse);
assignin('base','Kv',Kv);
assignin('base','Ki',Ki);

%%%%%%%%%%%%%%%%%%%%%% DESCOMENTAR AQUI%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pos = 0; couple = 0;
% tic
% sim('dynmodel_KUKA_cascade_task_v2014_MOD');
% toc
% 
% % couple = simOut.get('couple_fin1');
% % pos = simOut.get('pos_end.signals.values');
% % th_DHM = simOut.get('ang_pos.signas.values(end,:)');
% 
% ang = squeeze(ang_pos.signals.values);
% th_DHM = ang(end,:);
% assignin('base','th_DHM',th_DHM);
% 
% pos = pos_end.signals.values';
% 
% couple = couple_fin1.signals.values;

% pos = trajectory';


% trajectory =trajectory'; 

% figure;
% plot3(pos_end.signals.values(:,1),pos_end.signals.values(:,2),pos_end.signals.values(:,3))
% hold on
% plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'r')
% hold off
% axis equal

end
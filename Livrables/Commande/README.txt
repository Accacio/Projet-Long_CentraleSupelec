% Ce fichier explique comment utiliser les fonctions et les sch�mas Simulink de commande du robot Youbot KUKA.

%% FONCTIONS DE COMMANDE
% Il existent 10 fonctions Matlab et un script pour simuler les param�tres caract�ristiques du robot et g�n�rer des matrices et mod�les n�cessaires pour la
% commande. Dans la suite, on explique chacune des cettes fonctions et leurs entr�es et sorties.
%
% Script dynamique_youbot.m
% �xecutez cette fonction pour faire les simulations de robot. Cette fonction contient les phases de cr�ation d'une sructure avec les param�tres du robot,
% calcul de diff�rents mod�les et matrices n�c�ssaires pour la simulation du robot de fa�on param�trique et une derni�re phase de �valuations de ces mod�les
% avec le valeurs num�riques des param�tres. � la fin, il y a un exemple de comment appeler chaque m�thode de commande mis en oeuvre sur Simulink et les 
% variables qui peuvent �tre utilis�es pour �valuer la performance du syst�me.
%
% Fonction 1
% res = inerttransfo(J0G, TOG, m)
% Objectif: transformation de matrice d'inertie du robot
% Entr�es:  J0G = diag(Ix,Iy,Iz) matrice d'inertie au centre de gravit� dans le rep�re inertiel KUKA (0) 
% 			TOG = matrice homog�ne de passage entre le rep�re souhait� (par exemple, DHM) et rep�re inertiel
%			m = masse du robot
% Sortie: 	res = matrice dans le nouveau rep�re
%
% Fonction 2
% joint_DHM = inverse_geometric_model(pos)
% Objectif: mod�le g�ometrique inverse du robot, pour obtenir un ensemble d'angle des axes du robot qui permet de placer l'outil dans la position d�sir�e.
%			Cette fonction consid�re que l'outil sera toujours avec une orientation fix�e de l'outil, tourn� vers l'avant. Il est possible de changer cette
%			restriction dans la ligne 21
% Entr�es: 	pos = position (x,y,z) de l'outil
% Sortie: 	joint_DHM = ensemble des angles (theta_1,theta_2,theta_3,theta_4,theta_5) des axes du robot
%
% Fonction 3
% Jac_tot = Jacobian_tot_youbot(D2,D3,D4,Lend,th1,th2,th3,th4)
% Objectif: Calculer la matrice jacobienne total (6x5) du robot Youbot KUKA, qui permet de tranformer les vitesses angulaires dans le torseur cin�matique
% (vitesses de l'outil par rapport aux axes X,Y et Z de la base du robot et vitesse de rotatoon du rep�re associ� à l'outil para rapport aux axes X,Y et Z)
% Entr�es: 	D2 = distance dans l'axe X_1 du rep�re 2 au rep�re 1
%			D3 = distance dans l'axe X_2 du rep�re 3 au rep�re 2
%			D4 = distance dans l'axe X_3 du rep�re 4 au rep�re 3
%			Lend = taille de l'outil du robot
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Jac_tot = la matrice Jacobienne du robot
%
% Fonction 4
% Jv = Jacobian_youbot(D2,D3,D4,Lend,th1,th2,th3,th4)
% Objectif: Calculer la matrice Jacobienne simplifi�e (3x5) du robot Youbot KUKA, qui permet de tranformer les vitesses angulaires dans les vitesses lin�aires 
% de l'outil
% Entr�es: 	D2 = distance dans l'axe X_1 du rep�re 2 au rep�re 1
%			D3 = distance dans l'axe X_2 du rep�re 3 au rep�re 2
%			D4 = distance dans l'axe X_3 du rep�re 4 au rep�re 3
%			Lend = taille de l'outil du robot
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Jv = la matrice Jacobienne simplifi�e du robot
%
% Fonction 5
% res = mattransfo(alpha, d, theta, r)
% Objectif: cr�ation d'une matrice de changement du rep�re i au rep�re j
% Entr�es: 	alpha = angle entre Z_i et Z_j dans l'axe X_i
%			d = distance entre Z_i et Z_j dans l'axe X_i
%			theta = angle entre X_i et X_j dans l'axe Z_j
%			r = distance entre X_i et X_i dans l'axe Z_j
% Sortie: 	res = la matrice de transformation

% Fonction 6
% y = MDI_kuka(q,dq, ddq, param)
% Objectif: Calcul du mod�le dinamique inverse du robot
% Entr�es: 	q = vecteur des cinq positions angulaires
%			dq = vecteur des cinq vitesses angulaires
%			ddq = vecteur des cinq acc�l�rations angulaires
%			param = strucures avec les param�tres physiques du robot (masse, gravit�, inertie, coefficient de frottement)
% Sortie: 	y = le vecteur des couples dans chaque articulation
%
% Fonction 7
% Pend = MGD_end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4)
% Objectif: Calcul du mod�le g�ometrique direct simplifi� du robot.
% Entr�es: 	D1 = distance dans l'axe X_0 du rep�re 1 au rep�re 0
%			D2 = distance dans l'axe X_1 du rep�re 2 au rep�re 1
%			D3 = distance dans l'axe X_2 du rep�re 3 au rep�re 2
%			D4 = distance dans l'axe X_3 du rep�re 4 au rep�re 3
%			Lend = taille de l'outil du robot
%			R1 = distance dans l'axe Z_0 du rep�re 1 au rep�re 0
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Pend = la position de l'outil du robot
%
% Fonction 8
% T0end = MGD_T0end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4,th5)
% Objectif: Calcul du mod�le g�ometrique direct du robot.
% Entr�es: 	D1 = distance dans l'axe X_0 du rep�re 1 au rep�re 0
%			D2 = distance dans l'axe X_1 du rep�re 2 au rep�re 1
%			D3 = distance dans l'axe X_2 du rep�re 3 au rep�re 2
%			D4 = distance dans l'axe X_3 du rep�re 4 au rep�re 3
%			Lend = taille de l'outil du robot
%			R1 = distance dans l'axe Z_0 du rep�re 1 au rep�re 0
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
%			th5 = position angulaire de l'axe 5
% Sortie: 	Pend = la matrice homog�ne de la configuration (position et orientation) de l'outil du robot
%
% Fonction 9
% res = rottransfo(Z,Y,X)
% Objectif: G�n�ration d'une matrice de rotation d'un rep�re (i) par rapport à l'autre (j)
% Entr�es: 	X = angle de rotation en radian par rapport à l'axe X (Roll)
%			Y = angle de rotation en radian par rapport à l'axe Y (Pitch)
%			Z = angle de rotation en radian par rapport à l'axe Z (Yaw)
% Sortie: 	res = la matrice de rotation (3x3)
%
% Fonction 10
% frame = right_pos(pos,d1)
% Objectif: D�termination de la matrice homog�ne de configuration de l'outil qui fixe la position pos et l'orientation de l'outil tourn� vers l'avant
% Entr�es: 	pos = la position (X,Y,Z) souhait�e pour l'outil
%			d1 = distance dans l'axe X_0 du rep�re 1 au rep�re 0
% Sortie: 	frame = la matrice homog�ne (4x4) de configuration de l'outil avec la position souhait� et l'orientation fix�e.

%% Sch�mas Simulink
% On utilise quatre techniques de commande et trois sch�mas Simulink pour mettre en oeuvre ces techniques. Le sch�ma 'dynmodel_KUKA_PIDjoint_2014' est utilis� 
% pour les techniques du PID angulaire et la commande op�rationelle par MGI; le sch�ma 'dynmodel_KUKA_CTIjoint' est utilis� pour la commande angulaire par 
% couple calcul�; et le sch�ma 'dynmodel_KUKA_cascade_task_v2014_MOD' est utilis� pour la commande cascade.
%
% Il existent, dans ces mod�les, blocs sp�cifiques 'Matlab functions', avec les fonctions qu'on a cr�e pour simuler la dynamique du robot. Dans cette cat�gorie,
% on a le bloc 'MDD_Simulink' qui simule le mod�le dynamique direct du robot; le 'MDI_Simulink' qui simule le mod�le dynamique inverse du robot; le 
% 'MGD_Simulink' qui simule le mod�le g�ometrique direct du robot; et le Jacobien qui calcule la pseudo-inverse du Jacobien dans chaque instant selon les 
% variables simul�es. Le bloc MDD_Simulink est r�group� avec deux int�grateurs dans le sous-syst�me 'Robot' simule tout le comportment dynamique du robot. On a
% aussi un bloc Matlab function pour faire l'int�gration de la commande avec la g�n�ration de trajectoire, le 'traj_parsing'. Il re�oit le vecteur avec toute la 
% trajectoire et � chaque instant, fourni comme consigne la valeur correspondant � telle instant dans le vecteur. Apr�s la fin du vecteur, il maintien la m�me
% valeur final comme consigne.Les autres blocs utilis�s sont des blocs natives de Simulink.
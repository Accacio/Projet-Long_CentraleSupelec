% Ce fichier explique comment utiliser les fonctions et les schémas Simulink de commande du robot Youbot KUKA.

%% FONCTIONS DE COMMANDE
% Il existent 10 fonctions Matlab et un script pour simuler les paramètres caractéristiques du robot et générer des matrices et modèles nécessaires pour la
% commande. Dans la suite, on explique chacune des cettes fonctions et leurs entrées et sorties.
%
% Script dynamique_youbot.m
% Éxecutez cette fonction pour faire les simulations de robot. Cette fonction contient les phases de création d'une sructure avec les paramètres du robot,
% calcul de différents modèles et matrices nécéssaires pour la simulation du robot de façon paramétrique et une dernière phase de évaluations de ces modèles
% avec le valeurs numériques des paramètres. À la fin, il y a un exemple de comment appeler chaque méthode de commande mis en oeuvre sur Simulink et les 
% variables qui peuvent être utilisées pour évaluer la performance du système.
%
% Fonction 1
% res = inerttransfo(J0G, TOG, m)
% Objectif: transformation de matrice d'inertie du robot
% Entrées:  J0G = diag(Ix,Iy,Iz) matrice d'inertie au centre de gravité dans le repère inertiel KUKA (0) 
% 			TOG = matrice homogène de passage entre le repère souhaité (par exemple, DHM) et repère inertiel
%			m = masse du robot
% Sortie: 	res = matrice dans le nouveau repère
%
% Fonction 2
% joint_DHM = inverse_geometric_model(pos)
% Objectif: modèle géometrique inverse du robot, pour obtenir un ensemble d'angle des axes du robot qui permet de placer l'outil dans la position désirée.
%			Cette fonction considère que l'outil sera toujours avec une orientation fixée de l'outil, tourné vers l'avant. Il est possible de changer cette
%			restriction dans la ligne 21
% Entrées: 	pos = position (x,y,z) de l'outil
% Sortie: 	joint_DHM = ensemble des angles (theta_1,theta_2,theta_3,theta_4,theta_5) des axes du robot
%
% Fonction 3
% Jac_tot = Jacobian_tot_youbot(D2,D3,D4,Lend,th1,th2,th3,th4)
% Objectif: Calculer la matrice jacobienne total (6x5) du robot Youbot KUKA, qui permet de tranformer les vitesses angulaires dans le torseur cinématique
% (vitesses de l'outil par rapport aux axes X,Y et Z de la base du robot et vitesse de rotatoon du repère associé Ã  l'outil para rapport aux axes X,Y et Z)
% Entrées: 	D2 = distance dans l'axe X_1 du repère 2 au repère 1
%			D3 = distance dans l'axe X_2 du repère 3 au repère 2
%			D4 = distance dans l'axe X_3 du repère 4 au repère 3
%			Lend = taille de l'outil du robot
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Jac_tot = la matrice Jacobienne du robot
%
% Fonction 4
% Jv = Jacobian_youbot(D2,D3,D4,Lend,th1,th2,th3,th4)
% Objectif: Calculer la matrice Jacobienne simplifiée (3x5) du robot Youbot KUKA, qui permet de tranformer les vitesses angulaires dans les vitesses linéaires 
% de l'outil
% Entrées: 	D2 = distance dans l'axe X_1 du repère 2 au repère 1
%			D3 = distance dans l'axe X_2 du repère 3 au repère 2
%			D4 = distance dans l'axe X_3 du repère 4 au repère 3
%			Lend = taille de l'outil du robot
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Jv = la matrice Jacobienne simplifiée du robot
%
% Fonction 5
% res = mattransfo(alpha, d, theta, r)
% Objectif: création d'une matrice de changement du repère i au repère j
% Entrées: 	alpha = angle entre Z_i et Z_j dans l'axe X_i
%			d = distance entre Z_i et Z_j dans l'axe X_i
%			theta = angle entre X_i et X_j dans l'axe Z_j
%			r = distance entre X_i et X_i dans l'axe Z_j
% Sortie: 	res = la matrice de transformation

% Fonction 6
% y = MDI_kuka(q,dq, ddq, param)
% Objectif: Calcul du modèle dinamique inverse du robot
% Entrées: 	q = vecteur des cinq positions angulaires
%			dq = vecteur des cinq vitesses angulaires
%			ddq = vecteur des cinq accélérations angulaires
%			param = strucures avec les paramètres physiques du robot (masse, gravité, inertie, coefficient de frottement)
% Sortie: 	y = le vecteur des couples dans chaque articulation
%
% Fonction 7
% Pend = MGD_end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4)
% Objectif: Calcul du modèle géometrique direct simplifié du robot.
% Entrées: 	D1 = distance dans l'axe X_0 du repère 1 au repère 0
%			D2 = distance dans l'axe X_1 du repère 2 au repère 1
%			D3 = distance dans l'axe X_2 du repère 3 au repère 2
%			D4 = distance dans l'axe X_3 du repère 4 au repère 3
%			Lend = taille de l'outil du robot
%			R1 = distance dans l'axe Z_0 du repère 1 au repère 0
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Pend = la position de l'outil du robot
%
% Fonction 8
% T0end = MGD_T0end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4,th5)
% Objectif: Calcul du modèle géometrique direct du robot.
% Entrées: 	D1 = distance dans l'axe X_0 du repère 1 au repère 0
%			D2 = distance dans l'axe X_1 du repère 2 au repère 1
%			D3 = distance dans l'axe X_2 du repère 3 au repère 2
%			D4 = distance dans l'axe X_3 du repère 4 au repère 3
%			Lend = taille de l'outil du robot
%			R1 = distance dans l'axe Z_0 du repère 1 au repère 0
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
%			th5 = position angulaire de l'axe 5
% Sortie: 	Pend = la matrice homogène de la configuration (position et orientation) de l'outil du robot
%
% Fonction 9
% res = rottransfo(Z,Y,X)
% Objectif: Génération d'une matrice de rotation d'un repère (i) par rapport Ã  l'autre (j)
% Entrées: 	X = angle de rotation en radian par rapport Ã  l'axe X (Roll)
%			Y = angle de rotation en radian par rapport Ã  l'axe Y (Pitch)
%			Z = angle de rotation en radian par rapport Ã  l'axe Z (Yaw)
% Sortie: 	res = la matrice de rotation (3x3)
%
% Fonction 10
% frame = right_pos(pos,d1)
% Objectif: Détermination de la matrice homogène de configuration de l'outil qui fixe la position pos et l'orientation de l'outil tourné vers l'avant
% Entrées: 	pos = la position (X,Y,Z) souhaitée pour l'outil
%			d1 = distance dans l'axe X_0 du repère 1 au repère 0
% Sortie: 	frame = la matrice homogène (4x4) de configuration de l'outil avec la position souhaité et l'orientation fixée.

%% Schémas Simulink
% On utilise quatre techniques de commande et trois schémas Simulink pour mettre en oeuvre ces techniques. Le schéma 'dynmodel_KUKA_PIDjoint_2014' est utilisé 
% pour les techniques du PID angulaire et la commande opérationelle par MGI; le schéma 'dynmodel_KUKA_CTIjoint' est utilisé pour la commande angulaire par 
% couple calculé; et le schéma 'dynmodel_KUKA_cascade_task_v2014_MOD' est utilisé pour la commande cascade.
%
% Il existent, dans ces modèles, blocs spécifiques 'Matlab functions', avec les fonctions qu'on a crée pour simuler la dynamique du robot. Dans cette catégorie,
% on a le bloc 'MDD_Simulink' qui simule le modèle dynamique direct du robot; le 'MDI_Simulink' qui simule le modèle dynamique inverse du robot; le 
% 'MGD_Simulink' qui simule le modèle géometrique direct du robot; et le Jacobien qui calcule la pseudo-inverse du Jacobien dans chaque instant selon les 
% variables simulées. Le bloc MDD_Simulink est régroupé avec deux intégrateurs dans le sous-système 'Robot' simule tout le comportment dynamique du robot. On a
% aussi un bloc Matlab function pour faire l'intégration de la commande avec la génération de trajectoire, le 'traj_parsing'. Il reçoit le vecteur avec toute la 
% trajectoire et à chaque instant, fourni comme consigne la valeur correspondant à telle instant dans le vecteur. Après la fin du vecteur, il maintien la même
% valeur final comme consigne.Les autres blocs utilisés sont des blocs natives de Simulink.
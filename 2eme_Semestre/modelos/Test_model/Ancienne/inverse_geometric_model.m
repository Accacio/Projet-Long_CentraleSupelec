    function [joint_DHM] = inverse_geometric_model(pos)

% ----- Paramètres géométriques en (m)
d1 = 0.024; % ok
r1 = 0.147; % ok
d2 = 0.033; % ok
d3 = 0.155; % ok
d4 = 0.135; % ok
lend = 0.218; %0.1136; %(base gripper)

% ----- Initialization du vecteur de position angulaire
joint_KUKA = zeros(1,5);

% ----- Obtenir la matrice de position avec orientation horizontale
position = right_pos(pos,d1);

% ----- Supprimer la taille d'outil
invT5end = [eye(3) [0 0 -lend]'; 0 0 0 1];
T05 = position*invT5end;

% ----- Calcul de j1
T1_offset = [eye(3) [-d1 0 -r1]'; 0 0 0 1];
g1 = T1_offset*T05; % mettre le repère dans l'articulation 1
j1 = atan2(aprox(g1(2,4)),aprox(g1(1,4)));
joint_KUKA(1) = j1;

% ----- Calcul de j5
s5 = -sin(j1)*g1(1,1) + cos(j1)*g1(2,1);
s5 = aprox(s5);
c5 = -sin(j1)*g1(1,2) + cos(j1)*g1(2,2);
c5 = aprox(c5);
j5 = atan2(s5,c5);
joint_KUKA(5) = j5;

% ----- Projection du repère dans le plan du bras du robot
% Utilité: trouver une configuration réalisable
rot_z = [cos(-j1) -sin(-j1) 0; sin(-j1) cos(-j1) 0; 0 0 1];
T2_offset1 = [rot_z [0 0 0]'; 0 0 0 1];
T2_offset2 = [eye(3) [-d2 0 0]'; 0 0 0 1];
g2 = T2_offset2*T2_offset1*g1; % mettre le repère dans l'articulation 2
y_t_hat = g2(1:3,2)'; % orientation d'outil en y
z_t_hat = g2(1:3,3)'; % orientation d'outil en z
m_hat = [0 1 0]; % vecteur normal au plan du bras
k_hat = cross(m_hat,z_t_hat);
z_t = cross(k_hat,m_hat); % nouvelle orientation d'outil en z
cos_theta = dot(z_t_hat, z_t);
sin_theta = dot(cross(z_t_hat,z_t), k_hat);
% formula de rotation de Rodrigues pour trouver l'orientation d'outil en y
y_t = (cos_theta * y_t_hat) + (sin_theta * cross(k_hat,y_t_hat)) ...
      + (1 - cos_theta) * dot(k_hat, y_t_hat) * k_hat;
x_t = cross(y_t,z_t); % nouvelle orientation d'outil en x
rot_end = [x_t' y_t' z_t'];
g2_proj = [rot_end g2(1:3,4); 0 0 0 1];
% Définir tous les valeurs qui sont proches de zero comme zero
for i = 1:3
    for j = 1:3
        if abs(g2_proj(i, j)) < 0.0001
            g2_proj(i, j) = 0;
        end
    end
end

% ----- Calcul de j234
c234 = aprox(T05(3,3));    
s234 = aprox(- T05(1,3)*cos(j1) - T05(2,3)*sin(j1));
% if c234 < 0
%     delta4 = pi;
% else
%     delta4 = 0;
% end
% j234 = wrapToPi(atan(s234/c234)+delta4);
j234 = atan2(s234,c234);

% %// In the arm's subplane, offset from the end-effector to the fourth joint
% g2_proj(1,4) = g2_proj(1,4) - lend * s234;
% g2_proj(1,3) = g2_proj(1,3) - lend * c234;


% ----- TODO: check if the position is reachabel

% ----- Calcul de j3
c3 = aprox((norm(g2_proj(1:3,4)')^2 - d3^2 - d4^2)/(2*d3*d4));
% if c5 < 0
%     delta3 = pi;
% else
%     delta3 = 0;
% end
% j3 = wrapToPi(atan(sqrt(1-c3^2)/c3)+delta3);
j3 = atan2(sqrt(1-c3^2),c3);
joint_KUKA(3) = -j3;

% ----- Calcul de j2
% delta2 = 0;
% if g2_proj(1,4) < 0
%     delta2 = delta2 + pi;
% end
% if (d3 + d4*cos(-j3)) < 0
%     delta2 = delta2 + pi;
% end
% j2 = wrapToPi(atan(g2_proj(3,4)/g2_proj(1,4)) + delta2 + atan(d4*sin(-j3)/(d3 + d4*cos(-j3))));
j2 = -atan2(g2_proj(3,4),g2_proj(1,4)) - atan2(d4*sin(j3),(d3 + d4*cos(j3)));
joint_KUKA(2) = - j2;

% ----- Calcul j4
j4 = wrapToPi(j234 - joint_KUKA(2) - joint_KUKA(3));
joint_KUKA(4) = j4;

% ----- Convention DHM
offset = [0 +pi/2 0 -pi/2 0]; % th_DHM = -th_KUKA + offset
joint_DHM = -joint_KUKA + offset;

end
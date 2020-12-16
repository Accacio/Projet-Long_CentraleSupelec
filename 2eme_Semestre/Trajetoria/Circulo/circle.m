aP = [rand(3,3); [1 1 1]];
%aP = [rand(3,3); [1 1 1]];
aP(1:3,3)=aP(1:3,1)+[0.0001 0.0001 0.0001]';
bTa = align_plane_3_points(aP);
bP = bTa*aP;
%%

[center, radius] = calc_circle(bP(1:2,1)',bP(1:2,2)',bP(1:2,3)'); 

Ox = bP(1:2,1)' - center;
theta_z = -atan2(Ox(2),Ox(1)); %Angulo entre O-P1 e o eixo x do referencial B
rot_z = rot(theta_z,'z');   %Matriz de rotação que alinha o p1 com o eixo x

cTb = rot_z*[eye(4,3) [-center 0 1]'];  %Matriz de transformação: Primeiro uma translação e depois uma rotação
cP = cTb*bP;
centerc = cTb*[center cP(1,3) 1]';

phi_max = atan2(cP(2,3),cP(1,3));
T = 1e-3;  %Periodo de amostragem
tf = 1e-1;
n = tf/T;    %numero de pontos
[Cx,Cy] = circle_arc_pts([0 0],radius,phi_max,n,tf);  %Cria o arco de circunferencia

cTa = cTb*bTa;
aTc = [cTa(1:3,1:3)' -cTa(1:3,1:3)'*cTa(1:3,4);[0 0 0 1]];  %Matriz da transformação inversa, leva os pontos de volta ao espaco 3d

cCircle = [Cx; Cy; repmat(cP(3,1),1,n); ones(1,n)]; %Pontos do circulo no tempo
aCircle = aTc*cCircle;  %Mesmos pontos no referencial original
aCenter = aTc*centerc;

fig = scatter3(aP(1,1),aP(2,1),aP(3,1),'o','r');
hold on
scatter3(aP(1,2),aP(2,2),aP(3,2),'o','g'); scatter3(aP(1,3),aP(2,3),aP(3,3),'o','b');
hold on
anim(aCircle(1,1:n),aCircle(2,1:n),aCircle(3,1:n),n);


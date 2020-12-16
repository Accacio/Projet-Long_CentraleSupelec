p1 = [0,0,0]'
p2 = [1,1,1]'
p3 = [0,0,0]'
tf = 10;
T = 0.1;
t = 0:T:tf
Px =  (10*(t/tf).^3-15*(t/tf).^4+6*(t/tf).^5);
Py =  (10*(t/tf).^3-15*(t/tf).^4+6*(t/tf).^5);
Pz =  (10*(t/tf).^3-15*(t/tf).^4+6*(t/tf).^5);
Vx = 30*(t/tf).^2-60*(t/tf).^3+30*(t/tf).^4;
Vy = 30*(t/tf).^2-60*(t/tf).^3+30*(t/tf).^4;
Vz = 30*(t/tf).^2-60*(t/tf).^3+30*(t/tf).^4;

fig = figure
subplot(3,3,1)
plot(t,Px)
title('Position en x')
grid on
subplot(3,3,2)
plot(t,Py)
title('Position en y')
grid on
subplot(3,3,3)
plot(t,Pz)
title('Position en z')
grid on
subplot(3,3,4)
plot(t,Vx)
title('Vitesse en x')
grid on
subplot(3,3,5)
plot(t,Vy)
title('Vitesse en y')
grid on
subplot(3,3,6)
plot(t,Vz)
grid on
title('Vitesse en z')


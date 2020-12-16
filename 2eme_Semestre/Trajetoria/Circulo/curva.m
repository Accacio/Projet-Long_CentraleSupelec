t = linspace(0,1,500);
tf = 1;

s = 10*(t/tf).^3 -15*(t/tf).^4 +6*(t/tf).^5;    %Abcissa curvilinea s em função do tempo
ds = (30/tf)*(t/tf).^2-(60/tf)*(t/tf).^3+(30/tf)*(t/tf).^4;     %derivada de s em relação ao tempo
ds2 = (60/tf^2)*(t/tf) -(180/tf^2)*(t/tf).^2 +(120/tf^2)*(t/tf).^3;     %segunda derivada de s em relação ao tempo

k = 2*pi; 

Px = cos(s*k);        %Posição x em função do tempo
Py = sin(s*k);        %Posição y em função do tempo 

dPx = -(ds*k).*sin(s*k);  %Velocidade em x
dPy = (ds*k).*cos(s*k);   %Velocidade em y

dPx2 = -(ds2*(k)^2).*sin(s*k) - ds2.*cos(s*k)*(k)^2;
dPy2 = (ds2*(k)^2).*cos(s*k) - ds2.*sin(s*k)*(k)^2;

fig1 = figure;
plot(Px,Py);    %Curva no espaço
title('Curva x vs y no espaço')

fig2 = figure;
subplot(3,2,1)
plot(t,Px)
title('Position en x vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-5.8,0,5.8],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')
grid on
subplot(3,2,2)
plot(t,Py)
title('Position en y vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-5.8,0,5.8],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')

grid on
subplot(3,2,3)
plot(t,dPx)
title('Vitesse en x vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-1000,0,1000],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')


grid on
subplot(3,2,4)
plot(t,dPy)
title('Vitesse en y vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-1000,0,1000],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')

grid on
subplot(3,2,5)
plot(t,dPx2)
title('Accélération en x vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-1000,0,1000],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')

grid on
subplot(3,2,6)
plot(t,dPy2)
grid on
title('Accélération en y vs Temps')
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-1000,0,1000],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')

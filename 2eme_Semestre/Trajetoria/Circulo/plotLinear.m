t = linspace(0,1,500);
tf = 1;

r = 10*(t/tf).^3-15*(t/tf).^4+6*(t/tf).^5;
dr = 30*(t/tf).^2-60*(t/tf).^3+30*(t/tf).^4;
ddr = 60*(t/tf)-180*(t/tf).^2+120*(t/tf).^3;

fig1 = figure;
subplot(3,1,1)
plot(t,r)
title('$$r(t)$$','interpreter','latex','FontSize',16)
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',0:0.5:1,'YTickLabel',{'0','0.5','1'})
grid on

subplot(3,1,2)
plot(t,dr)
title('$\dot{r}(t)$','interpreter','latex','FontSize',16)
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[0,1.87],'YTickLabel',{'$$0$$','$$\frac{15}{8\cdot tf}$$'},'TickLabelInterpreter','latex')
grid on

subplot(3,1,3)
plot(t,ddr)
grid on
title('$\ddot{r}(t)$','interpreter','latex','FontSize',16)
set(gca,'Xtick',0:0.2:1,'XTickLabel',{'0','0.2*tf','0.4*tf','0.6*tf','0.8*tf','tf'})
set(gca,'Ytick',[-5.8,0,5.8],'YTickLabel',{'$$$$','$$0$$','$$\frac{10}{\sqrt{3}\cdot tf}$$'},'TickLabelInterpreter','latex')

%%
print('C:\Users\Rafael\Documents\MATLAB\Fig1.png','-dpng')

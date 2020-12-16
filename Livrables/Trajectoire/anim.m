function [null] = anim(x,y,z,len)
% scatter3(x(1),y(1),z(1),'o','r');
xlim=[min(x)-0.2*abs(min(x)) max(x)+0.2*abs(max(x))];
ylim=[min(y)-0.2*abs(min(y)) max(y)+0.2*abs(max(y))];
zlim=[min(z)-0.2*abs(min(z)) max(z)+0.2*abs(max(z))];
set(gca,'XLim',xlim,'YLim',ylim,'ZLim',zlim)
view(40,35)
grid on

hold on
% scatter3(x(end),y(end),z(end),'o','g');
for i = 1:len 
scatter3(x(i),y(i),z(i),'.','k');
pause(1/len);
end
hold off
end
function [Px,Py] = circle_arc_pts(center,radius,phi_max,npts,tf)
%Returns the points (x,y) of the circle with from phi = 0 to phi_max with
%npts points in tf seconds

if phi_max < 0
   phi_max = phi_max + 2*pi; 
end

t = linspace(0,tf,npts);

s = 10*(t/tf).^3 -15*(t/tf).^4 +6*(t/tf).^5;    %Curvilinear Abcissa s in function of time

Px = radius*cos(s*phi_max) + center(1);
Py = radius*sin(s*phi_max) + center(2);
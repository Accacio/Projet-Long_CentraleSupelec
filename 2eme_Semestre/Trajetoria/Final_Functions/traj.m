function [ P ] = traj( p1,p2,p3,type,tf,T,ani)
%TRAJ Function that generates linear, arc of circle or circle trajectories
% [P] = traj( p1,p2,p3,type,tf,T)
% 
% P = Array of Trajectories (3xN) N=tf/T
% p1 - First Point (3x1)
% p2 - Second Point (3x1)
% p3 - Last Point (3x1)
% type - Type of Trajectory (char)
% tf - Final Time (float)
% T - Sampling Time (float)
%  
%  Types of Trajectory 
%   'l' - linear 
%   'a' - arc of circle
%   'c' - circle
% 
%  Obs:
%  In linear case ('l') p3 will be ignored
%        
N=tf/T;
t = linspace(0,tf,N);
s = 10*(t/tf).^3 -15*(t/tf).^4 +6*(t/tf).^5;

switch type
   case 'l'
        P=repmat(p1,1,N)+(p2-p1)*s;
%    case 'c'
%       P=nan;
   case {'a','c'}
        aP=[p1,p2,p3;[1 1 1]];
        bTa = align_plane_3_points(aP);
        bP = bTa*aP;
        
        [center, radius] = calc_circle(bP(1:2,1)',bP(1:2,2)',bP(1:2,3)'); 

        Ox = bP(1:2,1)' - center;
        theta_z = -atan2(Ox(2),Ox(1)); %Angle between O-p1 and the x axis in the B frame
        rot_z = rot(theta_z,'z');   % Rotation Matrix to allign p1 and x axis

        cTb = rot_z*[eye(4,3) [-center 0 1]'];  % Transformation Matrix: First Translation and then a Rotation
        cP = cTb*bP;
        centerc = cTb*[center cP(1,3) 1]'; % Center of the circle in frame C
        
        
        if(type=='a')
            phi_max = atan2(cP(2,3),cP(1,3));
        end
        if(type=='c')
            phi_max=2*pi;
        end
        
        [Cx,Cy] = circle_arc_pts([0 0],radius,phi_max,N,tf);  % Creates arc of circunference  

        cTa = cTb*bTa; % Transformation Matrix from frame A to C
        aTc = [cTa(1:3,1:3)' -cTa(1:3,1:3)'*cTa(1:3,4);[0 0 0 1]];  % Inverse of cTa

        cCircle = [Cx; Cy; repmat(cP(3,1),1,N); ones(1,N)]; % Points of the circle
        aCircle = aTc*cCircle;  % Same points in the initial frame (A)
        aCenter = aTc*centerc;  
        
        
        P=aCircle(1:3,:);
   otherwise
      disp(['Error - Types are ''l'' ''c'' or ''a'' '])
      P=nan;
end

if(ani==1)
    anim(P(1,:),P(2,:),P(3,:),N);
else

end



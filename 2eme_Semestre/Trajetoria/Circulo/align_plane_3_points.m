function [bTa] = align_plane_3_points(aP) 
%Returns the homogeneous rotation matrix bTa which transforms to the
%perspective of the plane that contains the 3 points. aP must be the
%homogeneous matrix of the three points in correct order

%bP = bTa*aP    changes the frame of reference from A to B
                                                
%Need to check for colinearity (no check in this function)


v = cross(aP(1:3,2)-aP(1:3,1),aP(1:3,3)-aP(1:3,2));     %Vector normal to the plane that contains the 3 points
v = [v/norm(v); 0];

theta_z = -atan2(v(2),v(1)); %Angle between v and the zx plane
rot_z = rot(theta_z,'z');  %Matrix of the rotation in z

v_proj = rot_z*v;

theta_y = -atan2(v_proj(1),v_proj(3)); %Angle between the projection of v in xz and the z axis 
rot_y = rot(theta_y,'y');  %Matrix of the rotation in y

bTa = rot_y*rot_z; %Matrix of the complete transformation

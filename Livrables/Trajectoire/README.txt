Trajectory Functions	Version 1.0 16/06/2017

Contact INFO: To report bugs or ask help with the functions, get in contact with Rafael through the 
email: rafael.eller.cruz@gmail.com

All functions were written and debugged with MATLAB 2015b. It shouldn't have major compatibility problems with other recent versions,
but be aware of the possibility of deprecated functions. 

-------------------------------------------------------------------------------------------------------------------------------------
The Trajectory functions are a collection that consists of 6 MATLAB scripts written in order to implement a trajectory
generator that plans the movement of the end-effector of a robot in terms of 3 basic types of trajectories: Linear, Circular
and Arc of Circle. The basic hierarchy of the scripts is the following:

			|-----------------------|<--------------------------------------|
	|-------------->|	Traj.m		|<----------------------|		|
	|	    	|-----------------------|<-\			|		|
	|	    		^		    \ 			|		|
|-----------------------|  	|		     \ 			|		|
|allign_plane_3_points.m|	|		      \			|		|
|-----------------------|  	|		       \		|		|
		    ^		|		        \		|		|
		    |		|			 |		|		|
		    |	|-------------|    |-------------------| |--------------| |-------------|
		    |---|   rot.m     |	   | circle_arc_pts.m  | |calc_circle.m | |  anim.m     |
			|-------------|	   |-------------------| |--------------| |-------------| 

This hierarchy expresses the dependencies between the scripts, so the 4 basic scripts only need primitive MATLAB functions while
Traj.m needs all of the others to work. The functions implement mostly geometric calculations so knowledge of basic
geometry and some homogeneous coordinates might be in order (for a reference, see the second chapter of W. Khalil, 
E. Dombre - "Modeling Identification and Control Robots", or search for homogeneous coordinates for computer graphics).

All the trajectories have a quintic polynomial profile, which means that the curvilinear position (the position along
a given curve, thus 1 dimensional) is a 5th degree polynomial of the time. For more information check the chapter 13 of 
W. Khalil, E. Dombre - "Modeling Identification and Control Robots".

Remember to add all the functions to your path variable in MATLAB!

------------------------------------------------------------------------------------------------------------------------------------- 
|--------|
| rot.m  |
|--------|

function [bTa] = rot(theta,axis)

This function generates a rotation matrix of theta radians in one of the axis 'x', 'y' or 'z'. The matrix bTa is 4x4. It is used
primarily to perform frame transformations. To find the inverse of a rotation matrix you just need to transpose the 3x3 upper-left
submatrix (A very good reason why we use homogeneous coordinates instead of normal cartesian ones). 

------------------------------------------------------------------------------------------------------------------------------------- 
|-------------------|
| calc_circle.m     |
|-------------------|

function [centre radius] = calc_circle(pt1, pt2, pt3)

This function calculates the center and radius of the single circle that passes through the 3 given points pt1 to pt3. The inputs are
given IN ONLY 2 DIMENSIONS and are line vectors.
 
------------------------------------------------------------------------------------------------------------------------------------- 
|-------------------------|
| allign_plane_3_points.m |
|-------------------------|

function [bTa] = align_plane_3_points(aP)

The matrix aP is a 4*3 matrix of 3 vectors in homogeneous coordinates. This function returns the rotation matrix which aligns the 
plane that contains these points with the xy plane. It is used to make easier the job of drawing a circular curve, which is easier to
think in purely 2 dimensional terms instead of 3D. The order of the points in aP makes a difference since the matrix will rotate the
points in order to make the cross product of (p2-p1) by (p3-p2) point in the positive z-axis direction. In the traj.m function this
will determine the sense of the rotation from the initial point to the final one.    

------------------------------------------------------------------------------------------------------------------------------------- 
|--------------------|
| circle_arc_pts.m   |
|--------------------|

function [Px,Py] = circle_arc_pts(center,radius,phi_max,npts,tf)

This function returns two 1xnpts vectors Px and Py which are the trajectory of an arc of circle going from 0 to a angle phi_max. It is
used to draw the arc of circle and takes into account the time distribution of the curve, thus the final time tf.

------------------------------------------------------------------------------------------------------------------------------------- 
|----------|
| anim.m   |
|----------|

function [null] = anim(x,y,z,len)

This function is design to help visualize the trajectories calculated by the other functions. It takes as input the vectors x,y,z
containing the coordinates of each point of the trajectory and its size 'len' and prints a animation of the points being traversed in order.


------------------------------------------------------------------------------------------------------------------------------------- 
|--------|
| traj.m |
|--------|


function [ P ] = traj( p1,p2,p3,type,tf,T,ani)

The main function in this collection, traj takes as input 3 vectors p1 to p3 each one 3x1 that define respectively initial point, 
intermediate point and final point, the type of trajectory ('l': linear,'c': circular, 'a': arc of circle), the final time 'tf', 
the sampling period 'T' and a flag for the animation functionality (1: animation on, 0: animation off) which displays the curve in 
a 3D scattermap. In the case of a linear trajectory the 3rd point will be ingored but it must be written nevertheless.
The way this function works is, for the 'c' and 'a' cases, it performs a series of translations and rotations in order to position the
three points in the xy plane with the center of the circunference in zero and the first point in the x axis, then it calculates all the
points of the curve given in this frame of reference and afterwards it multiplies all points by the inverse of all the transformations
matrixes returning to the original frame.
In the linear case it simply calculates the trajectory using a quintic polynomial. 
It returns the 3xN matrix P of all the points of trajectory where N = tf/T.

  

ROS exploratory script	Version 1.0 16/06/2017

Contact INFO: To report bugs or ask help with the functions, get in contact with Rafael through the 
email: rafael.ellercruz@supelec.fr

All functions were written and debugged with MATLAB 2015b. It shouldn't have major compatibility problems with other recent versions,
but be aware of the possibility of deprecated functions. 

---------------------------------------------------------------------------------------------------------------

This is an exploratory script, it's not supposed do anything beyond
seeing how the MATLAB ROS interface works. With Gazebo already running
the youbot simulation
you need to connect to the ROS network using the command 'rosinit('192.168.26.128')' 
(the address of the network might change, but this exact command should work
if you are working with the virtual machine described in the report). Then
the following commands will define a subscriber of the states of the joints
of the robot which messages can be read in 'statedata'. We also define
the publisher 'com' which controls the joint positions of the robot. 
The messages in 'comdata' are sent to apply different positions of the youbot,
run each one and observe the robot moving. In each position check the
joint position information in the message 'statedata'.

We recommend the tutorials in https://fr.mathworks.com/help/robotics/examples/get-started-with-ros.html

% This is an exploratory script, it's not supposed do anything beyond
% seeing how the MATLAB ROS interface works. With Gazebo already running
% the youbot simulation
% you need to connect to the ROS network using the command 'rosinit('192.168.26.128')' 
% (the address of the network might change, but this exact command should work
% if you are working with the virtual machine described in the report). Then
% the following commands will define a subscriber of the states of the joints
% of the robot which messages can be read in 'statedata'. We also define
% the publisher 'com' which controls the joint positions of the robot. 
% The messages in 'comdata' are sent to apply different positions of the youbot,
% run each one and observe the robot moving. In each position check the
% joint position information in the message 'statedata'.


state = rossubscriber('/arm_1/arm_controller/state');
statedata = receive(state,5);
com = rospublisher('/arm_1/arm_controller/command');
comdata = rosmessage('trajectory_msgs/JointTrajectory');
%%
comdata.JointNames = statedata.JointNames;
comdata.Points = statedata.Actual;
comdata.Points.Positions = [0;0;0;0;0];
comdata.Points.Accelerations = [0.1;0.1;0.1;0.1;0.1];
comdata.Points.Velocities = [0.1;0.1;0.1;0.1;0.1];
comdata.Points.TimeFromStart.Sec = 1;
send(com,comdata);

%%
comdata.Points.Positions = [0;0;0;0;0];
send(com,comdata);
statedata = receive(state,5);
%%
comdata.Points.Positions = [pi/2;0;0;0;0];
send(com,comdata);
statedata = receive(state,5);
%%
comdata.Points.Positions = [pi/2;pi/4;0;0;0];
send(com,comdata);
statedata = receive(state,5);
%%
comdata.Points.Positions = [pi/2;pi/4;-pi/2;0;0];
send(com,comdata);
statedata = receive(state,5);
%%
comdata.Points.Positions = [pi/2;pi/4;-pi/2;pi;0];
send(com,comdata);
statedata = receive(state,5);
%%
comdata.Points.Positions = [pi/2;pi/4;-pi/2;pi;pi];
send(com,comdata);
statedata = receive(state,5);
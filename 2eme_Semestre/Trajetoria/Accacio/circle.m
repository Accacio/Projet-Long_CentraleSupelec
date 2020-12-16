%% Given 3 points, find semi circle
clear all
close all


x1=[0; 0]
x2=[1; 1]
x3=[2; 1]


t=0:0.1:pi
O=[1 0];
r=2
plot(O(1)+r*cos(t),O(2)+r*sin(t))
xlim([-5,5])
ylim([-5,5])
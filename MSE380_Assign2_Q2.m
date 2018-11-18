clear; clc; close all

b =20;
k =500;
k_theta = 1000;
b_theta = 80;
p =7874;
L =0.15;
r =0.75;
h =0.1;
m = p*L*L*L;
j = 0.5*(p*h*pi*(r^2))*(r^2);

b1 = [1/m;0;0;0];
b2 = [1;0;0;0];

A = [-b/m -1/m 0 b*r/m; k 0 0 -r*k; 0 0 0 k_theta; r*b/j r/j -1/j -(b_theta+b*r*r)/j];
B = [b1,b2];
C = [0 0 1/k_theta 0;0 1/k r/k_theta 0];
D = 0;

sys = ss(A,B,C,D);
t_Final = 30;

% figure
% impulse(sys,t_Final);
% figure
% step(sys,t_Final);
% figure
% bode(sys);

%Let's Determine the Transfer Function

tf(sys)



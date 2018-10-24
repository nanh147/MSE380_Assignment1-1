%%mathematical model
%% input
dt = 0.01;
t = 0:dt:15;
t_mat = vec2mat(t,1); %number of rows = number of time samples
b=20;
k=500;
k_theta = 1000;
b_theta = 80;
p=7874;
L=0.15;
r=0.75;
h=0.1;
m = p*L*L*L;
j = 0.5*(p*h*pi*(r^2))*(r^2);
%% system matrices
%%input
a = [-b/m -1/m 0 0; k 0 -k*r 0 ; b*r/j r/j -b_theta/j -1/j; 0 0 k_theta 0];
b1 = [1/m 1; 0 0; 0 m*r/j; 0 0]; %%2 columns for 2 inputs ft & g
%%output
c = [0 1/k 0 0; 0 0 0 1/k_theta];
d = [0 0;0 0]; %%2 columns for 2 inputs ft & g
sys = ss(a,b1,c,d);
%% state vectors
n=15/dt;
x = zeros(4,n);
x_diff = [0;0;0;0];
ft(1,1:(n+1))=0;
ft(1,1)=100;
g(1,1:n+1) = 9.81;
u = [ft' g']; %%number of rows = number of time samples, number of columns = number of inputs
y = lsim(sys,u,t_mat);
%% plot
figure;
plot(t_mat,y);
title('Matlab Function State Models Part c');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Linear displacement','Angular displacement');

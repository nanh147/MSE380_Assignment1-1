%%mathematical model
%% input
dt = 0.01;
t = 0:dt:15;
t_mat = vec2mat(t,1);
b=20;
k=500;
k_theta = 1000;
b_theta = 80;
p=7874; %%densityj = 0.5*(p*h*pi*(r^2))*(r^2);
L=0.15; %%mass element side length
r=0.75; %%inertia radius
h=0.1; %%inertia thickness
m = p*L*L*L;
j = 0.5*(p*h*pi*(r^2))*(r^2); %%use mass of inertia
%% system matrices
%%input
a = [0 1 0 -r; -k/m -b/m 0 0; 0 0 0 1; k*r/j b*r/j -k_theta/j -b_theta/j];
b1 = [0; 1/m; 0; 0];
b2 = [0; 1; 0; 0];
%%output
c = [1 0 0 0; 0 0 1 0];
d1 = [0;0];
d2 = [0;0];
%% state vectors
n=15/dt;
x = zeros(4,n);
x_diff = [0;0;0;0];
y = zeros(2,n);
ft(1,1:(n+1))=0;
ft(1,1:(n+1))=100;
g(1,1:(n+1)) = 9.81;
i=1;
for t = 0:dt:15
    x_diff = a*x(:,i) + b1.*ft(:,i) + b2.*g(:,i);
    x(:,i+1) = x(:,i) + x_diff.*dt;
    y(:,i) = c*x(:,i) + d1.*ft(:,i) + d2.*g(:,i);
    i=i+1;
end
%% plot
figure;
plot(t_mat,y(1,:),t_mat,y(2,:));
title('Euler Method State Models Part b');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Linear displacement','Angular displacement');

%%mathematical model
%% input
dt = 0.01;
t = 0:dt:15;
t_mat = vec2mat(t,1);
b=20;
k=500;
k_theta = 1000;
b_theta = 80;
p=7874;
L=0.15;
r=0.75;
h=0.1;
m = p*L*L*L;
j = 0.5*m*r^2;
%% system matrices
%%input
a = [-b/m -1/m 0 0; k 0 0 0 ; 0 0 0 1; -b*r/j -r/j -b_theta/j -1/j];
b1 = [1/m; 0; r/j; 0];
b2 = [1/m; 0; r/j; 0];
%%output
c = [0 1/k 0 0; 0 0 0 1/k_theta];
d1 = [0;0];
d2 = [0;0];
%% state vectors
n=15/dt;
x = zeros(4,n);
x_diff = [0;0;0;0];
y = zeros(2,n);
ft=[];
ft(1:1,1:n+1)=0;
ft(1,1)=100;
g(1:1,1:n+1) = 9.81;
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
title('Euler Method State Models Part c');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Linear displacement','Angular displacement');
dt = 0.005;
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
j = 0.5*(p*h*pi*(r^2))*(r^2);
a = [-b/m -1/m 0 b*r/m; k 0 0 -r*k; 0 0 0 k_theta; r*b/j r/j -1/j -(b_theta+b*r*r)/j];
bf = [1/m;0;0;0];
bg = [1;0;0;0];
c = [0 0 1/k_theta 0;0 1/k r/k_theta 0];
%%c = [0 0 1/k_theta 0; 1/k 0 0 0];
d=0;
n=15/dt;
x = zeros(4,n);
x_diff = [0;0;0;0];
y = zeros(2,n);
ft=[];
ft(1:1,1:n+1)=0;
ft(1,1)=100;
g(1:1,1:n+1) = 9.81;
i=1;
d1 = [0;0];
d2 = [0;0];
for t = 0:dt:15
    x_diff = a*x(:,i) + bf.*ft(:,i) + bg.*g(:,i);
    x(:,i+1) = x(:,i) + x_diff.*dt;
    y(:,i) = c*x(:,i) + d1.*ft(:,i) + d2.*g(:,i);
    
    i=i+1;
end
figure;
plot(t_mat,y(2,:),t_mat,y(1,:));
title('Euler Method State Models Part c');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Linear displacement','Angular displacement');
t = 0:0.005:15;
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
j = (pi*0.75^4)/32;
a = [b/m 0 k/m 0;-b*r/j b_theta/j -r*k/j k_theta/j;1 0 0 0;0 1 0 0];
b = [-1/m -1;-r/j -r*m/j;0 0;0 0];
c = [0 0 1/k 0;0 0 0 1/k_theta];
d=0;
x = [0;0;0;0];
x_diff = [0;0;0;0];
y=[];
n=15/0.005;
ft(1:1,1:n+1) =0;
ft(1,1) = 100;
i=0;
g(1:1,1:n+1) = 9.81;
ut = [ft;g];
for t = 0:0.005:15
    i = i+1;
    x = x + x_diff*0.005;
    x_diff = a*x+b*ut(:,i);
    y = [y c*x];
end
figure
p = plot(t_mat,y(1,:));
hold on
figure
p2 = plot(t_mat,y(2,:));
hold on
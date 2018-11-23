%close all; clear all; clc;
% %% input
% r = 0.4;
% co = 1970; %specific heat oil
% po = 850;
% ds = 0.05;
% k = 2;
% l = 1;
% cw = 4190; %specific heat water
% pw = 1000;
% h = 100;
% To = 100;
% Ro = 0.001;
% Co = po*(4/3)*pi()*(r^3)*co; %sphere thermal capacitance
% Cw = pw*(l^3)*cw; %tank thermal capacitance
% % Rc = Ro*(To/Tw); %convective resistance
% Rk = ds/(k*4*pi()*(r^2)); %conductive resistance

% %% system matrices
% A = [-1/(Co*Rk) 1/(Co*Rk); 1/(Cw*Rk) -1/(Cw*Rk)-(2*Tw-T_amb)/(Cw*Ro*To)];
% B = [0; Tw/(Ro*To)];
% C = [1 0;0 1];
% D = [0;0];
% sys = ss(A,B,C,D);
T_amb_discrete = [10 13 16 19 23 24 22 20 17 14 10];
hours = 0:length(T_amb_discrete)-1;
Time = 0:(length(T_amb_discrete)-1)*3600-1; %hours -> seconds
T_amb = interp1(hours,T_amb_discrete,Time/3600,'spline');
% T_in = lsim(sys,T_amb,Time,[150 20]); %initial water temp = 20
%% ode 
T_initial = [150 20]; %Toil(0) = 150C, Tw(0) = 20C
tspan = Time;
[t,y] = ode45(@temp,tspan,T_initial);
plot(t,y);
                                                                                                            
% %% plot
% plot(Time/3600,T_in,'linewidth',1.5);
% hold on
% % plot(hours,T_amb_discrete)
% plot(Time/3600,T_amb,'k','linewidth',1.5)
% title('Temperature vs Time');
% xlabel('Time (hrs)');
% ylabel('Temperature (C)');
% legend('Sphere Temperature','Tank Temperature','Ambient Temperature (interpolated)');
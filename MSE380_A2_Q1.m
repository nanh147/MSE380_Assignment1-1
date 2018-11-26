close all; clear; clc;
T_amb_discrete = [10 13 16 19 23 24 22 20 17 14 10];
hours = 0:length(T_amb_discrete)-1;
Time = 0:(length(T_amb_discrete)-1)*3600-1; %hours -> seconds
T_amb = interp1(hours,T_amb_discrete,Time/3600,'spline');
% T_in = lsim(sys,T_amb,Time,[150 20]); %initial water temp = 20
%% ode 
T_initial = [150 20]; %Toil(0) = 150C, Tw(0) = 20C
tspan = Time;
[t,y] = ode45(@temp,tspan,T_initial);                                                                                            
%% plot
plot(t/3600,y,hours,T_amb_discrete,'o',t/3600,T_amb,'--');
title('Temperature of Oil Sphere, Water Tank and Ambience vs Time');
xlabel('Time (hrs)');
ylabel('Temperature (C)');
legend('Sphere Temperature','Tank Temperature','Discrete Ambient Temperature','Interpolated Ambient Temperature');
%Test program to simulate the wheelchair
%% Parameters
h = 70; %height of the foot link (fixed)
%l1 = 12;
%l2 = 8; %lengths of trunk and thigh bars
l1 = 55.4592;
l2 = 100.6364;
s1 = 44.76;
s2 = 45.3387;
alpha = .3719;                                              %for thigh
beta = .5921;                                               %for head plus trunk
gamma = .95;                                                %for auxillary link 1 (s1)
delta = .05;                                                %for auxillary link 2 (s2)
lc1 = alpha * l1;
lc2 = beta * l2;
lac1 = gamma * s1;
lac2 = gamma * s2;

%% Kinematics Test

q = deg2rad([0,90]); %test angles
q1 = q(1);
q2 = q(2);
close all
[Ax,Ay,Bx,By] = WheelchairKinematics(q1,q2,l1,l2,h);
PlotWheelchair(Ax,Ay,Bx,By,h);

%% Parallelogram Stucture Kinematics

%s1 = 0.4*l1; %test values
%s2 = 0.8*l2;
d = 30;
w = 20; %width of wheelchair seat

s1_points = s1.*[cos(q1) sin(q1)] + [0 h];
s1x = s1_points(1); s1y = s1_points(2);
s2_points = [Ax Ay] + s2.*[cos(q1+q2) sin(q1+q2)];
s2x = s2_points(1); s2y = s2_points(2);
close all
PlotWheelchairFull(Ax,Ay,Bx,By,h,s1x,s1y,s2x,s2y,d,s1,s2,q1,q2,w);

%% Dynamics


m1 = 10.27;
m2 = 62.91;
ma1 = 10;
ma2 = 10;
I1 = m1*l1^2;
I2 = m2*l2^2;
Ia1 = ma1*(l1-s1)^2;
Ia2 = ma2*s2^2;
time = 4;
qd1 = 0;
qd2 = 0;
ic = [q1 qd1 q2 qd2];
options = odeset('RelTol',1e-4,'AbsTol',1e-8*ones(1,4)); % solver options

[T,Y] = ode45(@(t,y) WheelchairDynamics(t,y,m1,m2,ma1,ma2,l1,l2,I1,I2,Ia1,Ia2,s1,s2,d,lc1,lc2,lac1,lac2),[0 time],ic,options); % Solve ODE
y = interp1(T,Y,linspace(min(T),max(T)));
AnimateWheelchair(l1,l2,h,d,w,y,time,s1,s2);

%% Total Energy Plot
[en,k,v] = WheelchairEnergy(m1,m2,ma1,ma2,l1,l2,I1,I2,Ia1,Ia2,Ia1,Ia2,d,h,s1,s2,Y);
close all
n = size(en); %Used to match dimensions while plotting
t = linspace(0,time,n(1));
plot(t,en,'k--',t,k,'r',t,v,'b')
legend('Total Energy','Kinetic Energy','Potential Energy','Location','northwest')
xlabel('Time (sec)')
ylabel('Energy')









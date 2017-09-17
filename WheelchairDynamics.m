function dy = WheelchairDynamics(t,y,m1,m2,ma1,ma2,l1,l2,I1,I2,Ia1,Ia2,s1,s2,d,lc1,lc2,lac1,lac2)

q1 = y(1);
qd1 = y(2);
q2 = y(3);
qd2 = y(4);

dy = zeros(4,1);
    
tau1 = 1000*100;
tau2 = 500*100;

g = 9.81;

M = m1+ma1+m2+ma2;
d1 = d;
d2 = l1-s1;

%k1 = 0;
%k2 = 0;
%calculating k1 and k2
k1 = -M*g/d1; %negative sign for compression spring
k2 = M*g*s1/(d1*d2);



dy(1) = y(2);
dy(3) = y(4);

%Dynamics Eq: A*qdd + H*qd * K + G = T

qd = [qd1;qd2];

A = [I1 + I2 + Ia1 + Ia2 + m1*lc1^2 + m2*l1^2 + m2*lc2^2 + 2*m2*l1*lc2*cos(q2) + ma1*(lac1^2 + s1^2 + 2*s1*lac1 + s2^2) + ma2*(s1^2 + lac2^2 + 2*s1*lac2*cos(q2)),...
    I2 + Ia2 + m2*lc2^2 + m2*l1*lc2*cos(q2) + ma1*(s2^2 + s2*lac1*cos(q2) + s1*s2*cos(q2)) + ma2*(lac2^2 + s1*lac2*cos(q2));...
    I2 + Ia2 + m2*lc2^2 + m2*l1*lc2*cos(q2) + ma1*(s2^2 + s2*lac1*cos(q2) + s1*s2*cos(q2)) + ma2*(lac2^2 + s1*lac2*cos(q2)),...
    I2 + Ia2 + m2*lc2^2 + ma1*s2^2 + ma2*lac2^2];

H = [-m2*l1*lc2*sin(q2)*qd2 - ma2*s1*lac2*sin(q2)*qd2, -m2*l1*lc2*sin(q2)*(qd1+qd2) - ma2*s1*lac2*sin(q2)*(qd1+qd2) - ma1*sin(q2)*(s2*lac1 + s1*s2)*qd2;...
    m2*l1*lc2*sin(q2)*qd1 + ma2*s1*lac2*sin(q2)*qd1, 0];

K = [k1*(d1*s1*cos(q1)+d1*s2*cos(q1+q2)); k1*(d1*s2*cos(q1+q2) + s1*s2*sin(q2)) + k2*d2*s2*sin(q2)];

G = M*g*[s1*cos(q1) + s2*cos(q1+q2); s2*cos(q1+q2)];
%G = g*[m1*lc1*cos(q1) + m2*l1*cos(q1) + m2*lc2*cos(q1+q2); m2*lc2*cos(q1+q2)];

T = [tau1; tau2];

qdd = inv(A) * (T - G - K - H*qd);

%q1_ddot
dy(2) = qdd(1);

%q2_ddot
dy(4) = qdd(2);

end
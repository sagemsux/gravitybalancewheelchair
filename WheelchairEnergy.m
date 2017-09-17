function [en,ke,pe] = WheelchairEnergy(m1,m2,ma1,ma2,l1,l2,I1,I2,Ia1,Ia2,a1,a2,d,h,s1,s2,Y)

q1 = Y(:,1);
q2 = Y(:,3);
qd1 = Y(:,2);
qd2 = Y(:,4);
g=9.81;

lc1 = 0.5 * l1;
lc2 = 0.5 * l2;
lac1 = 0.5 * s1;
lac2 = 0.5 * s2;

k1 = 4;
k2 = 5;

d1 = d;
d2 = l1-s1;

M = m1+ma1+m2+ma2;

%kinetic Energies of main links
ke1 = 0.5*m1*lc1.^2.*qd1.^2 + 0.5*I1.*qd1.^2;
ke2 = 0.5 * m2 * (l1^2*(qd1.^2) + lc2^2.*(qd1+qd2).^2 + 2*l1*lc2*qd1.*(qd1+qd2).*cos(q2)) + 0.5*I2.*(qd1+qd2).^2;

%kinetic energies of aux links
kea1 = 0.5*Ia1*qd1.^2 + 0.5*ma1*(qd1.^2 * (lac1^2 + s1^2 + 2*s1*lac1) + s2^2*(qd1+qd2).^2 + 2*qd1.*(qd1+qd2).*(s2*lac1.*cos(q2) + s1*s2.*cos(q2)));
kea2 = 0.5*Ia2*(qd1+qd2).^2 + 0.5*ma2*(s1^2*qd1.^2 + lac2^2*(qd1+qd2).^2 + 2*s1*lac2*cos(q2).*qd1.*(qd1+qd2));

ke = ke1 + ke2 + kea1 + kea2;

%potential energy
pe = M*g*(h + s1.*sin(q1) + s2.*sin(q1+q2)) + 0.5*k1*(s1^2 + s2^2 + d1^2 + 2*d1*s1.*sin(q1) + 2*d1*s2.*sin(q1+q2) + 2*s1*s2.*cos(q2)) + ...
    0.5*k2*(s2^2 + d2^2 - 2*s2*d2.*cos(q2));
    
%pe = lc1*sin(q1)*m1*g + m2*g*(l1*sin(q1)+lc2*sin(q1+q2));

en = ke + pe;

end
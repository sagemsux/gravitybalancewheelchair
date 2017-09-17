function [Ax,Ay,Bx,By] = WheelchairKinematics(q1,q2,l1,l2,h)

Ax = l1*cos(q1);
Ay = h + l1*sin(q1);

Bx = Ax + l2*cos(q1+q2);
By = Ay + l2*sin(q1+q2);

end
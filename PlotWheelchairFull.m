function PlotWheelchairFull(Ax,Ay,Bx,By,h,s1x,s1y,s2x,s2y,d,s1,s2,q1,q2,w)
hold on
plot3([0 0],[0 h],[w/2 w/2],'k');
plot3([0 Ax],[h Ay],[w/2 w/2],'b');
plot3([Ax Bx],[Ay By],[w/2 w/2],'r');
plot3([0 s1x+s2*cos(q1+q2)],[h-d s1y+s2*sin(q1+q2)],[w/2 w/2],'c--*','LineWidth',1.3); %Spring 1
plot3([s1x+s2*cos(q1+q2) Ax],[s1y+s2*sin(q1+q2) Ay],[w/2 w/2],'c--*','LineWidth',1.3); %Spring 2

%Parallelogram Structure
plot3([s1x s1x+s2*cos(q1+q2)],[s1y s1y+s2*sin(q1+q2)],[w/2 w/2],'k','LineWidth',2);
plot3([s2x s1x+s2*cos(q1+q2)],[s2y s1y+s2*sin(q1+q2)],[w/2 w/2],'k','LineWidth',2);

plot3([0 0],[0 h],-[w/2 w/2],'k');
plot3([0 Ax],[h Ay],-[w/2 w/2],'b');
plot3([Ax Bx],[Ay By],-[w/2 w/2],'r');
plot3([0 s1x+s2*cos(q1+q2)],[h-d s1y+s2*sin(q1+q2)],-[w/2 w/2],'c--*','LineWidth',1.3); %Spring 1
plot3([s1x+s2*cos(q1+q2) Ax],[s1y+s2*sin(q1+q2) Ay],-[w/2 w/2],'c--*','LineWidth',1.3); %Spring 2

%Parallelogram Structure
plot3([s1x s1x+s2*cos(q1+q2)],[s1y s1y+s2*sin(q1+q2)],-[w/2 w/2],'k','LineWidth',2);
plot3([s2x s1x+s2*cos(q1+q2)],[s2y s1y+s2*sin(q1+q2)],-[w/2 w/2],'k','LineWidth',2);

plot3([Ax Ax],[Ay Ay],[w/2 -w/2],'k');
plot3([Bx Bx],[By By],[w/2 -w/2],'k');
plot3([0 0],[h h],[w/2 -w/2],'k');
plot3([0 0],[0 0],[w/2 -w/2],'k');

xlim([-250 250]);
ylim([-250 250]);
zlim([-w w]);
end

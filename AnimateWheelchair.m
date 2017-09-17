function AnimateWheelchair(l1,l2,h,d,w,Y,t,s1,s2)

q1_all = Y(:,1);
q2_all = Y(:,3);




figure

for j=1:size(Y,1)
    
    %clf
    
    q1 = q1_all(j);
    q2 = q2_all(j);
    
    [Ax,Ay,Bx,By] = WheelchairKinematics(q1,q2,l1,l2,h);



    s1_points = s1.*[cos(q1) sin(q1)] + [0 h];
    s1x = s1_points(1); s1y = s1_points(2);
    s2_points = [Ax Ay] + s2.*[cos(q1+q2) sin(q1+q2)];
    s2x = s2_points(1); s2y = s2_points(2);

    %Robot Link 1
    plot3([0 0],[0 h],[w/2 w/2],'k');
    hold on
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
    zlim([-w*1.2 w*1.2]);
    view([159 -88]);
    drawnow
    pause(t/size(Y,1)) % delay 0.05s
    hold off


end

end


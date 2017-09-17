function PlotWheelchair(Ax,Ay,Bx,By,h)
hold on
plot([0 0],[0 h],'k');
plot([0 Ax],[h Ay],'b');
plot([Ax Bx],[Ay By],'r');
xlim([-250 250]);
ylim([-250 250]);
end




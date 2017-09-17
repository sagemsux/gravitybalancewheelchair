%% calculation for placement of auxillary links depending on mass and center of mass of each person
% s1 represents distance from knee joint to joint connecting auxillary link 2 and thigh link
% s2 represetns distance from hip joint to joint connecting auxillar link 1
% and upper body link. 
% m1 is mass of thigh link
% m2 is mass of upper body link
% ma1 is mass of auxillary link 1 (keep a constant)
% ma2 is mass of auxillart link 2 (keep a constant)
% l1 is length of thigh
% l2 is length of upper body
% alpha is ratio of center of mass of thigh link to length of thigh
% beta is ratio of center of mass of upper body link to length of upper
% body
% gamma is ratio of center of mass of auxillary link 1 to length of auxillary link 1
% delta is ratio of center of mass of auxillary link 2 to length of
% auxillary link 2

%body weight ratios
HT = .5801;                                                 %head and trunk ratio
TH = .1027;                                                 %thigh ratio
ARM = .0490;                                                %arm ratio

%body Height ratios
ht = .4747;                                                 %head and trunk ratio
th = .2616;                                                 %thigh ratio

%center of mass ratio's
alpha = .3719;                                              %for thigh
beta = .5921;                                               %for head plus trunk
gamma = .95;                                                %for auxillary link 1 (s1)
delta = .05;                                                %for auxillary link 2 (s2)

%vector of range of possible weights
Weights = linspace(40,100,13);                              %vector of weights ranging from 40kg to 100kg by 5kg
Heights = linspace(152,212,13);                             %vector of heights ranging from 152cm to 212cm by 5cm

% known Varaibles
m1 = TH.*Weights;                                           %vector of thigh mass 1x13 (kg)
m2 = HT.*Weights + ARM.*Weights;                            %vector of upper body mass 1x13 (kg)
l1 = (th.*Heights)';                                        %vector of thigh lengths 13x1 (cm)
l2 = (ht.*Heights)';                                        %vector of upper body length 13x1 (cm)
ma1 = 10;                                                   %auxillary link 1 mass                               
ma2 = 10;                                                   %auxillary link 2 mass

numerator1 = (l1*((alpha.*m1)+m2));
denominator1 = diag(m1+m2+(gamma.*ma1));
s1 = numerator1*inv(denominator1);                           %s1 = (l1*(alpha*m1+m2))/(m1+m2+gamma*ma1). in cm
                   
numerator2 = (beta.*l2)*m2;
denominator2 = diag(m1+m2+((1-delta).*ma2));
s2 = numerator2*inv(denominator2);                           %s2 = (m2*beta*l2)/(m1+m2+ma2*(1-delta)). in cm

%wirte data into an excel file
% filename = 'auxillarylinkdata.xlsx';
% xlswrite(filename,s1,1,'C3:O15')
% xlswrite(filename,s2,1,'C18:O30')
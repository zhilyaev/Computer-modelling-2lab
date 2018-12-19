syms x y Dy D2y lambda
%подинтегральное уравнение
F=(Dy+y)^2+2*y*sin(x);
y1=0;
x1=0;
y2=1;
x2=pi;
%производные
dFdy = diff(F,y); %производная по y
dFdy1 = diff(F, Dy); %производная по y1
d_dFdy1_dx=diff(dFdy1,x); % Fy'x
d_dFdy1_dy=diff(dFdy1,y); % Fy'y
d_dFdy1_dy1=diff(dFdy1,Dy); % Fy'y'
dFy1dx=d_dFdy1_dx+d_dFdy1_dy*Dy+d_dFdy1_dy1*D2y;
%уравнение Эйлера
Euler=simplify(dFdy-dFy1dx);
Euler = [char(Euler) '=0'];
disp('Уравнение Эйлера')
disp(Euler)
Sol=dsolve(Euler,'x'); % решаем уравнение Эйлера
disp('Решение')
disp(Sol)
SolLeft=subs(Sol,x,x1); % подставили x1
SolRight=subs(Sol,x,x2); % подставили x2
EqLeft=[char(SolLeft) '=' char(sym(y1))]; % =y1
EqRight=[char(SolRight) '=' char(sym(y2))]; % =y2
Con=solve(EqLeft,EqRight,'C4,C5'); % решаем систему
C4=Con.C4; % присваиваем полученные решения
C5=Con.C5; % символическим константам C1 и C2
Sol21=vpa(eval(Sol),14); % вычислили с 14 знаками
disp(Sol21)
warning("off")
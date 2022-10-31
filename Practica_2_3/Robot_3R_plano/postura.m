%Función de la postura del robot 3R

function F = postura(q,x3,y3)

%El cambio de variables de la postura
theta1 = q(1);
theta2 = q(2);

%Parámetros del robot
L1 = 0.12;  %m
L2 = 0.12;  %m

x0 = 0.055;  %m
y0 = 0.0;   %m

%Definición de la función
F(1) = x0+L1*cos(theta1)+L2*cos(theta1+theta2)-x3;
F(2) = y0+L1*sin(theta1)+L2*sin(theta1+theta2)-y3;
end


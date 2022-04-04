# Práctica 3. Planeación de trayectorias

## 1.	Objetivo de la práctica

“El alumno comparará el comportamiento de cinemático de las velocidades y de los pares de las juntas de un robot RRR en el plano, al implementar una simulación de una planeación de movimientos en espacio de las juntas del robot y otra simulación de una planeación de movimientos en el espacio de trabajo del robot”.

## 2.Metas

Para la realización de la práctica se deben cumplir las siguientes metas:

•	El alumno programará una simulación de una planeación de trayectorias en el espacio de juntas de un robot RRR, en la cual moverá su efector final de un punto a otro dentro de su espacio de trabajo con una determinada orientación.

•	De la simulación de la planeación de movimientos en el espacio de las juntas el alumno obtendrá las gráficas del comportamiento cinemático de las velocidades y de los pares obtenidos en cada una de las juntas.

•	El alumno programará una simulación de una trayectoria en el espacio de trabajo de un robot RRR siguiendo una trayectoria de una línea recta moviendo y orientando su efector final, bajo las mismas condiciones de la simulación anterior.

•	De la simulación de la trayectoria en el espacio de trabajo del robot el alumno obtendrá las gráficas del comportamiento cinemático de las velocidades y de los pares obtenidos en cada una de las juntas. 

## 3.	Antecedentes

Los robots deben mover objetos o herramientas de un lugar a otro con el fin de realizar alguna tarea específica siguiendo un comportamiento determinado por un modelo matemático. Los modelos matemáticos que definen los movimientos de un robot durante la realización de una tarea se pueden clasificar en:

•	Planeación de trayectorias en el espacio de las juntas del robot.

•	Planeación de trayectorias en el espacio de trabajo del robot.

Para establecer cada uno de estos tipos de planeación de trayectoria es necesario definir las condiciones iniciales y finales de la posición y orientación del efector final del robot, además del perfil de trayectoria a utilizar en ambos casos. 


## 4.	Conocimientos previos 

Los conocimientos necesarios para la realización de la práctica:

•	Conocimientos básicos de Matlab.

•	Conocimientos básicos de Simulink.

•	Haber realizado la Práctica 2.


## 5.	Materiales y Equipo

Para la realización de la práctica es necesario contar con lo siguiente:

•	Una computadora con Matlab con Simulink y Simscape Multibody.

•	Tener instalado el recurso de Multibody. 

•	Programa de CAD Inventor o Solidworks.

•	Contar con la simulación hecha en la Práctica 2.


## 6.	Preparativos previos y recomendaciones 


•	Haber realizado la Práctica anterior “Práctica 2: Simulación de un robot RRR”.

## 7.	Desarrollo de la práctica

7.1.	Colocarse en la ventana de “Current Folder” correspondiente a la práctica 2.

[![F-2-1.png](https://i.postimg.cc/htyF5qhF/F-2-1.png)](https://postimg.cc/RWHbWycG)

7.2.	Abrir Simulink y el archivo de archivo de la simulación de la práctica 2.

[![F-3-2.png](https://i.postimg.cc/D0vH62Lb/F-3-2.png)](https://postimg.cc/Q9zfxZ6X)

7.3.	Para implementar las simulaciones es necesario crear una función con el fin de calcular las posturas iniciales y finales del robot al inicio de cada simulación, por lo que hay crear un nuevo Script en un archivo .m, y colocar el siguiente código:

[![F-3-3.png](https://i.postimg.cc/x1QW63Qz/F-3-3.png)](https://postimg.cc/0btWQmbk)

7.4.	Lo siguiente es generar la información de la trayectoria para ello es necesario generar otro script en el cual se define las características de la trayectoria de la línea recta. El código de ese script es el siguiente:

```

5.	%Planeación de la tarea
6.	 
7.	%Posición y orientación inicial
8.	 
9.	xp_inicial = 0.25;  %m
10.	yp_inicial = 0.1;  %m
11.	thetap_inicial = pi/2; %rad
12.	 
13.	%Posición y orientación final
14.	xp_final = 0.15;  %m
15.	yp_final = 0.20;  %m
16.	thetap_final = pi/2; %rad
17.	 
18.	%%parámetro
19.	L3 = 0.06;  %m
20.	 
21.	%Trayectoria
22.	 
23.	t_total = 10; %s
24.	t_muestreo = 0.1; %s
25.	t_sim = 0:t_muestreo:t_total; %arreglo del tiempo
26.	 
27.	%Puntos de la trayectoria
28.	xp = xp_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(xp_final-xp_inicial);
29.	yp = yp_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(yp_final-yp_inicial);
30.	thetap = thetap_inicial+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetap_final-thetap_inicial);
31.	 
32.	plot(xp,yp)
33.	 
34.	figure
35.	plot(t_sim,thetap)
36.	 
37.	 
38.	%%%%%Cálculo de las xy del sistema 3
39.	 
40.	x3 = xp-L3*cos(thetap);
41.	y3 = yp-L3*sin(thetap);
42.	 
43.	figure
44.	plot(x3,y3)
45.	 
46.	%%%%Generación de la señal de tarea
47.	%Parámetros del tiempo
48.	t_total = 10; %s
49.	t_muestreo = 0.1; %s
50.	t_sim = 0:t_muestreo:t_total; %arreglo del tiempo
51.	 
52.	t = transpose(t_sim);
53.	 
54.	%Señales
55.	 
56.	xp_t = transpose(xp);
57.	yp_t = transpose(yp);
58.	thetap_t = transpose(thetap);
59.	 
60.	signal_xp = [t xp_t];
61.	signal_yp = [t yp_t];
62.	signal_thetap = [t thetap_t];
63.	 
64.	x3_t = transpose(x3);
65.	y3_t = transpose(y3);
66.	 
67.	signal_x3 = [t x3_t];
68.	signal_y3 = [t y3_t];
69.	 
70.	%Fin del programa


```
Para finalizar es necesario correr el script para generar la información en el espacio de trabajo.

7.5.	Generar el script de solución de las posturas del robot utilizando el siguiente código:

```
%Solución de la postura
 
waprox = [pi -pi]; %Vector de proximación de la Postura inicial
 
for i=1:length(t_sim)
    
  q_cal(i,:) = fsolve(@(q) postura(q,x3(i),y3(i)),waprox); %planteamiento del cálculo de la solución de la postura
    
   theta1_cal(i) =  q_cal(i,1); %Solución el ángulo Theta 1
   theta2_cal(i) =  q_cal(i,2); %Solución el ángulo Theta 2
   
   waprox = [theta1_cal(i) theta2_cal(i)]; %Vector de aproximación
    
end
 
%Cálculo del ángulo theta3
 
for i=1:length(t_sim)
 
Theta3_cal(i) = thetap(i)-theta1_cal(i)-theta2_cal(i);%Cálculo del ángulo theta 3
    
end
 
%Parámetros del tiempo
 
t_total = 10; %s Tiempo total de la simulación
t_muestreo = 0.1; %s Incremento del tiempo para la simulación
t_sim = 0:t_muestreo:t_total; %arreglo del tiempo
 
%creación de la señal de salida para la simulación 
%de la planeación en el espacio de trabajo del robot
t = transpose(t_sim);
 
theta1_t = transpose(-theta1_cal);
theta2_t = transpose(-theta2_cal);
theta3_t = transpose(-Theta3_cal);
 
signal_theta1 = [t theta1_t];
signal_theta2 = [t theta2_t];
signal_theta3 = [t theta3_t];
 
%Fin del programa


```

Al terminar es necesario correr el script para generar la información dentro del espacio de trabajo.


7.6.	Para implementar la simulación de la trayectoria en el espacio de las junas es necesario extraer la configuración inicial y final de cada una de las juntas extrayéndolas en la ventana de comandos introduciendo el siguiente código:

```
theta1_cal(1)
theta2_cal(1)
theta3_cal(1)
 
theta1_cal(101)
theta2_cal(101)
theta3_cal(101)

```

Estos valores obtenidos deben substituirse en el bloque de “Matlab function” en Simulink, el código del bloque es el siguiente:

```
function [theta1s,theta2s,theta3s] = fcn(u)
 
T = 10;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta1in_cal = 2*atan(145535^(1/2)/17 + 384/17);
%theta1_cal = -2*atan(145535^(1/2)/17 + 384/17);
 
theta2in_cal = -2*atan(145535^(1/2)/65);
%theta2in_cal = 2*atan(145535^(1/2)/65);
 
theta3in_cal = pi/2 + 2*atan(145535^(1/2)/65) - 2*atan(145535^(1/2)/17 + 384/17);
%theta3in_cal = pi/2 - 2*atan(145535^(1/2)/65) + 2*atan(145535^(1/2)/17 - 384/17);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
theta1fin_cal = 2*atan(824423^(1/2)/3349 + 1440/3349);
%theta1fin_cal = -2*atan(824423^(1/2)/3349 + 1440/3349);
 
theta2fin_cal = -2*atan(824423^(1/2)/1861);
%theta2fin_cal = 2*atan(824423^(1/2)/1861);
 
theta3fin_cal = 2*atan(824423^(1/2)/1861) - pi - 2*atan(824423^(1/2)/3349 + 1440/3349);
%theta3fin_cal =2*atan(824423^(1/2)/3349 - 1440/3349) - 2*atan(824423^(1/2)/1861) - pi;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta1s = -(theta1in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta1fin_cal-theta1in_cal));
theta2s = -(theta2in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta2fin_cal-theta2in_cal));
theta3s = -(theta3in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta3fin_cal-theta3in_cal));



```

7.6.	Para implementar los datos las configuraciones obtenidas de la planeación de trayectorias en el espacio de trabajo del robot es necesario utilizar tres bloques de “from workspace” y asociarlo con cada señal de salida de las juntas del robot signal_theta1, signal_theta2 y signal_theta3.

[![F-3-4.png](https://i.postimg.cc/0NYhgtGv/F-3-4.png)](https://postimg.cc/xkd6M3Fp)


7.7.	 Para extraer la información de la planeación de la trayectoria en el espacio de las juntas se deben conectar las salidas del bloque de la función a las entradas del bloque de cada una de las juntas y correr la simulación para obtener la información de las velocidades y pares.

[![F-3-5.png](https://i.postimg.cc/Z5rw0WWF/F-3-5.png)](https://postimg.cc/JszN24cG)

7.8.	Para extraer la información de la planeación de la trayectoria en el espacio trabajo del robot se deben conectar las salidas de los bloques de las señales de salida el bloque de cada una de las juntas y correr la simulación para obtener la información de las velocidades y pares.

[![F-3-6.png](https://i.postimg.cc/668Jqhtr/F-3-6.png)](https://postimg.cc/bdfFFkGr)

10.	Resultados

Los resultados esperados son los siguientes:

•	Simulación del robot realizando las trayectorias establecidas en cada una de las planeaciones.

[![F-3-7.png](https://i.postimg.cc/k4DZVn3J/F-3-7.png)](https://postimg.cc/XGSxm6Ym)

•	Y las gráficas de las velocidades angulares y pares de cada una de las juntas que muestran en los bloques Dashboard Scope.

•	Comparación del comportamiento cinemático y dinámico de cada una de las simulaciones.

*Las gráficas deben contener título y leyenda sobre los ejes.

## Material realizado en el Departamento de Ingeniería Mecatrónica, Facultad de Ingeniería, UNAM, CU, mediante el apoyo de la Dirección General de Asuntos del Personal Académico, Dirección de Apoyo a la Docencia, mediante el proyecto PAPIME PE107220 “Fortalecimiento de la enseñanza de la asignatura de robótica mediante la elaboración de material didáctico”

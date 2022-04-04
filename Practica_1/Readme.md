
# Práctica 1. Simulación de un eslabón


## 1.	Objetivo de la práctica
“Simular una junta rotacional y una junta prismática conforme a un modelo cinemático con el fin de evaluar su comportamiento cinemático y dinámico”.

## 2.	Metas
Para la realización de la práctica se deben cumplir las siguientes metas:

•	Crear los elementos de una simulación de un sistema mecánico compuesto por un eslabón unido a una junta rotacional.

•	Crear los elementos de una simulación de un sistema mecánico compuesto por un eslabón unido a una junta prismática.

•	Programar el comportamiento cinemático de la postura de un eslabón unido a una junta rotacional.

•	Programar el comportamiento cinemático de la postura de un eslabón unido a una junta prismática.

•	Obtener el comportamiento cinemático de las velocidades y los pares resultantes de cada simulación.


## 3.	Antecedentes
Los robots son cadenas cinemáticas compuestas por un conjunto de cuerpos rígidos unidos mediante algún arreglo mecánico denominado junta. Entre los tipos de las juntas que conforman a los robots la juntas rotacionales R y las juntas prismáticas P, las cuales pueden motorizarse de tal modo que estas muevan a los eslabones de un robot con el fin de que este realice una tarea determinada. Los movimientos de las juntas motorizadas de un robot deben realizarse de manera coordinada al programarle un comportamiento cinemático y dinámico determinado. 

## 4.	Conocimientos previos 

Los conocimientos necesarios para la realización de la práctica:

•	Conocimientos de ensamble en CAD (Inventor y/o Solidworks).

•	Conocimientos básicos de Matlab.

•	Conocimientos básicos de Simulink.

## 5.	Materiales y Equipo

Para la realización de la práctica es necesario contar con lo siguiente:

•	Una computadora con Matlab con Simulink y Simscape.

•	Tener instalado el recurso de Simscape. *

•	Programa de CAD Inventor o Solidworks. **

•	Archivos de importación de los sistemas mecánicos.

*Revisar guía de instalación 

**Deseable más no indispensable para la realización de la práctica.


## 6.	Preparativos previos y recomendaciones 

•	Para realizar la práctica es conveniente establecer una carpeta específica donde se generarán los archivos de la simulación.

•	Colocar el archivo Practica_1.rar en la carpeta y descomprimir los archivos. 

## 7.	Desarrollo de la práctica

Para la instalación del Simscape Multibody Link se deben seguir los siguientes pasos:

1.	Instalar previamente instalado Matlab con las librerías de Simulink y Simscape Multibody. 
	
2.	Entrar a Matworks para descargar el Simscape Multibody Link en el de acuerdo con el CAD con el que se esté trabajando 
(https://la.mathworks.com/campaigns/offers/download_smlink.html).


[![F-1-1.png](https://i.postimg.cc/B6C1L1DD/F-1-1.png)](https://postimg.cc/ftJb1y8T)


3.	Colocar los archivos descargados en una carpeta específica.

4.	Ejecutar Matlab en modo administrador.

5.	En la ventana de Current Folder ubicar la carpeta con los archivos descargados. Se recomienda ubicar los archivos en una raíz cercana a C:.

[![F-1-2.png](https://i.postimg.cc/zvB3y2qZ/F-1-2.png)](https://postimg.cc/0MT93f6c)

6.	En la ventana de comandos del programa para la instalación se debe escribir el comando de instalación install_addon(‘smlimk.XXX.win64.zip’).

[![F-1-3.png](https://i.postimg.cc/6545Fv30/F-1-3.png)](https://postimg.cc/QHs3TVc9)

7.	Terminada la instalación se debe dar de alta en el servidor de Mathworks se debe ejecutar en el Command Windows el comando “regmatlabserver”.
8.	
9.	Después de correr el comando anterior es necesario crear la ruta del plug en el programa de CAD. En el caso de utilizar el CAD Solidworks se debe ejecutar en la ventana de Command Windows “smlink_linksw”, en el caso de utilizar el CAD Autodesk Inventor e debe ejecutar en la ventana de Command Windows “smlink_linkinv”.


Con la instalación anterior terminada es posible importar archivos de CAD para simularlos en Simscape Multibody, siguiendo el procedimiento siguiente de la práctica.
*Un error común es intentar la instalación sin que el Matlab no se esté ejecutando como administrador.
**Un error que pude presentarse es la falta de un archivo .dll, el cual se puede integrar dentro de la carpeta faltante.

Los pasos para realizar la práctica son los siguientes de la junta prismática se deben seguir los siguientes pasos:

1.	Crear una carpeta específica donde se colocarán los archivos de la práctica 1 (Practica_1.rar) al descomprimirlos.

2.	En la ventana del Current Folder ubicar la carpeta de los archivos de la práctica y estableciendo una ruta para los archivos.

[![F-1-4.png](https://i.postimg.cc/rwcsWpVN/F-1-4.png)](https://postimg.cc/LnCmF2ZJ)

3.	Para generar la primera simulación hay que ubicarse en la carpeta Ensamble_1_R.

[![F-1-5.png](https://i.postimg.cc/Dz02dJtL/F-1-5.png)](https://postimg.cc/CZyTw1Mx)

4.	La simulación genera al colocar sen la ventana de Command Window smimport('Ensamble_P1.xml'), al correr el comando generará los elementos de la simulación.

[![F-1-6.png](https://i.postimg.cc/43jT68vR/F-1-6.png)](https://postimg.cc/xkG7Y3F6)

[![F-1-7.png](https://i.postimg.cc/qBsdKxzW/F-1-7.png)](https://postimg.cc/DmwDksQc)


En este caso se generará un archivo en Simulink los cuales contienen un conjunto de bloques que definen al sistema de referencia inercial y los bloques que relacionan a la base del arreglo con un eslabón unidos por una junta prismática. 

[![F-1-8.png](https://i.postimg.cc/hvg6sNf6/F-1-8.png)](https://postimg.cc/62jM5jVf)


5.	Lo siguiente es definir una función de entrada que determine el comportamiento de la junta en función de tiempo para ello es necesario usar un bloque de reloj (Clock), el cual se puede extraer al escribir “clock” sobre la ventana de Simulink. El parámetro de Decimation se deja en 10 segundos al igual que el tiempo de la simulación.

[![F-1-9.png](https://i.postimg.cc/zfgQrqh4/F-1-9.png)](https://postimg.cc/Ffhpb5Dx)

[![F-1-10.png](https://i.postimg.cc/bYTB8CGY/F-1-10.png)](https://postimg.cc/F1YZVxgw)

[![F-1-11.png](https://i.postimg.cc/TPgtsCM6/F-1-11.png)](https://postimg.cc/sBfPQPg6)

[![F-1-12.png](https://i.postimg.cc/76XnvRKp/F-1-12.png)](https://postimg.cc/zbbgKxZj)

[![F-1-13.png](https://i.postimg.cc/gcSHNfXh/F-1-13.png)](https://postimg.cc/23WW59xj)

Dar doble clic sobre el bloque para crear la función en una pestaña del Editor, tomando como entrada del tiempo u y como función de salida y. En la definición de la función escribir el siguiente código:

[![F-1-14.png](https://i.postimg.cc/zBdK2gBN/F-1-14.png)](https://postimg.cc/KkM1R4Bp)


7.	Lo siguiente es configurar la junta dando doble clic y modificar el tipo de entrada de actuación de movimiento como Provided by input y en Fuerza que sea automáticamente calculada.

[![F-1-15.png](https://i.postimg.cc/vZW9FjB3/F-1-15.png)](https://postimg.cc/rDwz5f5r)

En la parte de Sensing habilitar las opciones de velocidad y fuerza, para finalizar oprimir Apply y OK.

[![F-1-16.png](https://i.postimg.cc/tT7YTmq0/F-1-16.png)](https://postimg.cc/5YdxKgQp)

Lo que mostrará en el icono de la junta una entrada y dos salidas:

[![F-1-17.png](https://i.postimg.cc/W16SVSb6/F-1-17.png)](https://postimg.cc/tsJFt36Y)

8.	La señal del bloque de Matlab Funtion debe ser convertida a una señal física mediante el conector Simulink-PS.

[![F-1-21.png](https://i.postimg.cc/VNk988hm/F-1-21.png)](https://postimg.cc/fV1Sc6Zr)

El conector debe configurarse para que la señal sea adecuada como entrada a una junta mecánica con un filtro de segundo orden.

[![F-1-19.png](https://i.postimg.cc/vThHMpkw/F-1-19.png)](https://postimg.cc/RJ3zLbvg)

[![F-1-20.png](https://i.postimg.cc/RV0vKp2q/F-1-20.png)](https://postimg.cc/ThZ8X0dX)


9.	A la salida de la junta se conectará un bloque Scope en cada una, ya que son magnitudes físicas distintas (velocidad y fuerza) mediante el conector PS-Simulink.

[![F-1-22.png](https://i.postimg.cc/6qpxVTjF/F-1-22.png)](https://postimg.cc/MMNLqZ8Y)

10.	Para visualizar los datos de la simulación se agrega un Dashboard Scope.

[![F-1-23.png](https://i.postimg.cc/52vTCw96/F-1-23.png)](https://postimg.cc/nXF389DJ)

Para conectar las señales de salida es necesario abrir el menú del Dashboard y dar clic en el hilo de las señales, dar Apply y OK.

[![F-1-24.png](https://i.postimg.cc/j2Lkdfkq/F-1-24.png)](https://postimg.cc/y3CTLDH2)

11.	Dar en el botón de guardar la simulación en Simulink.

12.	Para correr la simulación se debe dar Play en el menú de Simulink.

[![F-1-25.png](https://i.postimg.cc/MG5s75CK/F-1-25.png)](https://postimg.cc/DWWdFrft)

13.	 Si la simulación no tiene un error debe generar una animación de la junta con las piezas exportadas del CAD y en Dashboard Scope se debe mostrar el registro de cada sensor habilitado.

[![F-1-26.png](https://i.postimg.cc/xTHVvrtf/F-1-26.png)](https://postimg.cc/RNMYmDky)

[![F-1-27.png](https://i.postimg.cc/W3tQtxdP/F-1-27.png)](https://postimg.cc/jw08Fg68)

14.	Para exportar la información se debe dar clic en Simulation Data Inspector  , en el menú de exportación se pueden extraer los datos en una hoja de cálculo con el fin .xlsx para su comparación con otras configuraciones.

Los pasos para realizar la práctica son los siguientes de la junta rotacional se deben seguir los siguientes pasos:

1.	Ubicar la carpeta Ensamble_1_R de los archivos de la junta rotacional R

[![F-1-28.png](https://i.postimg.cc/HnXvymHF/F-1-28.png)](https://postimg.cc/MfZmChnY)

2.	Crear la simulación exportando el archivo

[![F-1-29.png](https://i.postimg.cc/Wpg5S2LH/F-1-29.png)](https://postimg.cc/3WrjxQwX)

[![F-1-30.png](https://i.postimg.cc/nhR2MrBC/F-1-30.png)](https://postimg.cc/jDfPFs8b)

3.	Realizar los pasos mostrados en el proceso anterior solo que en la definición del bloque de función de Matlab Funtion su configuración se realiza con sus variables en radianes ya que la junta es rotacional.

[![F-1-31.png](https://i.postimg.cc/Hx59StKy/F-1-31.png)](https://postimg.cc/G8LDtvbL)

## 8.	Resultados
Los resultados de la practica deben mostrar la captura de pantalla de las simulaciones de los archivos Ensamble_2_R y Ensamble_2_P, así como las gráficas de la información obtenida.

## 9.	Conclusiones 
La conclusión de una práctica se establece conforme al objetivo de la práctica y el complimiento de las metas planteadas para su realización.

## Bibliografía 
•	Reporte de robot serial, clase de termas selectos de robótica semestre 2019-2.
•	Documentación de Simscape Multibody de Matlab.


### Material realizado en el Departamento de Ingeniería Mecatrónica, Facultad de Ingeniería, UNAM, CU, mediante el apoyo de la Dirección General de Asuntos del Personal Académico, Dirección de Apoyo a la Docencia, mediante el proyecto PAPIME PE107220 “Fortalecimiento de la enseñanza de la asignatura de robótica mediante la elaboración de material didáctico”

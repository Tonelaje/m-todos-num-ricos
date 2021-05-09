%Limpiamos la pantalla y mostramos el nombre del m�todo
clear
clc
disp('Metodo de Newton Raphson')

%Introducimos la funci�n,la derivada, el punto de inicio,as� como
%porcentaje de error
f=input('Introduzca la funcion f(x):','s');
d=input('Introduzca la derivada de la funcion dy/dx:','s');
pi=input('Introduzca el punto de inicio:');
jj=input('Numero de iteraciones:');
err=input('Porcentaje de error:');

%Graficamos la funci�n
%ezplot(f)
%grid on

%cambiamos las expresiones ingresadas de string a funciones
d=inline(d);
f=inline(f);

ea=100;
j=0;
a=0;
for a:1:jj
%while ea<err
 %Aproximamos la raiz con la f�rmula correpondiente
 xi=pi-(f(pi)/d(pi));
 %Calculamos el porcentaje de error
 ea=abs(((xi-pi)/xi)*100);
 pi=xi;
 j=j+1;
%end
endme-
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nRaiz= %10.3f en %d Iteraciones',pi,j)
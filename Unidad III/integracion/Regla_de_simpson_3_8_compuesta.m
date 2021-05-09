%Limpiamos la pantalla y mostramos el nombre del m�todo
clear
clc
disp('Regla de Simpson 3/8 compuesta')
%Damos de alta la variable simb�lica X
syms x
%Introducimos la funci�n,los puntos a y b, n�mero de subint�rvalos as� como
%porcentaje de error
f =input('Introduzca la funci�n f(x):');
a =input('Introduzca el punto a: ');
b =input('Introduzca el punto b: ');
n =input('N�mero de subintervalos (n): ');
%Graficamos la funci�n en el intervalo [a,b]
ezplot(f,[a,b]);
grid,title('\bf Regla de Simpson 3/8 compuesta')
f=inline(f);
%Calculamos la longitud del subint�rvalo
h =(b-a)/(2*n);
f0=0;
for i=1:n-1
x=a+h*(2*i);
f0=f0+f(x);
end
f1=0;
for i=1:n
x=a+h*(2*i-1);
f1=f1+f(x);
end
f0=2*f0+4*f1;
f0=f0+f(a)+f(b);
%Aproximamos la integral
aprox=(h/3)*f0;
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nAproximaci�n a la integral=%12.3f \n',aprox);
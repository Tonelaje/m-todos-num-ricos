%Limpiamos la pantalla y mostramos el nombre del m�todo
clear
clc
disp('Regla de Simpson 1/3 compuesta')
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
grid,title('\bf Regla de Simpson 1/3 compuesta')
f=inline(f);
%Calculamos la longitud del subint�rvalo
h=(b-a)/(2*n);
sumxi=0;
for i=1:n-1
x=a+h*(2*i);
sumxi=sumxi+feval(f,x);
end
sumxmi=0;
for i=1:n
x=a+h*(2*i-1);
sumxmi=sumxmi+feval(f,x);
end
%Aproximamos la integral con la f�rmula correspondiente
int=((b-a)/(6*n))*(f(a)+ 4*sumxmi + 2*sumxi + f(b));
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nAproximaci�n a la integral=%12.3f \n',int);












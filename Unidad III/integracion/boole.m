function [R, quad, err, h] = boole (f, a, b, n, tol)
% Entrada - f es el integrando introducido como cadena de caracteres �f�
% - a y b son los limites superior e inferior de integracion
% - n es el numero maximo de filas en la tabla
% - tol es la tolerancia
% Salida - R es la tabla de Romberg
% - quad es el valor de la cuadratura (integral)
% - err es el error estimado
% - h es el tama~no de paso mas peque~no utilizado
M = 1;
h = b - a;
err = 1;
J = 0;
R = zeros(4, 4);
R(1, 1) = h * (feval(f, a) + feval(f, b)) / 2;
while ((err > tol) & (J < n)) | (J < 4)
J = J + 1;
h = h / 2;
s = 0;
for p = 1:M
x = a + h * (2 * p - 1);
s = s + feval(f, x);
end
R(J+1, 1) = R(J, 1) / 2 + h * s;
M = 2 * M;
for K = 1:J
R(J+1, K+1) = R(J+1, K) + (R(J+1, K) - R(J, K)) / (4 ^ K - 1);
end
err = abs(R(J, J) - R(J+1, K+1));
end
quad = R(J+1, J+1);
function [t,Y] = eulerFuntionDos(f,a,b,y0,N)
%M?todo de Euler para resolver  PVI de primer orden
%Variables de Entrada:
%f=funciOn a evaluar; a=inicio de intervalo; b=fin de intervalo;
%y0=condiciOn inicial de y; N=n?mero de subintervalos
%Variables de Salida:
%x=vector de nodos;   y=vector de aproximaciones de la soluci?n;
%[t,Y] = eulerFuntionUno("y*(x^2)-1.1*y",0,5,1.27,5)



    h = (b - a)/N;
    t = a:h:b;
    %Verifica si x es columna, de no ser lo convierte
    t = t(:);
    %Inicializamos el vector llenandolo de 0s, la dimensi?n siempre ser? el
    %numeroSubintervalos +1
    Y = zeros(N+1,length(y0));
    Y(1,:) = y0;
    A = zeros(N+1,length(y0));
    A(1,:) = y0;
    funcionP=inline(f)
    
    %funcionIn=inline(fun)
    %dsolve(funcionP)
    for k = 1:N;
        K1=feval(funcionP,t(k),Y(k,:))';
         %Ka=feval(funcionIn,t(k),A(k,:))';
        Y(k+1,:) = Y(k,:) + h*K1;
        %A(k+1,:) = A(k,:) + h*Ka;
        
        
        
        
        %feval permite evaluar funciones
    end
    
    
    hold on 
        table(t,Y)
    plot(t,Y);
    
    %plot(t,func);
    
    
    
    
end
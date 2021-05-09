clear
clc 
fprintf("\t\t\t\tMATLAB Onramp");
%Introducci�n
fprintf("\t\t\t14.4 Proyecto  Final \n\t\tProyecto: Movimiento estelar ")
fprintf("\n\nLos datos de spectra se recopilaron a longitudes de onda\nespaciadas uniformemente, y se conoce la longitud de\nonda inicial(? start), el espaciado (? delta) y el n�mero de\nobservaciones.")

%Carga de data

load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14
   
%Acciones a realizar.
    fprintf("\n\n\t\t\tParte    I\n\n")
    fprintf("\n\nTask 1. Cree una variable llamada que contenga el valor de la �ltima longitud de onda del espectro registrado. ?start+(nObs?1)?delta.\nUse lambdaEnd para crear un vector columna llamado lambda")
        lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta
        lambda = (lambdaStart:lambdaDelta:lambdaEnd)'
    
    fprintf("\n\nTask 2. Extraiga la sexta columna de spectra a un vector llamado s.\n")
        s = spectra(:,6)

    fprintf("\n\nTask 3. Represente los espectros (s) como una funci�n de la longitud de onda (lambda) utilizando escalas logar�tmicas en ambos ejes. Utilice marcadores de puntos (.) y una l�nea continua (-) para conectar los puntos.")
        loglog(lambda,".-")
        xlabel("Wavelength")
        ylabel("Intensity")

    fprintf("\n\nTask 4.Cree dos variables, sHa e idx, que contengan el valor m�nimo de s y el �ndice donde se produce el valor m�nimo. Utilice idx para indexar en lambda y hallar la longitud de onda de la l�nea Hidr�geno-alfa. Almacene el resultado como lambdaHa.")
    
        [sHa,idx] = min(s)
        lambdaHa = lambda(idx)
%La l�nea (lambdaHa,sHa) corresponde a la ubicaci�n de la l�nea Hidr�geno-alfa.
    fprintf("\n\nTask 5.Agregue un punto a la gr�fica existente representando x = lambdaHa, y = sHa como un cuadrado rojo (rs) con un tama�o de marcador MarkerSize de 8")
        hold on
        loglog(lambdaHa,sHa,"rs","MarkerSize",8)
        hold off
   
    fprintf("\n\nTask 6.Calcule el factor de desplazamiento al rojo y la velocidad (en km/s) a la que la estrella se aleja de la Tierra. Asigne el factor de desplazamiento al rojo a una variable llamada z y la velocidad a una variable llamada speed.")
        z = lambdaHa/656.28 - 1
        speed = z*299792.458

    fprintf("\n\nTask 7.Modifique la secci�n Tasks 2 & 7 del script para que realice el c�lculo del desplazamiento al rojo con la segunda estrella de spectra en lugar de la sexta.")
        
        
    fprintf("\n\n\t\t\tParte    II\n\n")
    
%En la l�nea 2 del script mostrado, se extraen los datos del espectro para la segunda estrella en la matriz spectra. Luego, las l�neas de la 3 a la 5 calculan la velocidad seg�n esos datos. �C�mo calcular�a la velocidad de todas las estrellas de spectra?
%Podr�a repetir los c�lculos en un bucle for, pero es m�s eficiente usar operaciones de arreglo en su lugar.   
    
    fprintf("\n\nTask 2.Modifique la l�nea 2 del script. Borre (:,2) para calcular la velocidad de todas las estrellas.\n\n")
        [sHa,idx] = min(spectra);
        lambdaHa = lambda(idx);
        z = lambdaHa/656.28 - 1;
        speed = z*299792.458   
    
%Observe que speed es ahora un vector. Una velocidad positiva significa que la estrella se aleja de nosotros (espectro desplazado al rojo), y una velocidad negativa significa que la estrella se mueve hacia nosotros (espectro desplazado al azul).
%En las pr�ximas tareas, crear� una gr�fica que contiene las siete estrellas. Usar� diferentes estilos para los espectros con desplazamiento al rojo y al azul. Dado que el comando plot no ser� el mismo para cada estrella, es conveniente usar un bucle for.
    fprintf("\n\nTask 2. Cree un bucle for con un �ndice de bucle llamado c. El �ndice de bucle deber�a progresar por todas las columnas de spectra (1 a 7).\n\n")
    
        for c = 1:7
        s = spectra(:,c);

        if speed(c) <= 0
            loglog(lambda,s,"--")
        else
            loglog(lambda,s,"LineWidth",3) 
        end
            hold on
        end
            hold off 
%Primero, representar� los espectros desplazados al azul usando l�neas de guiones.  
    fprintf("\n\nTask 3.Agregue una instrucci�n if al cuerpo del bucle for. Si speed(c) es inferior o igual a 0, cree una gr�fica loglog de s con respecto a lambda usando una l�nea de guiones (--). Despu�s de la instrucci�n if, agregue el comando hold on para que solo se cree una gr�fica.")
    
    
    fprintf("\n\nTask 4. Agregue una instrucci�n else. Si speed(c) es mayor que 0, cree una gr�fica loglog de s con respecto a lambda usando una anchura de l�nea de 3. Una vez completado el bucle for, introduzca hold off. ")
    
%Puede pasar un arreglo de cadenas directamente a la funci�n legend. El arreglo de cadenas starnames contiene el nombre de todas las estrellas de spectra.
    fprintf("\n\nTask 5. Agregue una leyenda a la gr�fica usando el arreglo starnames.")
        legend(starnames)
  
%En la gr�fica, puede usar los estilos de l�nea para identificar las estrellas con espectros desplazados al rojo y, despu�s, buscar sus nombres en la leyenda. �Puede determinar los nombres de los espectros desplazados al rojo sin un bucle for? Recuerde que puede utilizar la indexaci�n l�gica para encontrar elementos que coincidan con una condici�n.
%c = b(a < 6)

    fprintf("\n\nTask 6. Cree una variable movaway que contenga los elementos de starnames correspondientes a cuando speed es mayor que 0.")
        movaway = starnames(speed > 0) 
    
    
    


function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest-neighbour pe imaginea 2x2 f cu puncte
    % intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    % coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % afla nr. de puncte
    n = length(x_int);
    
    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;
    
    % initializeaza rezultatul cu o matrice n x n plina de zero
    out = zeros(n);
    
    for i =  1 : n
        for j = 1 : n
            
            if (i < n/2)
                %primul patrat
                if (j < n/2)
                    out(i,j) = f(x1,y1);
                endif
                
                %al 2-lea patrat
                if (j > n/2)
                    out(i,j) = f(x1,y2);
                endif
            endif
            
            if (i > n/2)
                %al 3-lea patrat
                if (j < n/2)
                    out(i,j) = f(x2,y1);
                endif
                
                %al 4-lea patrat
                if (j > n/2)
                    out(i,j) = f(x2,y2);
                endif
            endif
            
        endfor
    endfor
    endfunction
function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)
    % =========================================================================
    % Calculeaza cele 4 puncte ce contin in interior (x, y)
    % Primeste si dimensiunea unei imagini m x n, pentru a asigura ca nu se
    % iese din matrice.
    % =========================================================================
    % calculeaza x1, y1, x2, y2
    x1 = ceil(x) - 1;
    y1 = ceil(y) - 1;
    
    if (x1 <= 0)
        x1 = 1;
    endif
    if (y1 <= 0)
        y1 = 1;
    endif
    
    % daca y se afla pe ultima linie, asigura ca y2 nu o sa iasa din
    % matrice (nu o sa fie m + 1 daca y1 = m)
    
    if (y1 == m)
        y2 = m;
    else
        y2 = y1 + 1;
    endif
    
    % analog daca x se afla pe ultima coloana
    if (x1 == n)
        x2 = n;
    else 
        x2 = x1 + 1;
    endif
    
endfunction
function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % cast I la double
    I = double(I);
    
    % matricea cu derivate fata de x Ix
    for i = 1 : m
        for j = 1 : n
            if (j == 1 || j == n)
                Ix(i, j) = 0;
            else
                Ix(i, j) = fx(I, j, i);
            endif
        endfor
    endfor
    
    % matricea cu derivate fata de y Iy
    for i = 1 : m
        for j = 1 : n
            if (i == 1 || i == m)
                Iy(i, j) = 0;
            else
                Iy(i, j) = fy(I, j, i);
            endif
        endfor
    endfor
    
    % matricea cu derivate fata de xy Ixy
    for i = 1 : m
        for j = 1 : n
            if (i == 1 || i == m || j == 1 || j == n)
                Ixy(i, j) = 0;
            else
                Ixy(i, j) = fxy(I, j, i);
            endif
        endfor
    endfor
    
endfunction

function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % convertește imaginea de intrare la alb-negru daca este cazul
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % initializeaza matricea finala
    R = zeros(p, q);

    % factorii de scalare
    s_x = (q - 1)/(n - 1);
    s_y = (p - 1)/(m - 1);
    
    % matricea de transformare pentru redimensionare
    A = [s_x 0; 0 s_y];
    inv_A = [1/s_x 0; 0 1/s_y];
    
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            X = inv_A * [x; y];
            x_p = X(1);
            y_p = X(2);
            
            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % calculeaza cel mai apropiati vecini
            x1 = ceil(x_p) - 1;
            y1 = ceil(y_p) - 1;
            
            % calculeaza valoarea pixelului din imaginea finala
            if (x_p <= (x1 + 1/2))
                if (y_p <= (y1 + 1/2))
                    R(y + 1, x + 1) = I(y1, x1);
                endif
                
                if (y_p > (y1 + 1/2))
                    R(y + 1, x + 1) = I(y1 + 1, x1);
                endif
            endif

            if (x_p > (x1 + 1/2))
                if (y_p <= (y1 + 1/2))
                    R(y + 1, x + 1) = I(y1, x1 + 1);
                endif

                if (y_p > (y1 + 1/2))
                    R(y + 1, x + 1) = I(y1 + 1, x1 + 1);
                endif
            endif
        endfor
    endfor
    
    % converteste matricea rezultat la uint8
    R = uint8(R);
endfunction

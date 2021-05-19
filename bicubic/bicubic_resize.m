function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare bicubica
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % initializeaza matricea finala
    R = zeros(p, q);
    
    % Cast I la double
    I = double(I);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % factorii de scalare
    s_x = (q - 1)/(n - 1);
    s_y = (p - 1)/(m - 1);
    
    % matricea de transformare pentru redimensionare
    A = [s_x 0; 0 s_y];
    % inversa transformarii
    inv_A = [1/s_x 0; 0 1/s_y];
    
    % precalculeaza derivatele
    [Ix, Iy, Ixy] = precalc_d(I);
    
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
            
            % punctele ce inconjoara punctul (xp, yp)
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);
            
            % calculeaza coeficientii de interpolare A
            A_coef = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            
            % trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1)
            x_p = x_p - x1;
            y_p = y_p - y1;
            
            % valoarea interpolata a pixelului (x, y)
            R(y + 1, x + 1) = [1 x_p x_p^2 x_p^3] * A_coef * [1; y_p; y_p^2; y_p^3];
        endfor
    endfor
    
    % transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
endfunction






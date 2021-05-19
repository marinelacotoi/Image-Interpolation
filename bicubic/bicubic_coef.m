function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate
    % =========================================================================

    % matricile intermediare
    A1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    A2 = transpose(A1);

    % converteste matricile intermediare la double
    A1 = double(A1);
    A2 = double(A2);

    % calculeaza matricea finala
    a = [f(y1,x1) f(y2,x1) Iy(y1,x1) Iy(y2,x1)];
    b = [f(y1,x2) f(y2,x2) Iy(y1,x2) Iy(y2,x2)];
    c = [Ix(y1,x1) Ix(y2,x1) Ixy(y1,x1) Ixy(y2,x1)];
    d = [Ix(y1,x2) Ix(y2,x2) Ixy(y1,x2) Ixy(y2,x2)];    
    X = [a; b; c; d];
    A = A1 * X * A2;
endfunction
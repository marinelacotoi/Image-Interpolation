function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    r = f(y - 1, x - 1) + f(y + 1, x + 1) - f(y + 1, x - 1) - f(y - 1, x + 1);
    r = r/4;
endfunction
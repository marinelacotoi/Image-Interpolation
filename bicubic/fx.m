function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================
    r = f(y, x + 1) - f(y, x - 1);
    r = r/2;
endfunction
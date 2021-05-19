function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    r = f(y + 1, x) - f(y - 1, x);
    r = r/2;
endfunction
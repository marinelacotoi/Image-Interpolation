function out = bilinear_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================
    % canalul rosu al imaginii
    red = img(:, :, 1);
    % canalul verde al imaginii
    green = img(:, :, 2);
    % canalul albastru al imaginii
    blue = img(:, :, 3);
    
    % aplica functia nn pe cele 3 canale ale imaginii
    red_output = bilinear_resize(red, p, q);
    green_output = bilinear_resize(green, p, q);
    blue_output = bilinear_resize(blue, p, q);

    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, red_output, green_output, blue_output);

endfunction
function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================
    % canalul rosu al imaginii
    red = img(:, :, 1);
    % canalul verde al imaginii
    green = img(:, :, 2);
    % canalul albastru al imaginii
    blue = img(:, :, 3);

    % aplica functia nn pe cele 3 canale ale imaginii
    red_output = nn_2x2(red, STEP);
    green_output = nn_2x2(green, STEP);
    blue_output = nn_2x2(blue, STEP);

    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, red_output, green_output, blue_output);
endfunction

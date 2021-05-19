function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    % canalul rosu al imaginii
    red = img(:, :, 1);
    % canalul verde al imaginii
    green = img(:, :, 2);
    % canalul albastru al imaginii
    blue = img(:, :, 3);

    % aplică rotația pe fiecare canal al imaginii
    red_output = bilinear_rotate(red, rotation_angle);
    green_output = bilinear_rotate(green, rotation_angle);
    blue_output = bilinear_rotate(blue, rotation_angle);

    % reconstruiește imaginea RGB finala
    out = cat(3, red_output, green_output, blue_output);
endfunction
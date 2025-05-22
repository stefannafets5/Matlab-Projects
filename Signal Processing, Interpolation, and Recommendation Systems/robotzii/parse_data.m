function [x, y] = parse_data(filename)
    fisier = fopen(filename, 'r');

    n = fscanf(fisier, '%d', 1);
    x = fscanf(fisier, '%f', n+1);
    y = fscanf(fisier, '%f', n+1);

    fclose(fisier);
endfunction
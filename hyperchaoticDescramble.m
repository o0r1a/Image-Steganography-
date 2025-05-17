function descrambled = hyperchaoticDescramble(scrambled_img, a, b, c, d, e, numIter)
    % Input validation and default parameters
    if nargin < 6
        e = 1;
    end
    if nargin < 5
        d = 2;
    end
    if nargin < 4
        c = 8/3;
    end
    if nargin < 3
        b = 28;
    end
    if nargin < 2
        a = 35;
    end
    if nargin < 7
        numIter = 2000;
    end
    
    % Get image dimensions
    [rows, cols, channels] = size(scrambled_img);
    
    % Initialize chaotic system
    x = 0.1;
    y = 0.2;
    z = 0.3;
    w = 0.4;
    v = 0.5;
    
    % Warm up the chaotic system
    for i = 1:numIter
        x_next = a * (y - x) + w + sin(z);
        y_next = b * x - y + z + exp(-w);
        z_next = c * (y - z) + cos(x * y);
        w_next = d * (z - w) + x * y + tan(x);
        v_next = e * (w - x) + y * z;
        
        x = mod(abs(x_next), 1);
        y = mod(abs(y_next), 1);
        z = mod(abs(z_next), 1);
        w = mod(abs(w_next), 1);
        v = mod(abs(v_next), 1);
    end
    
    % Generate chaotic sequences
    row_sequence = zeros(1, rows);
    col_sequence = zeros(1, cols);
    
    % Generate row permutation sequence
    for i = 1:rows
        x_next = a * (y - x) + w + sin(z);
        y_next = b * x - y + z + exp(-w);
        z_next = c * (y - z) + cos(x * y);
        w_next = d * (z - w) + x * y + tan(x);
        v_next = e * (w - x) + y * z;
        
        x = mod(abs(x_next), 1);
        y = mod(abs(y_next), 1);
        z = mod(abs(z_next), 1);
        w = mod(abs(w_next), 1);
        v = mod(abs(v_next), 1);
        
        row_sequence(i) = x;
    end
    
    % Generate column permutation sequence
    for i = 1:cols
        x_next = a * (y - x) + w + sin(z);
        y_next = b * x - y + z + exp(-w);
        z_next = c * (y - z) + cos(x * y);
        w_next = d * (z - w) + x * y + tan(x);
        v_next = e * (w - x) + y * z;
        
        x = mod(abs(x_next), 1);
        y = mod(abs(y_next), 1);
        z = mod(abs(z_next), 1);
        w = mod(abs(w_next), 1);
        v = mod(abs(v_next), 1);
        
        col_sequence(i) = y;
    end
    
    % Create permutation indices
    [~, row_perm] = sort(row_sequence);
    [~, col_perm] = sort(col_sequence);
    
    % Get inverse permutations
    [~, inv_row] = sort(row_perm);
    [~, inv_col] = sort(col_perm);
    
    % Initialize descrambled image
    descrambled = zeros(size(scrambled_img), 'like', scrambled_img);
    
    % Apply descrambling
    for ch = 1:channels
        temp = scrambled_img(:,:,ch);
        % Two-step descrambling
        temp = temp(:,inv_col);
        temp = temp(inv_row,:);
        descrambled(:,:,ch) = temp;
    end
end
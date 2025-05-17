function stego_img = embedMessage(scrambled_img, secret_msg)
    [M, N] = size(scrambled_img);
    max_len = M * N;

    % Convert message to binary
    msg_bin = dec2bin(secret_msg, 8)';
    msg_bin = msg_bin(:) - '0';  % Column vector of bits

    msg_len = length(msg_bin);
    if msg_len > max_len
        error('Message too long to embed in image.');
    end

    % Flatten scrambled image
    flat_img = scrambled_img(:);
    flat_img = uint8(flat_img * 255); % Scale and convert

    % Embed bits into LSB
    for i = 1:msg_len
        flat_img(i) = bitset(flat_img(i), 1, msg_bin(i));
    end

    % Reshape and convert back
    stego_img = reshape(flat_img, M, N);
    stego_img = im2double(stego_img);
end

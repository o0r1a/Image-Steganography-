function secret_msg = extractMessage(stego_img, original_msg_length)
    % Number of bits = original_msg_length x 8
    total_bits = original_msg_length * 8;

    % Flatten and convert
    flat_img = stego_img(:);
    flat_img = uint8(flat_img * 255);

    % Extract bits from LSB
    msg_bits = zeros(total_bits, 1);
    for i = 1:total_bits
        msg_bits(i) = bitget(flat_img(i), 1);
    end

    % Convert bits to characters
    msg_bits = reshape(msg_bits, 8, [])';
    secret_msg = char(bin2dec(num2str(msg_bits)))';
end

function stego_img = messagembednew(scrambled_img, message)
    % Convert message to binary
    binary_message = reshape(dec2bin(uint8(message), 8)', 1, []);
    message_length = numel(binary_message);
    
    % Check if image can hold the message
    if message_length + 32 > numel(scrambled_img)
        error('Message is too long for this image');
    end
    
    % Convert image to double for processing
    img_flat = double(scrambled_img(:));
    
    % Embed message length first (32 bits)
    length_binary = dec2bin(message_length, 32);
    for i = 1:32
        img_flat(i) = bitset(img_flat(i), 1, str2double(length_binary(i)));
    end
    
    % Embed actual message
    for i = 1:message_length
        img_flat(i + 32) = bitset(img_flat(i + 32), 1, str2double(binary_message(i)));
    end
    
    % Reshape back to image
    stego_img = reshape(img_flat, size(scrambled_img));
    stego_img = uint8(stego_img);
end
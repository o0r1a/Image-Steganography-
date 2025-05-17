function [extracted_message] = extractMessageAndDescramble(stego_img)
    % Convert image to double
    img_flat = double(stego_img(:));
    
    try
        % Get message length from first 32 bits
        length_bits = bitget(img_flat(1:32), 1);
        length_str = arrayfun(@num2str, length_bits, 'UniformOutput', false);
        length_binary = strjoin(length_str, '');
        message_length = bin2dec(length_binary);
        
        % Validate message length
        if message_length <= 0 || message_length > (numel(img_flat) - 32)
            error('Invalid message length detected');
        end
        
        % Extract message bits
        message_bits = bitget(img_flat(33:32+message_length), 1);
        message_str = arrayfun(@num2str, message_bits, 'UniformOutput', false);
        binary_message = strjoin(message_str, '');
        
        % Convert to ASCII
        binary_chars = reshape(binary_message, 8, [])';
        extracted_message = char(bin2dec(binary_chars));
        
    catch
        extracted_message = 'Error: Message extraction failed';
    end
end
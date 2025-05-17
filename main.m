% MAIN.M – Full Image Steganography Pipeline with Scrambling & Embedding

try
    % Step 1: Input Image
    disp('------ Image Steganography System ------');
    disp('1. Choose Cover Image');
    [filename, pathname] = uigetfile({'*.png;*.jpg;*.jpeg'}, 'Select an Image'); 
    if isequal(filename, 0) || isequal(pathname, 0)
        error('No image file selected');
    end

    original_image = imread(fullfile(pathname, filename));
    % Convert to grayscale if needed
    if size(original_image,3) == 3
        gray_image = rgb2gray(original_image);
    else
        gray_image = original_image;
    end

    figure(1);
    imshow(gray_image);
    title('Original Image');

    % Step 2: Input Secret Message
    message = input('Enter the secret message to embed: ', 's');
    if isempty(message)
        error('Message cannot be empty');
    end

    % Step 3: Define hyperchaotic system parameters
    a = 35;    
    b = 28;
    c = 8/3;
    d = 2;
    e = 1;
    numIter = 2000; 
   

    % Step 4: Scramble the image
    scrambled_img = hyperchaoticScramble(gray_image, a, b, c, d, e, numIter);
    figure(2);
    imshow(scrambled_img);
    title('Scrambled Image');

    % Step 5: Embed the secret message
    stego_img = messagembednew(scrambled_img, message);
    figure(3);
    imshow(stego_img);
    title('Stego Image');

       % Step 6: Extract message from the stego image
    try
        % First extract the message bits
        img_flat = double(stego_img(:));
        
        % Get message length from first 32 bits
        length_bits = bitget(img_flat(1:32), 1);
        length_str = arrayfun(@num2str, length_bits, 'UniformOutput', false);
        length_binary = strjoin(length_str, '');
        message_length = bin2dec(length_binary);
        
        % Extract message bits
        message_bits = bitget(img_flat(33:32+message_length), 1);
        message_str = arrayfun(@num2str, message_bits, 'UniformOutput', false);
        binary_message = strjoin(message_str, '');
        
        % Convert to ASCII
        binary_chars = reshape(binary_message, 8, [])';
        extracted_msg = char(bin2dec(binary_chars));
        
        % Display extracted message
        disp('Successfully extracted the message:');
        disp(extracted_msg);
    catch
        disp('Error extracting message. The message might be corrupted.');
    end

    % Step 7: Descramble image to recover the original
    try
        descrambled_img = hyperchaoticDescramble(stego_img, a, b, c, d, e, numIter);
        figure(4);
        imshow(descrambled_img);
        title('Descrambled Image');

        % Calculate and display PSNR
        if isequal(size(gray_image), size(descrambled_img))
            psnr_val = psnr(double(gray_image), double(descrambled_img));
            disp(['PSNR between original and recovered image: ', num2str(psnr_val), ' dB']);
        else
            disp('Cannot calculate PSNR: Image dimensions do not match');
        end
    catch
        disp('Error during descrambling process');
    end

catch err
    % Main error handling
    disp('An error occurred in the main process:');
    disp(err.message);
end
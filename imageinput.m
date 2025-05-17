
% Select an image
[file, path] = uigetfile({'*.png;*.jpeg;*.bmp', 'Image Files'}, 'Select an Image');
if isequal(file, 0)
    disp('User canceled the operation');
    return;
end
img = imread(fullfile(path, file));
img = imresize(img, [256, 256]); % Resize to 256x256 if needed
figure, imshow(img), title('Original Image');

% Input the secret message
message = input('Enter the secret message: ', 's');

clear
clc
image = 'switch.png';
mat = imread(image);
% 5 clicks!
mat = berkelize(mat, 50, 7, mat(50,7,:), 'B');
mat = berkelize(mat, 50, 30, mat(50,30,:), 'G');
mat = berkelize(mat, 50, 70, mat(50,70,:), 'B');
mat = berkelize(mat, 32, 32, mat(32,32,:), 'B');
mat = berkelize(mat, 59, 88, mat(59,88,:), 'G');
imshow(mat)
imwrite(mat,'berkelized!.png');
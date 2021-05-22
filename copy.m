% FACE DETECTION:
clear ALL
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
 I = imread('Modi.jpg');
%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I);
hold on
k=1;
for i = 1:size(BB,1) % draw rectanlge in row wise
    rectangle('Position',BB(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','g');
    %start from first row then second and ....
   
end
% title('Face Detection');
hold off;
for i= 1:size(BB,1)
    J= imcrop(I,BB(i,:));
    p2=strcat('cropped faces/', int2str(k),'.jpg');
    I2 = rgb2gray(J); 
    I2= imresize(I2, [200 150]);
    k=k+1;
    imwrite(I2,p2)
end
% Face Recognition
TrainDatabasePath= 'C:\Users\zargham\Desktop\Project\faces database';
  TestDatabasePath= 'C:\Users\zargham\Desktop\Project\cropped faces';

  srfile=dir('cropped faces/*.jpg');
for i=1:length(srfile)
    prompt=strcat('cropped faces/',srfile(i).name);
im = imread(prompt);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
% S={'20.jpg'};
OutputName= Recognition(prompt, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
figure,
subplot(2,2,1)
imshow(im)
title('Test Image');
% figure,
subplot(2,2,2);
imshow(SelectedImage)
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
end
clear 
clc
  
%Capture image
cam = webcam;
img=snapshot(cam);
imshow(img);
clear('cam');

%saving the image
saveas(gcf,'image.png');

%to detect face
FDetect = vision.CascadeObjectDetector;

%read input image
I = imread('image.png');

BB = step(FDetect,I);

figure,

imshow(I); hold on
k=1;

for i=1:size(BB,1)
    
    rectangle('Position',BB(i,:),'Linewidth',3,'LineStyle','-','Edgecolor','b');
end

title('Face Detection');

hold off;


for i= 1:size(BB,1)
    J= imcrop(I,BB(i,:));
    p2=strcat('cropped faces\', int2str(k),'.jpg');
    I2 = rgb2gray(J); 
    I2= imresize(I2, [200 150]);
    k=k+1;
    imwrite(I2,p2)
end

% Face Recognition
TrainDatabasePath= 'D:\Matlab projects\Automatic attendance system based on face detection\faces database';
  TestDatabasePath= 'D:\Matlab projects\Automatic attendance system based on face detection\cropped faces';

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
subplot(1,2,1)
imshow(im)
title('Test Image');
   %  figure,
subplot(1,2,2);
imshow(SelectedImage)
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str);
end



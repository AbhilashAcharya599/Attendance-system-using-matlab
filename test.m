clear 
clc

k=1;
for a=1:3
%Capture image
cam = webcam;
img=snapshot(cam);
imshow(img);
clear('cam');

%saving the image
saveas(gcf,strcat(int2str(a),'.png'));

%to detect face
FDetect = vision.CascadeObjectDetector;

%read input image
I = imread(strcat(int2str(a),'.png'));

BB = step(FDetect,I);

figure,

imshow(I); hold on

for i=1:size(BB,1)
    
    rectangle('Position',BB(i,:),'Linewidth',3,'LineStyle','-','Edgecolor','b');
end

title('Face Detection');
m
hold off;

for i= 1:size(BB,1)
    J= imcrop(I,BB(i,:));
    p2=strcat('faces database\', int2str(k),'.jpg');
    I2 = rgb2gray(J); 
    I2= imresize(I2, [200 150]);
    k=k+1;
    imwrite(I2,p2);
    pause(1);
end
end
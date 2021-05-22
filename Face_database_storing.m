clc
clear
%Create a detector object.
faceDetector= vision.CascadeObjectDetector;

%Read input image from usb webcam
obj = imaq.VideoDevice('winvideo',1,'MJPG_1280x720');
set (obj,'ReturnedColorSpace','rgb');

%preview(obj)
figure('menubar','figure','tag','webcam');
k=1;
while(true)
    frame=step(obj);
    bboxes=step(faceDetector,frame);
    IFaces = insertObjectAnnotation(frame,'rectangle',bboxes,'Face');
    imshow(IFaces,'border','tight')
    f=findobj('tag','webcam');
    
    for i= 1:size(bboxes,1)
    J= imcrop(IFaces,bboxes(i,:));
    p2=strcat('faces database\', int2str(k),'.jpg');
    I2 = rgb2gray(J); 
    I2= imresize(I2, [200 150]);
    k=k+1;
    imwrite(I2,p2)
    end

    if(isempty(f))
        close(gcf)
        break
    end
    pause(1)
end
clear;
release(obj)

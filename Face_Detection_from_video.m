clc
clear
%Create a detector object.
faceDetector= vision.CascadeObjectDetector;

%Read input image from usb webcam
obj = imaq.VideoDevice('winvideo',1,'MJPG_1280x720');
set (obj,'ReturnedColorSpace','rgb');

%preview(obj)
figure('menubar','none','tag','webcam');
while(true)
    frame=step(obj);
    bboxes=step(faceDetector,frame);
    IFaces = insertObjectAnnotation(frame,'rectangle',bboxes,'Me');
    imshow(IFaces,'border','tight')
    f=findobj('tag','webcam');
    
   
    
    for k=1:9
    for i= 1:size(bboxes,1)
     
    J= imcrop(frame,bboxes(i,:));
    pause(0.1);
    p2=strcat('cropped faces\', int2str(k),'.jpg');
    I2 = rgb2gray(J); 
    I2= imresize(I2, [200 150]);
    k=k+1;
    imwrite(I2,p2)
    end
    end

    if(isempty(f))
        close(gcf)
        break
    end
    pause(0.05)
end
release(obj)

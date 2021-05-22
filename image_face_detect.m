webcamlist
cam = webcam;
img=snapshot(cam);
imshow(img);
clear('cam');
faceDetector= vision.CascadeObjectDetector;

while(true)
    frame = step(img);
    bboxes=step(faceDetector,frame);
    IFaces = insertObjectAnnotation(frame,'rectangle',bboxes,'Me');
    imshow(IFaces,'border','tight')
    f=findobj('tag','webcam');
    if(isempty(f))
        close(gcf)
        break
    end
    pause(0.05)
end
release(img)
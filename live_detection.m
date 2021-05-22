%clear all;
cam=webcam;
videoFrame=snapshot(cam);
frameSize=size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]]);
runLoop=true;
while runLoop
    img=snapshot(cam);
    [croppedimage,bboxPoints]=Myfacedetect(img);
    bboxPolygon=reshape(bboxPoints',1,[]);
    videoFrame=insertShape(img,'Polygon',bboxPolygon,'LineWidth',4);
    step(videoPlayer,videoFrame);
    runLoop=isOpen(videoPlayer);
end
clear cam;
release(videoPlayer);

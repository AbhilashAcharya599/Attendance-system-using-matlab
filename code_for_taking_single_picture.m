webcamlist
cam = webcam;
img=snapshot(cam);
imshow(img);
clear('cam');

saveas(gcf,'image1.png');

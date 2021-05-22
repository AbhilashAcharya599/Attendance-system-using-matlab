clear all;
cam=webcam;
nof=input('Enter number of images required');
count=1;
while count<=nof
    img=snapshot(cam);
    [croppedframe,bboxPoints]=Myfacedetect(img);
    imshow(croppedframe);
    if ~isempty(croppedframe)
        filename=strcat('C:\Program Files Matlab\bin\database\',sprintf('%d.png',count));
        imwrite(croppedframe,filename);
        msg=['Image aacquired no:',num2str(count)];
        disp(msg);
        count=count+1;
    else
        disp('No face detected');
    end
    clf('reset')
    pause(0.1)
end
clear cam;

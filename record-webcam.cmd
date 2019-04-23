rem Script for recording web-camera to certain folder with date and time stamp

@echo off

SET VLC=C:\Program Files (x86)\VideoLAN\VLC\vlc.exe
SET TimeSec=20

For /f "tokens=1-2 delims=/:/ " %%a in ('time /t') do (set mytime=%%a-%%b)

:START

"%VLC%" -V dummy --intf=dummy --dummy-quiet --no-audio ^
    --run-time=%TimeSec% ^
    --sout=#transcode{vcodec=h264,acodec=mp4a,vb=1024,ab=128,width=640,height=480}:duplicate{dst=standard{access=file,mux=ps,dst="recordings\%DATE% - %mytime%.mp4"}} ^
    "dshow://" vlc://quit

rem Sleeping for 20min*60sec
timeout /T 1200

GOTO START
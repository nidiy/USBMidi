@echo off
cd %~dp0 & cd
set FLEX_SDK=F:\AIRSDK\AIRSDK24
set PATH=%FLEX_SDK%\bin;%PATH%
call adt -package -tsa none -storetype pkcs12 -keystore ane.p12 -storepass fd -target ane USBMidi.ane extension.xml -swc USBMidi.swc -platform Windows-x86 library.swf USBMidiANE.dll
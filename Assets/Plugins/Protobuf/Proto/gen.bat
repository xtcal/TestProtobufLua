@echo off
set Path=..\ProtoGen\protogen.exe
for /f "delims=" %%i in ('dir /b proto "*.proto"') do %Path% -i:%%i -o:..\Csharp/%%~ni.cs
pause
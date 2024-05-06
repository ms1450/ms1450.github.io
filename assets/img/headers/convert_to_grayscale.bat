@echo off
setlocal enabledelayedexpansion

REM Path to the directory containing the .webp files
set DIRECTORY=D:\Coding\ms1450.github.io\assets\img\headers

REM Loop through all .webp files in the directory
for %%f in (%DIRECTORY%\*.webp) do (
    echo Processing %%f
    REM Create a temporary output file name
    set tempfile=%%~dpnf_temp%%~xf
    REM Use ffmpeg to convert the image to grayscale
    ffmpeg -i "%%f" -vf format=gray "!tempfile!"
    REM Move the temporary file back to the original file
    move /Y "!tempfile!" "%%f"
)

echo All files have been processed.


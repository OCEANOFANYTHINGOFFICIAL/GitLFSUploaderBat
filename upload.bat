@echo off
color 1f
title Git Large File System Uploader Bot
set /p dir=Give Location Of Uploading Directory: 
echo.
echo Uploading Directory:  %dir%
echo.
set /p opti=add README.md ?: 
if %opti% == yes goto opt-yes
if %opti% == no goto oth
if %opti% == Yes goto opt-yes
if %opti% == No goto oth
if %opti% == YES goto opt-yes
if %opti% == NO goto oth
echo.
:opt-yes
set /p rme=Write Your Readme.md Here In One Line: 
echo.
echo Readme.md:  %rme%
echo.
echo # %rme% >> README.md
:oth
set /p ext=Mention Which File Types (extentions or names) Will Be Tracked With LFS. Type(*.*) To Track All: 
echo.
echo File Will Be Tracked : %rme%
echo.
set /p com=Write Your Commit Message Here: 
echo.
echo Commit Message:  %com%
echo.
set /p remurl=Give Your Remote URL: 
echo.
echo Remote Url:  %remurl%
echo.
set /p branch=Set Your Git Branch: 
cd %dir%
git init
git lfs track "%ext%"
git add .gitattributes
git add .
git commit -m "%com%"
git branch -M %branch%
git remote add origin %remurl%
git push -u origin %branch%
echo.
echo.
echo Done Uploading !!!
pause >nul
start %remurl%
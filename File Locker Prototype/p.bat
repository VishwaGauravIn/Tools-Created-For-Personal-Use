@echo off
cls
goto :Home
:Encrypt
cls
Title Encrypt
echo Encrypt Menu!
echo _____________
echo Select File to Encrypt (With Extension) 
set /p FileName=
cls
echo Encrypt Menu!
echo _____________
echo Select Password to Encrypt (Without Space) 
set /p FilePass=
set MasterKey=vg123
(
echo %FileName%
echo %FilePass%
echo %date%
echo %time% )>o.dat
(
echo %FilePass% )>p.dat
7z a -p%FilePass% application %Filename%
7z a -p%MasterKey% application2 application.7z o.dat p.dat
del o.dat
del application.7z
del p.dat
move application2.7z Encrypt\
set RandomName=%random%
rename Encrypt\application2.7z %RandomName%.vg
cls
echo Your File : %FileName% is Successfully Encrypted!
echo UserName: %RandomName% Password: %FilePass%
echo THIS INFO WILL BE REQUIRED FOR DECRYPTION!!
pause
goto :Home
:Decrypt
cls
Title Decrypt
echo Decrypt Menu!
echo _____________
echo Enter Username:-
set /p Username=
if exist Encrypt\%Username%.vg goto :Password 
goto :Error2
:Password
cls
set Zone=Zone\
set vg=vg123
7z x -y -o%Zone% -p%vg% Encrypt\%Username%.vg
cls
Title Decrypt
echo Decrypt Menu!
echo _____________
echo Enter Password:-
set /p Password=
set /p CorrectPassword=< Zone\p.dat
if %Password% == %CorrectPassword% goto :DecDone
del /f /q Zone\*.*
goto Error3

:DecDone
set Zone2=Decrypt\
set FinalPass=%Password%
7z x -y -o%Zone2% -p%FinalPass% Zone\application.7z
del /f /q Zone\*.*
cls
Title Success!!
echo SuccessFully Decrypted!
pause
goto :Home
:Error3
cls
echo Wrong Password!
pause
goto :Decrypt
:Error2
cls
echo Wrong Username!
pause
goto :Decrypt

:Error
echo Invalid Selection, Please choose 1 or 2
pause
:Home
cls
title Prototype Lock System 
echo Select Your Option
echo ___________________
echo 1.Encrypt
echo 2.Decrypt
SET /p opt=
if %opt%==1 (
goto :Encrypt
)
if %opt%==2 (
goto :Decrypt
) 
goto :Home
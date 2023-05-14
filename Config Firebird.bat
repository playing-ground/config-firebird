@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Parando Firebird ...
net stop FirebirdServerDefaultInstance

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
echo 32-bit OS
if "%NUMBER_OF_PROCESSORS%" EQU "1" goto :END
if "%NUMBER_OF_PROCESSORS%" EQU "2" goto :cpu2
if "%NUMBER_OF_PROCESSORS%" EQU "3" goto :cpu3
if "%NUMBER_OF_PROCESSORS%" EQU "4" goto :cpu4
if "%NUMBER_OF_PROCESSORS%" EQU "5" goto :cpu5
if "%NUMBER_OF_PROCESSORS%" EQU "6" goto :cpu6
if "%NUMBER_OF_PROCESSORS%" EQU "7" goto :cpu7
if "%NUMBER_OF_PROCESSORS%" GEQ "8" goto :cpu8

:cpu2
cls
echo 2 processador 
copy /b/v/y ".\\cpu2\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu3
cls
echo 3 processador 
copy /b/v/y ".\\cpu3\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu4
cls
echo 4 processador 
copy /b/v/y ".\\cpu4\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu5
cls
echo 5 processador 
copy /b/v/y ".\\cpu5\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu6
cls
echo 6 processador 
copy /b/v/y ".\\cpu6\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu7
cls
echo 7 processador 
copy /b/v/y ".\\cpu7\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:cpu8
cls
echo 8 processador 
copy /b/v/y ".\\cpu8\firebird.conf" "C:\Program Files (x86)\Firebird\Firebird_2_5\"
goto END

:64BIT
echo 64-bit OS
if "%NUMBER_OF_PROCESSORS%" EQU "1" goto :END
if "%NUMBER_OF_PROCESSORS%" EQU "2" goto :cpu2
if "%NUMBER_OF_PROCESSORS%" EQU "3" goto :cpu3
if "%NUMBER_OF_PROCESSORS%" EQU "4" goto :cpu4
if "%NUMBER_OF_PROCESSORS%" EQU "5" goto :cpu5
if "%NUMBER_OF_PROCESSORS%" EQU "6" goto :cpu6
if "%NUMBER_OF_PROCESSORS%" EQU "7" goto :cpu7
if "%NUMBER_OF_PROCESSORS%" GEQ "8" goto :cpu8

:cpu2
cls
echo 2 processador 
copy /b/v/y ".\\cpu2\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu3
cls
echo 3 processador 
copy /b/v/y ".\\cpu3\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu4
cls
echo 4 processador 
copy /b/v/y ".\\cpu4\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu5
cls
echo 5 processador 
copy /b/v/y ".\\cpu5\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu6
cls
echo 6 processador 
copy /b/v/y ".\\cpu6\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu7
cls
echo 7 processador 
copy /b/v/y ".\\cpu7\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:cpu8
cls
echo 8 processador 
copy /b/v/y ".\\cpu8\firebird.conf" "C:\Program Files\Firebird\Firebird_2_5\"
goto END

:END
echo Iniciando Firebird ...
net start FirebirdServerDefaultInstance
cls
echo Finalizado com sucesso!
pause
exit




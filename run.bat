@echo off
setlocal enabledelayedexpansion

REM Specify the path to the INI file
set "iniFile=settings.ini"

REM Check if the INI file exists
if not exist "%iniFile%" (
    echo INI file not found: %iniFile%
    goto :eof
)

REM Read settings from the INI file
for /f "tokens=1,* delims==" %%A in ('type "%iniFile%" ^| find "="') do (
    set "setting=%%A"
    set "value=%%B"
    if /i "!setting!"=="TextColor" (
        set "textColor=!value!"
    ) else if /i "!setting!"=="BackgroundColor" (
        set "bgColor=!value!"
    ) else if /i "!setting!"=="WindowTitle" (
        set "title=!value!"
    )
)

REM Apply appearance changes to the Command Prompt
if defined textColor (
    color !textColor!
) else (
    echo TextColor not specified in the INI file.
)

if defined bgColor (
    color !bgColor!
) else (
    echo BackgroundColor not specified in the INI file.
)

if defined title (
    title !title!
) else (
    echo WindowTitle not specified in the INI file.
)

REM Additional commands can be added here to customize further

:end

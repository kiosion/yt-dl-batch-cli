@echo off
mode con: cols=72 lines=64
title Youtube-dl-cli
color 9f

cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script --               ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^\                ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^|                ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^/                ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script --               ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^\                ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^|                ^|
echo +==================================================+
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 Starting script ^/                ^|
echo +==================================================+
goto startmenu

:startmenu
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                  - Welcome -                     ^|
echo ^|      Enter video URL(s) seperated by spaces:     ^|
echo +==================================================+
set /p urls=: 
goto options

:options
cls
if "!%urls%!"=="! !" (
    echo +================= YOUTUBE-DL-CLI =================+
    echo ^|--------------------------------------------------^|
    echo ^|     Error: No URL(s) provided, reloading...      ^|
    echo +==================================================+
    timeout /t 1 /nobreak > NUL
    goto startmenu
)
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                  - Main Menu -                   ^|
echo ^|                    [D]ownload                    ^|
echo ^|                    [R]eload                      ^|
echo ^|                    [E]xit                        ^|
echo +==================================================+

choice /C DRE /N /M ": "
goto menu%errorlevel%
echo Please enter a valid selection.
goto options

:menu1
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 - Download Menu -                ^|
echo ^|                [1] Video + audio                 ^|
echo ^|                [2] Audio only                    ^|
echo ^|                [E] Return                        ^|
echo +==================================================+

choice /C 12E /N /M ": "
goto submenu%errorlevel%
echo Please enter a valid selection.
goto menu1

:submenu1
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                 - Video + audio -                ^|
echo ^|            [1] Highest quality (MP4)             ^|
echo ^|            [2] Highest quality (MKV)             ^|
echo ^|            [3] Highest quality + metadata (MP4)  ^|
echo ^|            [4] Highest quality + metadata (MKV)  ^|
echo ^|            [E] Return                            ^|
echo +==================================================+

choice /C 1234E /N /M ": "
goto dlv%errorlevel%
echo Please enter a valid selection.
goto submenu1

:submenu2
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo ^|                  - Audio only -                  ^|
echo ^|            [1] Highest quality (MP3)             ^|
echo ^|            [2] Highest quality (FLAC)            ^|
echo ^|            [E] Return                            ^|
echo +==================================================+

choice /C 12E /N /M ": "
goto dla%errorlevel%
echo Please enter a valid selection.
goto submenu2

:submenu3
goto options

:dlv1
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestvideo+bestaudio --merge-output-format mp4 -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dlv2
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestvideo+bestaudio --merge-output-format mkv -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dlv3
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestvideo+bestaudio --write-description --write-info-json --write-annotations --write-sub --write-thumbnail --merge-output-format mp4 -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dlv4
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestvideo+bestaudio --write-description --write-info-json --write-annotations --write-sub --write-thumbnail --merge-output-format mkv -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dlv5
goto menu1

:dla1
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestaudio --extract-audio --audio-format mp3 -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dla2
cls
echo +================= YOUTUBE-DL-CLI =================+
echo ^|--------------------------------------------------^|
echo URL(s) to download: %urls%
echo .
youtube-dl -f bestaudio --extract-audio --audio-format flac -o "/dl/%%(channel)s/[%%(upload_date)s] %%(channel)s - %%(title)s (%%(id)s).%%(ext)s" %urls%
echo +--------------------------------------------------+
echo ^|                  Downloads done.                 ^|
echo ^|--------------------------------------------------^|
echo +=============PRESS ANY KEY TO REFRESH=============+
timeout /t 120 > NUL
break>..\dl.txt
goto startmenu

:dla3
goto menu1

:menu2
cls
goto startmenu

:menu3
exit

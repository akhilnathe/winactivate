@echo off
pushd "%~dp0"

echo ================================================================
echo winactivate - Easy-to-use Windows HWID/KMS38 Activation Script.
echo https://github.com/luzeadev/winactivate
echo ================================================================
echo.

if "%~1" equ "1170c13a-b5d6-4ad4-9e3c-8077466a7552" goto main

goto check_administrator_privileges

:check_administrator_privileges
reg query "HKU\S-1-5-19" >nul 2>&1 || (
    echo This script requires Administrator privileges to run.
    echo Either run it from an administrator command prompt, or right-click the script and choose "Run as administrator".
    echo.
    goto exit
)

goto main

:main
for /f "tokens=6 delims=[]. " %%a in ('ver') do (
    if "%%a" lss "10240" (
        echo This script requires build 10240 or above to run.
        echo.
        goto exit
    )
)

echo Installing product key...
for /f %%a in ('powershell -command "(Get-WmiObject Win32_OperatingSystem).OperatingSystemSKU"') do (
    if "%%a" equ "4" set "product_key=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C"
    if "%%a" equ "7" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY"
            if "%%b" equ "17763" set "product_key=N69G4-B89J2-4G8F4-WWYCC-J464C"
            if "%%b" geq "20348" set "product_key=VDYBN-27WPP-V4HQT-9VMD4-VMK7H"
        )
    )
    if "%%a" equ "8" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=CB7KF-BWN84-R7R2Y-793K2-8XDDG"
            if "%%b" equ "17763" set "product_key=WMDGN-G9PQG-XVVXX-R3X43-63DFG"
            if "%%b" geq "20348" set "product_key=WX4NM-KYWYW-QJJR4-XV3QB-6VM33"
        )
    )
    if "%%a" equ "27" set "product_key=3V6Q6-NQXCX-V8YXR-9QCYV-QPFCT"
    if "%%a" equ "48" set "product_key=VK7JG-NPHTM-C97JM-9MPGT-3V66T"
    if "%%a" equ "49" set "product_key=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT"
    if "%%a" equ "50" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=JCKRF-N37P4-C2D82-9YXRT-4M63B"
            if "%%b" equ "17763" set "product_key=WVDHN-86M7X-466P6-VHXV7-YY726"
        )
    )
    if "%%a" equ "98" set "product_key=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW"
    if "%%a" equ "99" set "product_key=N2434-X9D7W-8PF6X-8DV9T-8TYMD"
    if "%%a" equ "100" set "product_key=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT"
    if "%%a" equ "101" set "product_key=YTMG3-N6DKC-DKB77-7M9GH-8HVX7"
    if "%%a" equ "121" set "product_key=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY"
    if "%%a" equ "122" set "product_key=84NGF-MHBT6-FXBX8-QWJK7-DRR8H"
    if "%%a" equ "125" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "10240" set "product_key=FWN7H-PF93Q-4GGP8-M8RF3-MDWWW"
            if "%%b" equ "14393" set "product_key=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX"
            if "%%b" equ "17763" set "product_key=43TBQ-NH92J-XKTM7-KT3KK-P39PB"
        )
    )
    if "%%a" equ "126" (
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "10240" set "product_key=8V8WN-3GXBH-2TCMG-XHRX3-9766K"
            if "%%b" equ "14393" set "product_key=2DBW3-N2PJG-MVHW3-G7TDK-9HKR4"
            if "%%b" equ "17763" set "product_key=M33WV-NHY3C-R7FPM-BQGPT-239PG"
        )
    )
    if "%%a" equ "145" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG"
            if "%%b" equ "17763" set "product_key=6NMRW-2C8FM-D24W7-TQWMY-CWH2D"
            if "%%b" geq "20348" set "product_key=QFND9-D3Y9C-J3KKY-6RPVP-2DPYV"
        )
    )
    if "%%a" equ "146" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=PTXN8-JFHJM-4WC78-MPCBR-9W4KR"
            if "%%b" equ "17763" set "product_key=N2KJX-J94YW-TQVFB-DG9YT-724CC"
            if "%%b" geq "20348" set "product_key=67KN8-4FYJW-2487Q-MQ2J7-4C4RG"
        )
    )
    if "%%a" equ "161" set "product_key=DXG7C-N36C4-C4HTG-X4T3X-2YV77"
    if "%%a" equ "162" set "product_key=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ"
    if "%%a" equ "164" set "product_key=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB"
    if "%%a" equ "165" set "product_key=GJTYN-HDMQY-FRR76-HVGC7-QPF8P"
    if "%%a" equ "168" (
        set "kms38="
        for /f "tokens=6 delims=[]. " %%b in ('ver') do (
            if "%%b" equ "14393" set "product_key=VP34G-4NPPG-79JTQ-864T4-R3MQX"
            if "%%b" equ "17763" set "product_key=FDNH6-VW9RW-BXPJ7-4XTYG-239TB"
            if "%%b" geq "20348" set "product_key=6N379-GGTMK-23C6M-XVVTC-CKFRQ"
        )
    )
    if "%%a" equ "171" set "product_key=YYVX9-NTFWV-6MDM3-9PT4T-4M68B" && set "kms38="
    if "%%a" equ "172" set "product_key=44RPN-FTY23-9VTTB-MP9BX-T84FV" && set "kms38="
    if "%%a" equ "175" set "product_key=NJCF7-PW8QT-3324D-688JX-2YV66"
    if "%%a" equ "188" set "product_key=XQQYW-NFFMW-XJPBH-K8732-CKFFD"
)


if not defined product_key (
    echo This edition or version of Windows is not supported by this script.
    echo.
    goto exit
)

cscript "%systemdrive%\Windows\System32\slmgr.vbs" /ipk "%product_key%"

if "%errorlevel%" neq "0" (
    echo An error occurred while installing the product key.
    echo.
    goto exit
)

if exist "%~dp0GenuineTicket.xml" del /f "%~dp0GenuineTicket.xml"

if not exist "%~dp0gatherosstate.exe" (
    echo This script requires gatherosstate.exe to be in the same directory as this script.
    echo Please re-download the script from https://github.com/luzeadev/winactivate/releases.
    echo.
    goto exit
)

if not exist "%~dp0slc.dll" (
    echo This script requires slc.dll to be in the same directory as this script.
    echo Please re-download the script from https://github.com/luzeadev/winactivate/releases.
    echo.
    goto exit
)

echo Patching gatherosstate.exe...
rundll32 "%~dp0slc.dll",PatchGatherosstate

if not exist "%~dp0gatherosstatemodified.exe" (
    echo An error occurred while patching gatherosstate.exe.
    echo.
    goto exit
)

echo Generating GenuineTicket.xml...
"%~dp0gatherosstatemodified.exe"

if not exist "%~dp0GenuineTicket.xml" (
    echo GenuineTicket.xml generation failed. Please check your internet connection and try again.
    echo.
    goto exit
)

echo Applying GenuineTicket.xml...
copy /y /b "%~dp0GenuineTicket.xml" "%systemdrive%\ProgramData\Microsoft\Windows\ClipSVC\GenuineTicket"
"%systemdrive%\Windows\System32\ClipUp.exe" -o -v
echo.

if "%errorlevel%" neq "0" (
    echo ClipUp.exe failed to apply GenuineTicket.xml. Please check your internet connection and try again.
    echo.
    goto exit
)

echo Activating Windows...
if defined kms38 (
    cscript "%systemdrive%\Windows\System32\slmgr.vbs" /ato
)

for /f %%a in ('powershell -command "(Get-WmiObject SoftwareLicensingProduct).LicenseStatus | ForEach-Object { if ($_ -eq 1 ) { $_ } }"') do (
    if "%%a" neq "1" (
        echo Activation failed. Please check your internet connection and try again.
        echo.
        goto exit
    )
)

echo Activation complete.
echo.
goto exit

:exit
pause
goto :eof

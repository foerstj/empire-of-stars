:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: map name, case sensitive
set map_cs=EoS
:: map name, lowercase
set map=eos
:: path of vanilla DS1 documents dir (where map gets saved into)
set doc_ds=%USERPROFILE%\Documents\Dungeon Siege
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "CC-BY-SA 2021" -title "Empire of Stars" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
:: exclude .psd that might be present locally; exclude nn files
robocopy "%doc_dsloa%\Bits\art" "%tmp%\Bits\art" /E /xf .gitignore /xf *.psd /xf *-nn.raw
robocopy "%doc_dsloa%\Bits\sound" "%tmp%\Bits\sound" /E
:: in case where I have other resources in Bits as well, I made a subfolder
robocopy "%doc_dsloa%\Bits\world\ai\jobs\%map%" "%tmp%\Bits\world\ai\jobs\%map%" /E
robocopy "%doc_dsloa%\Bits\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /E /xf .gitignore /xf components.gas
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%map%" "%tmp%\Bits\world\contentdb\templates\%map%" /E
robocopy "%doc_dsloa%\Bits\world\global\moods\%map%" "%tmp%\Bits\world\global\moods\%map%" /E
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" eos-* /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "CC-BY-SA 2021" -title "Empire of Stars" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Compile German language resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\language" "%tmp%\Bits\language" eos-* /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%-de.dsres" -copyright "CC-BY-SA 2021" -title "Empire of Stars" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Compile non-nude overlay resource file
:: (uncomment these if those polygon boobs are too much for you)
::rmdir /S /Q "%tmp%\Bits"
::robocopy "%doc_dsloa%\Bits\art" "%tmp%\Bits\art" *-nn.raw /S
::pushd "%tmp%\Bits\art\bitmaps\characters\body_armor\type1"
::setlocal enableDelayedExpansion
::for %%F in (*-nn.raw) do (
::  set "name=%%F"
::  ren "!name!" "!name:-nn=!"
::)
::popd
::%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%-nn.dsres" -copyright "CC-BY-SA 2021" -title "Empire of Stars" -author "Johannes Förstner"
::if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%-de.dsres"
del "%ds%\DSLOA\%map_cs%-nn.dsres"

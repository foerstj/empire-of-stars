:: name of map, case-sensitive
set map_cs=EoS
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

:: Compile non-nude overlay resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\art" "%tmp%\Bits\art" *-nn.raw /S
pushd "%tmp%\Bits\art\bitmaps\characters\body_armor\type1"
setlocal enableDelayedExpansion
for %%F in (*-nn.raw) do (
  set "name=%%F"
  ren "!name!" "!name:-nn=!"
)
endlocal
popd
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%-nn.dsres" -copyright "CC-BY-SA 2023" -title "Empire of Stars" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

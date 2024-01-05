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
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%-nn.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

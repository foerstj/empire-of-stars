:: Compile German language resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\language" "%tmp%\Bits\language" %res%-*.de.gas minibits-*.de.gas /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%-de.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

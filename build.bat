:: This script is supposed to be executed from your DS installation folder.
:: TankCreator and gaspy are expected to be in sibling dirs.

:: name of map
set map=eos
:: name of map, case-sensitive
set map_cs=EoS
:: namespace of resources
set res=eos
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator
:: path of GasPy
set gaspy=..\gaspy

set copyright=CC-BY-SA 2024
set author=Johannes Förstner
set title=Empire of Stars

:: param
set mode=%1
echo %mode%

:: pre-build checks
pushd %gaspy%
setlocal EnableDelayedExpansion
if not "%mode%"=="light" (
  set checks=standard
  if "%mode%"=="release" (
    set checks=all
  )
  venv\Scripts\python -m build.pre_build_checks %map% --check !checks!
  if !errorlevel! neq 0 pause
)
endlocal
popd

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
if not "%mode%"=="light" (
  robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
)
if "%mode%"=="light" (
  robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E /xd regions
  for %%r in (betelgeuse-planet-lake betelgeuse-planet-flowerforest2) do (
    robocopy "%doc_dsloa%\Bits\world\maps\%map%\regions\%%r" "%tmp%\Bits\world\maps\%map%\regions\%%r" /E
  )
)
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% "%tmp%\Bits"
if %errorlevel% neq 0 pause
popd
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
:: exclude .psd that might be present locally; exclude nn files
robocopy "%doc_dsloa%\Bits\art" "%tmp%\Bits\art" /E /xf .gitignore /xf *.psd /xf *-nn.raw
robocopy "%doc_dsloa%\Bits\sound" "%tmp%\Bits\sound" /E
:: in case where I have other resources in Bits as well, I made a subfolder
robocopy "%doc_dsloa%\Bits\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /E
robocopy "%doc_dsloa%\Bits\world\ai\jobs\minibits" "%tmp%\Bits\world\ai\jobs\minibits" /E
robocopy "%doc_dsloa%\Bits\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /E /xf .gitignore /xf components.gas
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /E
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\minibits" "%tmp%\Bits\world\contentdb\templates\minibits" /E
robocopy "%doc_dsloa%\Bits\world\global\moods\%res%" "%tmp%\Bits\world\global\moods\%res%" /E
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-* /S
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" minibits-* /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

if not "%mode%"=="light" (
  :: Compile German language resource file
  call "%doc_dsloa%\Bits\build-de.bat"
)
if "%mode%"=="release" (
  :: Compile non-nude overlay resource file
  call "%doc_dsloa%\Bits\build-nn.bat"
)

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

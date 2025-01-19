:: name of map
set map=eos
:: name of map, case-sensitive
set map_cs=EoS
:: namespace of resources
set res=eos
:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

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
  robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
)
if "%mode%"=="light" (
  robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E /xd regions
  for %%r in (aranna-planet-island) do (
    robocopy "%bits%\world\maps\%map%\regions\%%r" "%tmp%\Bits\world\maps\%map%\regions\%%r" /E
  )
)
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% "%tmp%\Bits"
if %errorlevel% neq 0 pause
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  venv\Scripts\python -m build.add_world_levels %map% "%tmp%\Bits" "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal
popd
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
:: exclude .psd that might be present locally; exclude nn files
robocopy "%bits%\art" "%tmp%\Bits\art" /E /xf .gitignore /xf *.psd /xf *-nn.raw
robocopy "%bits%\sound" "%tmp%\Bits\sound" /E
:: in case where I have other resources in Bits as well, I made a subfolder
robocopy "%bits%\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /E
robocopy "%bits%\world\ai\jobs\minibits" "%tmp%\Bits\world\ai\jobs\minibits" /E
robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /E /xf .gitignore /xf components.gas
robocopy "%bits%\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /E
robocopy "%bits%\world\contentdb\templates\minibits" "%tmp%\Bits\world\contentdb\templates\minibits" /E
robocopy "%bits%\world\global\moods\%res%" "%tmp%\Bits\world\global\moods\%res%" /E
robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-* /S
robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" minibits-* /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

if not "%mode%"=="light" (
  :: Compile German language resource file
  call "%bits%\build-de.bat"
)
if "%mode%"=="release" (
  :: Compile non-nude overlay resource file
  call "%bits%\build-nn.bat"
)

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

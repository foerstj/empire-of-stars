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

:: param
set mode=%1
echo %mode%

:: pre-build checks
pushd %gaspy%
venv\Scripts\python -m build.check_player_world_locations %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_moods %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_quests %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_dupe_node_ids %map%
if %errorlevel% neq 0 pause
venv\Scripts\python -m build.check_tips %map%
if %errorlevel% neq 0 pause
setlocal enableDelayedExpansion
if "%mode%"=="release" (
  venv\Scripts\python -m build.check_cam_blocks %map%
  if !errorlevel! neq 0 pause
)
endlocal
popd

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% "%tmp%\Bits"
if %errorlevel% neq 0 pause
popd
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

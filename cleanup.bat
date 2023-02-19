:: This script is supposed to be executed from your DS installation folder.

:: name of map, case-sensitive
set map_cs=EoS
:: path of DS installation
set ds=.

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%-de.dsres"
del "%ds%\DSLOA\%map_cs%-nn.dsres"

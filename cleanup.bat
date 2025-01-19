:: name of map, case-sensitive
set map_cs=Empire of Stars
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%.*.dsres"
del "%ds%\DSLOA\%map_cs% *.dsres"

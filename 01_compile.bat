@echo off
rem ----------------------------------------------------------------------------
set ORIGINAL_ROM="rom\Super Metroid (JU) [!].smc"
set TRANSLATED_ROM="Super Metroid (I) [!].sfc"
set PATCHES="asm"
set GFX="gfx"
set TILEMAP="tilemaps"
set LCCMP="tools\Lunar Compress\recomp.exe"
set ASAR="asar.exe"
rem ----------------------------------------------------------------------------

rem ----------------------------------------------------------------------------
if not exist "%GFX%\compressed\" mkdir %GFX%\compressed\
copy %ORIGINAL_ROM% %TRANSLATED_ROM% /y
rem ----------------------------------------------------------------------------

echo.
echo Compressing Graphics...
%LCCMP% %GFX%\0B510A_space_colony.bin %GFX%\compressed\0B510A_space_colony.bin 0 4 0
%LCCMP% %GFX%\0B6C76_planet_zebes.bin %GFX%\compressed\0B6C76_planet_zebes.bin 0 4 0
%LCCMP% %GFX%\0AD089_prelude_font.bin %TRANSLATED_ROM% 0AD089 4 0

echo.
echo Compressing Tilemaps...
%LCCMP% %TILEMAP%\0B8D12_intro_text.tilemap %TILEMAP%\intro_text.bin 0 4 0
%LCCMP% %TILEMAP%\0B8DF4_option_mode.tilemap %TILEMAP%\option_mode.bin 0 4 0
%LCCMP% %TILEMAP%\0B8FCD_controller_setting_ENG.tilemap %TILEMAP%\controller_setting_ENG.bin 0 4 0
%LCCMP% %TILEMAP%\0B91C4_controller_setting_JAP.tilemap %TILEMAP%\controller_setting_JAP.bin 0 4 0
%LCCMP% %TILEMAP%\0B938D_special_setting_ENG.tilemap %TILEMAP%\special_setting_ENG.bin 0 4 0
%LCCMP% %TILEMAP%\0B953A_special_setting_JAP.tilemap %TILEMAP%\special_setting_JAP.bin 0 4 0

echo.
echo Applying hacks...
%ASAR% %PATCHES%\main.asm %TRANSLATED_ROM%
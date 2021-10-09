@echo off
rem ----------------------------------------------------------------------------
set ORIGINAL_ROM="rom\Super Metroid (JU) [!].smc"
set TRANSLATED_ROM="Super Metroid (I) [!].sfc"
set PATCHES="asm"
set GFX="gfx"
set TILEMAP="tilemaps"
set LCCMP="tools\Lunar Compress\recomp.exe"
set ASAR="tools\asar.exe"
set AUDIO_ITA="audio_ita"
set BRRENC="tools\brr_encoder.exe"
rem ----------------------------------------------------------------------------

rem ----------------------------------------------------------------------------
if not exist "%TILEMAP%\compressed\" mkdir %TILEMAP%\compressed\
copy %ORIGINAL_ROM% %TRANSLATED_ROM% /y
rem ----------------------------------------------------------------------------

echo.
echo Compressing Graphics...
%LCCMP% %GFX%\0B510A_space_colony.bin %TRANSLATED_ROM% 0B510A 4 0
%LCCMP% %GFX%\0B6C76_planet_zebes.bin %TRANSLATED_ROM% 0B6C76 4 0
%LCCMP% %GFX%\0AD089_prelude_font.bin %TRANSLATED_ROM% 0AD089 4 0
%LCCMP% %GFX%\0BE7DE_end_font.bin %TRANSLATED_ROM% 0BE7DE 4 0

echo.
echo Compressing Tilemaps...
%LCCMP% %TILEMAP%\0B8D12_intro_text.tilemap %TILEMAP%\compressed\intro_text.bin 0 4 0
%LCCMP% %TILEMAP%\menu\0B8DF4_option_mode.tilemap %TILEMAP%\compressed\option_mode.bin 0 4 0
%LCCMP% %TILEMAP%\menu\0B8FCD_controller_setting_ENG.tilemap %TILEMAP%\compressed\controller_setting_ENG.bin 0 4 0
%LCCMP% %TILEMAP%\menu\0B91C4_controller_setting_JAP.tilemap %TILEMAP%\compressed\controller_setting_JAP.bin 0 4 0
%LCCMP% %TILEMAP%\menu\0B938D_special_setting_ENG.tilemap %TILEMAP%\compressed\special_setting_ENG.bin 0 4 0
%LCCMP% %TILEMAP%\menu\0B953A_special_setting_JAP.tilemap %TILEMAP%\compressed\special_setting_JAP.bin 0 4 0
%LCCMP% %TILEMAP%\ending\0BEEFF_credits.tilemap %TILEMAP%\compressed\credits.bin 0 4 0

echo.
echo Encoding Audio Data...
%BRRENC% -sb15456 %AUDIO_ITA%\2E2F84_intro_1a_ITA.wav %AUDIO_ITA%\2E2F84_intro_1a_ITA.brr 
%BRRENC% -sb15456 %AUDIO_ITA%\2E5558_intro_1b_ITA.wav %AUDIO_ITA%\2E5558_intro_1b_ITA.brr 
%BRRENC% -sb15456 %AUDIO_ITA%\2E7ADF_intro_2a_ITA.wav %AUDIO_ITA%\2E7ADF_intro_2a_ITA.brr 
%BRRENC% -sb15456 %AUDIO_ITA%\2E941D_intro_2b_ITA.wav %AUDIO_ITA%\2E941D_intro_2b_ITA.brr 


echo.
echo Applying hacks...
%ASAR% %PATCHES%\main.asm %TRANSLATED_ROM%
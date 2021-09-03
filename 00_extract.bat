@echo off
rem ----------------------------------------------------------------------------
set ROM="rom\Super Metroid (JU) [!].smc"
rem ----------------------------------------------------------------------------
set GFX="gfx"
set TILEMAP="tilemaps"
rem ----------------------------------------------------------------------------
set LCDEC="tools\Lunar Compress\decomp.exe"
set DD="tools\dd.exe"
set PALEX="tools\snespalex.exe"
rem ----------------------------------------------------------------------------

rem ----------------------------------------------------------------------------
if not exist "%GFX%" mkdir %GFX%
if not exist "%TILEMAP%" mkdir %TILEMAP%
if not exist "%TILEMAP%\menu\" mkdir %TILEMAP%\menu\
if not exist "%TILEMAP%\gameover\" mkdir %TILEMAP%\gameover\
if not exist "%TILEMAP%\suit\" mkdir %TILEMAP%\suit\
rem ----------------------------------------------------------------------------

rem ----------------------------------------------------------------------------
echo Extracting Uncompressed Graphics...
%DD% skip=458752 count=16384 if=%ROM% of=%GFX%\070000_menu_font.bin bs=1 2>NUL
%DD% skip=480768 count=1280 if=%ROM% of=%GFX%\075600_header.bin bs=1 2>NUL
%DD% skip=864768 count=4096 if=%ROM% of=%GFX%\0D3200_msg_boxes.bin bs=1 2>NUL
%DD% skip=1589248 count=1024 if=%ROM% of=%GFX%\184000_self_destruct_timer.bin bs=1 2>NUL
%DD% skip=1769472 count=16384 if=%ROM% of=%GFX%\1B0000_suit_menu.bin bs=1 2>NUL
%DD% skip=1785856 count=8192 if=%ROM% of=%GFX%\1B4000_map.bin bs=1 2>NUL
%DD% skip=1825280 count=2048 if=%ROM% of=%GFX%\1BDA00_self_destruct_font.bin bs=1 2>NUL

rem ----------------------------------------------------------------------------
echo Extracting Compressed Graphics...
%LCDEC% %ROM% %GFX%\0A80D8_title_font.bin 0A80D8 4 0 1>NUL
%LCDEC% %ROM% %GFX%\0AD089_prelude_font.bin 0AD089 4 0 1>NUL
REM %LCDEC% %ROM% %GFX%\0AF90E_samus_intro_bg.bin 0AF90E 4 0
%LCDEC% %ROM% %GFX%\0B510A_space_colony.bin 0B510A 4 0 1>NUL
%LCDEC% %ROM% %GFX%\0B6C76_planet_zebes.bin 0B6C76 4 0 1>NUL

rem ----------------------------------------------------------------------------
echo Extracting Palettes...
%PALEX% %ROM% 484352 1>NUL
move palette.tpl %GFX%\070000_menu_font.tpl 1>NUL
%PALEX% %ROM% 1297040 1>NUL
move palette.tpl %GFX%\0D3200_msg_boxes.tpl 1>NUL
%PALEX% %ROM% 852384 1>NUL
copy palette.tpl %GFX%\184000_self_destruct_timer.tpl 1>NUL
move palette.tpl %GFX%\1BDA00_self_destruct_font.tpl 1>NUL
%PALEX% %ROM% 1798208 1>NUL
move palette.tpl %GFX%\1B0000_suit_menu.tpl 1>NUL
%PALEX% %ROM% 418601 1>NUL
move palette.tpl %GFX%\0A80D8_title_font.tpl 1>NUL
%PALEX% %ROM% 418825 1>NUL
copy palette.tpl %GFX%\0AD089_prelude_font.bin.tpl 1>NUL
copy palette.tpl %GFX%\0B510A_space_colony.tpl 1>NUL
move palette.tpl %GFX%\0B6C76_planet_zebes.tpl 1>NUL

rem ----------------------------------------------------------------------------
echo Extracting Uncompressed Tilemaps...
%DD% skip=45376 count=320 if=%ROM% of=%TILEMAP%\00B140_menu_map.tilemap bs=1 2>NUL
%DD% skip=46090 count=44 if=%ROM% of=%TILEMAP%\menu\00B40A_menu_SAMUS_DATA.tilemap bs=1 2>NUL
%DD% skip=46134 count=32 if=%ROM% of=%TILEMAP%\menu\00B436_menu_SAMUS_A.tilemap bs=1 2>NUL
%DD% skip=46166 count=32 if=%ROM% of=%TILEMAP%\menu\00B456_menu_SAMUS_B.tilemap bs=1 2>NUL
%DD% skip=46198 count=32 if=%ROM% of=%TILEMAP%\menu\00B476_menu_SAMUS_C.tilemap bs=1 2>NUL
%DD% skip=46230 count=10 if=%ROM% of=%TILEMAP%\menu\00B496_menu_ENERGY.tilemap bs=1 2>NUL
%DD% skip=46240 count=8 if=%ROM% of=%TILEMAP%\menu\00B4A0_menu_TIME.tilemap bs=1 2>NUL
%DD% skip=46248 count=4 if=%ROM% of=%TILEMAP%\menu\00B4A8_menu_COLON.tilemap bs=1 2>NUL
%DD% skip=46252 count=24 if=%ROM% of=%TILEMAP%\menu\00B4AC_menu_NO_DATA.tilemap bs=1 2>NUL
%DD% skip=46276 count=20 if=%ROM% of=%TILEMAP%\menu\00B4C4_menu_DATA_COPY.tilemap bs=1 2>NUL
%DD% skip=46296 count=22 if=%ROM% of=%TILEMAP%\menu\00B4D8_menu_DATA_CLEAR.tilemap bs=1 2>NUL
%DD% skip=46318 count=10 if=%ROM% of=%TILEMAP%\menu\00B4EE_menu_EXIT.tilemap bs=1 2>NUL
%DD% skip=46328 count=60 if=%ROM% of=%TILEMAP%\menu\00B4F8_menu_DATA_COPY_MODE.tilemap bs=1 2>NUL
%DD% skip=46388 count=64 if=%ROM% of=%TILEMAP%\menu\00B534_menu_DATA_CLEAR_MODE.tilemap bs=1 2>NUL
%DD% skip=46452 count=64 if=%ROM% of=%TILEMAP%\menu\00B574_menu_COPY_WHICH_DATA.tilemap bs=1 2>NUL
%DD% skip=46486 count=50 if=%ROM% of=%TILEMAP%\menu\00B596_menu_COPY_SAMUS_TO_WHERE.tilemap bs=1 2>NUL
%DD% skip=46536 count=58 if=%ROM% of=%TILEMAP%\menu\00B5C8_menu_COPY_SAMUS_TO_SAMUS.tilemap bs=1 2>NUL
%DD% skip=46594 count=24 if=%ROM% of=%TILEMAP%\menu\00B602_menu_IS_THIS_OK.tilemap bs=1 2>NUL
%DD% skip=46618 count=16 if=%ROM% of=%TILEMAP%\menu\00B61A_menu_YES.tilemap bs=1 2>NUL
%DD% skip=46634 count=16 if=%ROM% of=%TILEMAP%\menu\00B62A_menu_NO.tilemap bs=1 2>NUL
%DD% skip=46650 count=32 if=%ROM% of=%TILEMAP%\menu\00B63A_menu_COPY_COMPLETED.tilemap bs=1 2>NUL
%DD% skip=46682 count=34 if=%ROM% of=%TILEMAP%\menu\00B65A_menu_CLEAR_WHICH_DATA.tilemap bs=1 2>NUL
%DD% skip=46746 count=64 if=%ROM% of=%TILEMAP%\menu\00B69A_menu_CLEAR_SAMUS_A.tilemap bs=1 2>NUL
%DD% skip=46810 count=64 if=%ROM% of=%TILEMAP%\menu\00B6DA_menu_DATA_CLEARED.tilemap bs=1 2>NUL

%DD% skip=37596 count=40 if=%ROM% of=%TILEMAP%\gameover\0092DC_gameover_GAME_OVER.tilemap bs=1 2>NUL
%DD% skip=37636 count=48 if=%ROM% of=%TILEMAP%\gameover\009304_gameover_FIND_THE_METROID_LARVA.tilemap bs=1 2>NUL
%DD% skip=37684 count=24 if=%ROM% of=%TILEMAP%\gameover\009334_gameover_TRY_AGAIN.tilemap bs=1 2>NUL
%DD% skip=37708 count=84 if=%ROM% of=%TILEMAP%\gameover\00934C_gameover_YES_RETURN_TO_GAME.tilemap bs=1 2>NUL
%DD% skip=37792 count=72 if=%ROM% of=%TILEMAP%\gameover\0093A0_gameover_NO_GO_TO_TITLE.tilemap bs=1 2>NUL

%DD% skip=165887 count=3584 if=%ROM% of=%TILEMAP%\0287FF_msg_boxes.tilemap bs=1 2>NUL
%DD% skip=169345 count=64 if=%ROM% of=%TILEMAP%\029581_msg_boxes_save_yes1.tilemap bs=1 2>NUL
%DD% skip=169409 count=64 if=%ROM% of=%TILEMAP%\0295C1_msg_boxes_save_yes2.tilemap bs=1 2>NUL
%DD% skip=169473 count=64 if=%ROM% of=%TILEMAP%\029601_msg_boxes_save_no.tilemap bs=1 2>NUL

%DD% skip=81670 count=14 if=%ROM% of=%TILEMAP%\suit\013F06_suit_mode.tilemap bs=1 2>NUL
%DD% skip=81684 count=14 if=%ROM% of=%TILEMAP%\suit\013F14_suit_reserve_tank.tilemap bs=1 2>NUL
%DD% skip=81698 count=8 if=%ROM% of=%TILEMAP%\suit\013F22_suit_manual.tilemap bs=1 2>NUL
%DD% skip=81706 count=8 if=%ROM% of=%TILEMAP%\suit\013F2A_suit_auto.tilemap bs=1 2>NUL
%DD% skip=81714 count=50 if=%ROM% of=%TILEMAP%\suit\013F32_suit_beam.tilemap bs=1 2>NUL
%DD% skip=81764 count=36 if=%ROM% of=%TILEMAP%\suit\013F64_suit_suit.tilemap bs=1 2>NUL
%DD% skip=81800 count=76 if=%ROM% of=%TILEMAP%\suit\013F88_suit_misc.tilemap bs=1 2>NUL
%DD% skip=81874 count=54 if=%ROM% of=%TILEMAP%\suit\013FD2_suit_boots.tilemap bs=1 2>NUL
%DD% skip=81928 count=16 if=%ROM% of=%TILEMAP%\suit\014008_suit_Hyperbeam.tilemap bs=1 2>NUL


%DD% skip=1796352 count=4096 if=%ROM% of=%TILEMAP%\suit\1B6900_suit_menu.tilemap bs=1 2>NUL

rem ----------------------------------------------------------------------------
echo Extracting Compressed Tilemaps...
REM %LCDEC% %ROM% %TILEMAP%\0B7F14.bin 0B7F14 4 0 ?TILEMAP?
REM %LCDEC% %ROM% %TILEMAP%\0B88CC.bin 0B88CC 4 0 ?TILEMAP?
%LCDEC% %ROM% %TILEMAP%\0B8D12_intro_text.tilemap 0B8D12 4 0 1>NUL
%LCDEC% %ROM% %TILEMAP%\menu\0B8DF4_option_mode.tilemap 0B8DF4 4 0 1>NUL
%LCDEC% %ROM% %TILEMAP%\menu\0B8FCD_controller_setting_ENG.tilemap 0B8FCD 4 0 1>NUL
%LCDEC% %ROM% %TILEMAP%\menu\0B91C4_controller_setting_JAP.tilemap 0B91C4 4 0 1>NUL
%LCDEC% %ROM% %TILEMAP%\menu\0B938D_special_setting_ENG.tilemap 0B938D 4 0 1>NUL
%LCDEC% %ROM% %TILEMAP%\menu\0B953A_special_setting_JAP.tilemap 0B953A 4 0 1>NUL
@echo off
color 02
:MENU
echo                                 ####################################################
echo                                 #                                                  #
echo                                 #  1: DEVICES ATTACHED                             #
echo                                 #  2: KILL SERVER                                  #
echo                                 #  3: CONNECT IP (***.***.***.***)                 #
echo                                 #  4: TCP SET (****)                               #
echo                                 #  5: START (CAST/PUSH) W   console                #
echo                                 #  6: START (CAST/PUSH) W/O console                #
echo                                 #  7: CLEAR SCR                                    #
echo                                 #  8: EXIT                                         #
echo                                 #                                                  #
echo                                 ####################################################
echo(
SET /P M=OPTION										
IF %M%==1 GOTO DEV									
IF %M%==2 GOTO KILL									
IF %M%==3 GOTO CONN								    
IF %M%==4 GOTO TCP
IF %M%==5 GOTO STA
IF %M%==6 GOTO STB
IF %M%==7 GOTO CLRS
IF %M%==8 GOTO EXIT



:STA
scrcpy.exe
PAUSE
CLS
GOTO MENU

:STB
scrcpy_nc.exe
PAUSE
CLS
GOTO MENU

:DEV
color 02
adb devices -l
PAUSE
CLS
GOTO MENU

:CONN
color 03
set /p id=Enter IP: 
adb connect %id%:%tcp%
PAUSE
CLS
GOTO MENU

:KILL
color 04
adb kill-server
PAUSE
CLS
GOTO MENU

:TCP
color 08
set /p tcp=Enter TCP Port: 
adb tcpip %tcp%
PAUSE
CLS
GOTO MENU

:CLRS

color 08
CLS
GOTO MENU


:EXIT
exit
GOTO MENU
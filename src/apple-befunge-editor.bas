NEW

REM APPLE BEFUNGE EDITOR V1.1
REM ----- ------- ------ ----

REM BEFUNGE-93-ESQUE INTERPRETER
REM WRITTEN IN APPLESOFT BASIC!

REM V1.0 JUN 2000 CHRIS PRESSEY
REM V1.1 FEB 2012 CHRIS PRESSEY

REM THIS WORK IS HEREBY ENTERED INTO
REM THE PUBLIC DOMAIN

REM THIS LISTING IS INTENDED TO BE
REM PASTED INTO YOUR EMULATOR.  SO,
REM TO SAVE SPACE AND TIME, THESE
REM 'REM'S EXIST ONLY IN THIS FILE,
REM AND ARE NOT SAVED IN PROGRAM

REM IT IS RECOMMENDED TO RUN YOUR
REM EMULATOR AT FULL SPEED, OR THE
REM INTERPRETER WILL BE SOMEWHAT,
REM SHALL WE SAY, POKEY

100 GOSUB 8000: GOTO 720

REM RUN-PROGRAM LOOP

200 VTAB Y%+1:HTAB X%+1
220 IR%=PG%(X%,Y%)
225 IF QM%=1 THEN GOSUB 910:GOTO 240
230 IF IM%=0 OR IR%=59 THEN GOSUB 400
235 IF RM%=0 THEN 720
240 GOSUB 250: GOTO 200

REM ADVANCE IP

250 X%=X%+DX%:Y%=Y%+DY%
260 IF X%>39 THEN X%=X%-40
265 IF X%<0  THEN X%=X%+40
270 IF Y%>23 THEN Y%=Y%-24
275 IF Y%<0  THEN Y%=Y%+24
280 RETURN

REM DISPLAY PAGE

300 J%=0
320 VTAB J%+1: HTAB 1
330 I%=0
340 IF I%=39 AND J%=23 GOTO 360
350 PRINT CHR$(PG%(I%,J%));
360 I%=I%+1:IF I%<40 THEN GOTO 340
370 J%=J%+1:IF J%<24 THEN GOTO 320
390 RETURN

REM EXECUTE IR%

400 IF IR%<33 THEN RETURN
412 IF IR%=86 THEN GOTO 3410:REM V
413 IF IR%=73 THEN GOTO 3010:REM I
414 IF IR%=71 THEN GOTO 3610:REM G
415 IF IR%=80 THEN GOTO 3710:REM P
416 IF IR%>=65 AND IR%<=70 THEN GOTO 2260
418 IF IR%>=92 THEN ON IR%-91 GOTO 3610,3110,3210,3310
420 IF IR%>=58 THEN ON IR%-57 GOTO 2310,2410,2510,2610,2710,2810,2910
430 IF IR%>=48 AND IR%<=57 THEN GOTO 2210
440 IF IR%>41 THEN ON IR%-41 GOTO 1610,1710,1810,1910,2010,2110
450 ON IR%-32 GOTO 1010,1110,1210,1310,1410,1510,3510
460 RETURN

REM PUSH D% ONTO STACK

500 ST%(SP%)=D%:SP%=SP%+1:RETURN

REM POP D% FROM STACK

600 IF SP%=0 THEN GOTO 650
620 SP%=SP%-1:D%=ST%(SP%)
630 RETURN
650 D%=0
690 RETURN

REM EDIT-PROGRAM LOOP

720 VTAB Y%+1:HTAB X%+1
722 IR%=PG%(X%,Y%)
730 GET A$:A%=ASC(A$)
733 IF A%=23 THEN GOSUB 6210:GOTO 720
734 IF A%=15 THEN GOSUB 6010:GOTO 720
735 IF A%=1 THEN GOSUB 8010:GOTO 720
736 IF A%=14 THEN GOSUB 7140:GOSUB 300:GOTO 720
737 IF A%=5 THEN GOSUB 7010:GOTO 720
738 IF A%=12 THEN DX%=1:DY%=0:X%=0:Y%=0:GOTO 720
740 IF A%=7 THEN RM%=1:GOTO 200
741 IF A%=9 THEN GOSUB 810

REM BACKTICK BECOMES APOSTROPHE
REM TILDE BECOMES EQUALS SIGN
REM VERTICAL BAR BECOMES LETTER I

742 IF A%=96 THEN A%=39
744 IF A%=126 THEN A%=61
746 IF A%=124 THEN A%=73
750 IF A%=20 THEN GOSUB 7110:GOTO 720
752 IF A%=18 THEN GOSUB 300:GOTO 720
760 IF A%=11 THEN DX%= 0:DY%=-1:GOSUB 250
765 IF A%=8  THEN DX%=-1:DY%= 0:GOSUB 250
770 IF A%=21 THEN DX%= 1:DY%= 0:GOSUB 250
775 IF A%=10 THEN DX%= 0:DY%= 1:GOSUB 250
777 IF A%=13 THEN DX%= 0:DY%= 1:X%=0:GOSUB 250:DX%=1:DY%=0:GOTO 720

REM SHELL TO BASIC

785 IF A%=27 THEN HOME:END:GOSUB 300:GOTO 720
786 IF X%=39 AND Y%=23 THEN GOSUB 250:GOTO 720
787 IF A%>127 THEN A%=A%-128:GOTO 787
788 IF A%>95 THEN A%=A%-32:GOTO 788
790 IF A%>31 THEN PG%(X%,Y%)=A%:PRINT CHR$(A%);:GOSUB 250
795 GOTO 720

REM HELP

810 VTAB 5:INVERSE
812 HTAB 5:PRINT " CTRL+I      - SHOW THIS HELP "
814 HTAB 5:PRINT "------------------------------"
816 HTAB 5:PRINT " ARROW KEYS  - MOVE CURSOR/IP "
818 HTAB 5:PRINT " (CTRL+J = DOWN, CTRL+K = UP) "
820 HTAB 5:PRINT " CTRL+L      - HOME CURSOR    "
822 HTAB 5:PRINT " CTRL+N      - NEW:CLEAR PROG "
824 HTAB 5:PRINT " CTRL+O      - OPEN:LOAD PROG "
826 HTAB 5:PRINT " CTRL+W      - WRITE:SAVE PRG "
828 HTAB 5:PRINT " CTRL+G      - GO:RUN PROGRAM "
830 HTAB 5:PRINT " CTRL+T      - SINGLE STEP IP "
832 HTAB 5:PRINT " CTRL+E      - EXAMINE STACK  "
834 HTAB 5:PRINT " CTRL+R      - REDRAW SCREEN  "
836 HTAB 5:PRINT " CTRL+A      - SHOW ABOUT BOX "
838 HTAB 5:PRINT " CTRL+C      - STOP PROG RUN  "
840 HTAB 5:PRINT " ESC (,CONT) - SHELL TO BASIC "
842 HTAB 5:PRINT "------------------------------"
844 HTAB 5:PRINT " PRESS ANY KEY TO RESUME EDIT "
880 NORMAL
890 GET WT$:GOSUB 300
895 RETURN

REM QUOTEMODE

910 IF IR%=34 THEN QM%=0:GOTO 990
920 D%=IR%
930 GOSUB 500
990 RETURN

REM ! BOOLEAN NOT

1010 GOSUB 600
1020 IF D%=0 THEN D%=1:GOTO 1040
1030 D%=0
1040 GOSUB 500
1090 RETURN

REM " TOGGLE QUOTEMODE

1110 IF QM%=0 THEN QM%=1:GOTO 1190
1120 QM%=0
1190 RETURN

REM # TRAMPOLINE

1210 X%=X%+DX%
1220 Y%=Y%+DY%
1290 RETURN

REM $ POP

1310 GOSUB 600
1390 RETURN

REM % MODULO (SLOW!)

1410 GOSUB 600
1420 E%=D%
1430 GOSUB 600
1440 IF D%>E% THEN D%=D%-E%:GOTO 1440
1450 GOSUB 500
1490 RETURN

REM & INPUT INTEGER

1510 HTAB 1:VTAB 23
1520 INVERSE:PRINT OS$;:NORMAL
1530 INPUT "";WT$
1535 D%=VAL(WT$)
1537 IF WT$=CHR$(3) THEN RM%=0
1538 J%=22:GOSUB 320
1540 GOSUB 500
1550 OS$=""
1590 RETURN

REM * MULTIPLY INTEGERS

1610 GOSUB 600
1620 E%=D%
1630 GOSUB 600
1640 D%=D%*E%
1650 GOSUB 500
1690 RETURN

REM + ADD INTEGERS

1710 GOSUB 600
1720 E%=D%
1730 GOSUB 600
1740 D%=D%+E%
1750 GOSUB 500
1790 RETURN

REM , OUTPUT CHARACTER

1810 GOSUB 600
1820 IF D%<>10 THEN GOTO 1880
1825 HTAB 1:VTAB 24
1830 INVERSE:PRINT OS$;" (EOL)";:NORMAL
1840 GET WT$:IF WT$=CHR$(3) THEN RM%=0
1850 OS$=""
1858 J%=23:GOSUB 320
1860 RETURN
1880 OS$=OS$+CHR$(D%)
1882 IF LEN(OS$)>30 THEN GOTO 1825
1890 RETURN

REM - SUBTRACT INTEGERS

1910 GOSUB 600
1920 E%=D%
1930 GOSUB 600
1940 D%=D%-E%
1950 GOSUB 500
1990 RETURN

REM . OUTPUT INTEGER

2010 GOSUB 600
2020 OS$=OS$+STR$(D%)+" "
2030 IF LEN(OS$)>30 THEN GOTO 1825
2090 RETURN

REM / DIVIDE INTEGERS

2110 GOSUB 600
2120 E%=D%
2130 GOSUB 600
2140 IF E%=0 GOTO 2170
2150 D%=D%/E%
2160 GOSUB 500
2165 RETURN
2170 PRINT "WHAT DO YOU WANT ";D%;"/";E%;" TO BE";
2180 INPUT D%
2185 GOSUB 500
2190 RETURN

REM 0-9 PUSH DIGIT

2210 D%=IR%-48
2220 GOSUB 500
2240 RETURN

REM A-F PUSH HEX DIGIT

2260 D%=IR%-55
2270 GOSUB 500
2290 RETURN

REM COLON DUP VALUE

2310 GOSUB 600:GOSUB 500:GOSUB 500
2390 RETURN

REM ; IGNORE MODE

2410 IF IM%=0 THEN IM%=1:GOTO 2490
2420 IM%=0
2490 RETURN

REM < LEFT

2510 DX%=-1:DY%=0
2590 RETURN

REM ~ INPUT CHARACTER
REM USES = ON APPLE ][+

2610 HTAB 1:VTAB 24
2615 INVERSE:PRINT OS$;:NORMAL
2620 GET WT$
2626 J%=23:GOSUB 320:REM TRICKY BASTARD!
2628 IF WT$=CHR$(3) THEN RM%=0
2630 D%=ASC(WT$)
2640 GOSUB 500
2690 RETURN

REM > RIGHT

2710 DX%=1:DY%=0
2790 RETURN

REM ? RANDOM

2810 QD%=RND(1)*4+1
2815 ON QD% GOTO 2820,2830,2840,2850
2820 DX%= 1:DY%= 0:RETURN
2830 DX%=-1:DY%= 0:RETURN
2840 DX%= 0:DY%= 1:RETURN
2850 DX%= 0:DY%=-1:RETURN
2890 RETURN

REM @ END PROGRAM

2910 HTAB 1:VTAB 24
2920 INVERSE:PRINT OS$;" (END)";:NORMAL
2930 GET WT$
2935 J%=23:GOSUB 320:REM TRICKY BASTARD!
2940 RM%=0:OS$=""
2990 RETURN

REM | UP-DOWN DECISION
REM USES I ON APPLE ][+

3010 GOSUB 600
3015 DX%=0
3020 IF D%<>0 THEN DY%=-1:GOTO 3090
3030 DY%=1
3090 RETURN

REM ] CALL MACHINE LANGUAGE

3110 GOSUB 600
3111 CALL D%
3190 RETURN

REM ^ UP

3210 DX%=0:DY%=-1
3290 RETURN

REM _ LEFT-RIGHT DECISION

3310 GOSUB 600
3315 DY%=0
3320 IF D%<>0 THEN DX%=-1:GOTO 3390
3330 DX%=1
3390 RETURN

REM V DOWN

3410 DX%=0:DY%=1
3490 RETURN

REM ` GREATER THAN
REM USES ' ON APPLE ][+

3510 GOSUB 600
3515 E%=D%
3520 GOSUB 600
3525 IF D%>E% THEN D%=1:GOTO 3530
3527 D%=0
3530 GOSUB 500
3590 RETURN

REM G GET FROM SPACE

3610 GOSUB 600
3615 E%=D%
3620 GOSUB 600
3732 IF D%<0 THEN D%=PEEK(E%):GOTO 3640
3630 D%=PG%(D%,E%)
3640 GOSUB 500
3690 RETURN

REM P PUT INTO SPACE

3710 GOSUB 600
3715 E%=D%
3720 GOSUB 600
3725 F%=D%
3730 GOSUB 600
3732 IF F%<0 THEN POKE E%,D%:GOTO 3790
3740 PG%(F%,E%)=D%
3742 HTAB F%+1:VTAB E%+1:INVERSE:PRINT CHR$(D%);:NORMAL
3790 RETURN

REM \ SWAP

3610 GOSUB 600
3620 E%=D%
3630 GOSUB 600
3640 F%=D%:D%=E%:GOSUB 500
3650 D%=F%:GOSUB 500
3690 RETURN

REM ---------------------------------

REM LOAD PROGRAM

6010 HTAB 1:VTAB 23:INPUT "FILENAME: ";F$
6012 GOSUB 7140
6015 I=0:J=0
6020 PRINT D$;"OPEN";F$
6030 PRINT D$;"READ";F$

6032 A$="": CALL 64879
6034 FOR K=512 TO 611: IF PEEK(K)<>141 THEN A$=A$+CHR$(PEEK(K)-128): NEXT
6042 IF LEFT$(A$,14)="END OF PROGRAM" THEN GOTO 6060
6045 FOR I=0 TO LEN(A$)-1:PG%(I,J)=ASC(MID$(A$,I+1,1)):NEXT
6050 J=J+1:GOTO 6032
6060 PRINT D$;"CLOSE";F$
6080 GOSUB 300
6090 RETURN

REM SAVE PROGRAM

6210 HTAB 1:VTAB 23:INPUT "FILENAME: ";F$
6215 I=0
6220 PRINT D$;"OPEN";F$
6230 PRINT D$;"WRITE";F$
6242 FOR J=0 TO 24
6244 FOR I=0 TO 39:PRINT CHR$(PG%(I,J));:NEXT
6246 PRINT: NEXT
6248 PRINT "END OF PROGRAM"
6250 PRINT D$;"CLOSE";F$
6280 GOSUB 300
6290 RETURN

REM EXAMINE STACK

7010 HTAB 1:VTAB 20:QQ$=""
7012 D%=0
7014 IF D%=SP% GOTO 7020
7016 QQ$=QQ$+STR$(ST%(D%))+" "
7018 D%=D%+1:GOTO 7014
7020 INVERSE:PRINT QQ$;:NORMAL
7030 GET WT$
7035 J%=19:GOSUB 320
7090 RETURN

REM SINGLE STEP

7110 IF QM%=1 THEN GOSUB 910:GOTO 7114
7112 IF IM%=0 OR IR%=59 THEN GOSUB 400
7114 GOSUB 250
7116 RETURN

REM NEW PLAYFIELD

7140 J%=0
7150 I%=0
7160 PG%(I%,J%)=32
7170 I%=I%+1:IF I%<40 THEN GOTO 7160
7180 J%=J%+1:IF J%<24 THEN GOTO 7150
7190 RETURN

REM INITIALIZE AND SHOW ABOUT BOX

8000 DIM PG%(79,24)
8010 DIM ST%(256)
8020 X%=0:Y%=0:DX%=1:DY%=0:QM%=0:IM%=0:RM%=0
8030 I%=0:J%=0:IR%=0:SP%=0:D%=0:E%=0:F%=0
8040 OS$="":D$=CHR$(4)
8050 HOME:VTAB 7
8053 HTAB 4:PRINT " ______________________________"
8055 HTAB 4:PRINT "/                              \"
8056 HTAB 4:PRINT "\      APPLE BEFUNGE V1.1      /"
8058 HTAB 4:PRINT "/      ------------------      \"
8060 HTAB 4:PRINT "\   BY CAT'S EYE TECHNOLOGIES  /"
8062 HTAB 4:PRINT "/    HTTP://WWW.CATSEYE.TC/    \"
8063 HTAB 4:PRINT "\   PUBLIC DOMAIN, FEB 2012    /"
8064 HTAB 4:PRINT "/  BASED ON BEFUNGE-93 & -96+  \"
8066 HTAB 4:PRINT "\  PRESS CTRL+I FOR HELP INFO  /"
8068 HTAB 4:PRINT "/ LONG LIVE RETROCOMPUTING :-) \"
8070 HTAB 4:PRINT "\______________________________/"
8080 HTAB 4:PRINT "  INITIALIZING, PLEASE WAIT... ";
8090 GOSUB 7140
8100 VTAB 18:HTAB 4:PRINT "  PRESS RETURN KEY TO CONTINUE ";
8110 GET WT$:GOSUB 300
8120 RETURN

RUN

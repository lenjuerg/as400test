000100180814      /include qCpySrc,hKarte
000200180814      *====================================================================*
000300180814      * Copyright by: Lauprecht & Partner GmbH
000400180814      *               Am Brahmkamp 56
000500180814      *               28359 Bremen
000600180814      *====================================================================*
000700200810      * Programm :    TEST_LJU01
000800180814      *====================================================================*
000900180814      *DATUM        ÄNDERUNG/EN
001000180814      *====================================================================*
001100180814      *====================================================================*
001200200810       DCL-F TESTP01FM workstn;
001300200813       DCL-F TESTL01 keyed usage(*update:*output);
001400200813       DCL-F TESTL02 keyed usage(*input) rename(TESTPF1:TESTPF2);
001500200813       DCL-DS TESTP ext qualified;
001600200813       END-DS;
001700200813       DCL-DS P_KNDPL20 qualified;
001800200813          anlegen ind;
001900200813       END-DS;
002000200813
002100200813       // ====================================================================
002200200813     C     *ENTRY        PLIST
002300200813     C                   PARM                    TESTP
002400200813     C                   PARM                    P_KNDPL20
002500200813       // ====================================================================
002600200813
002700200810       *in03=*on;
002800200810       *in06=*on;
002900200810       BFTINF='F3=verlassen F6=Speichern';
003000200810
003100200813
003200200813
003300200813       if not P_KNDPL20.anlegen;
003400200813          TID = TESTP.ADID;
003500200813          TNAME = TESTP.ADNAME;
003600200813          TSTRA = TESTP.ADSTRA;
003700200813          TPLZ  = TESTP.ADPLZ;
003800200813          TSTDT = TESTP.ADSTDT;
003900200813          TUSID = TESTP.ADUSID;
004000200813          TTENR = TESTP.ADTEL;
004100200813          TFAX = TESTP.ADFAX;
004200200813          TMAIL = TESTP.ADEMAL;
004300200813          THMPG = TESTP.ADHMPG;
004400200813       ENDIF;
004500200813
004600200810       DOU *inKC=*on;
004700200810          write FUSS;
004800200810          exfmt FOR01;
004900200810          if *inKF=*on;
005000200813             chain TID TESTL01;
005100200813             ADID=TID;
005200200813             ADNAME=TNAME;
005300200813             ADSTRA=TSTRA;
005400200813             ADPLZ=TPLZ;
005500200813             ADSTDT=TSTDT;
005600200813             ADUSID=TUSID;
005700200813             ADTEL=TTENR;
005800200813             ADFAX=TFAX;
005900200813             ADEMAL=TMAIL;
006000200813             ADHMPG=THMPG;
006100200813             if %found(TESTL01);
006200200813                update TESTPF1;
006300200813                MESSGE = 'Die Daten wurden erfolgreich aktualisiert';
006400200813             else;
006500200813                write TESTPF1;
006600200813                MESSGE = 'Die Daten wurden erfolgreich angelegt';
006700200813             ENDIF;
006800200813
006900200810          ENDIF;
007000200810
007100200810       ENDDO;
007200200810
007300200810
007400200810
007500200810       *inlr=*on;
007600200810       return;
007700200810
007800200810
007900200810
008000200810
008100200810
008200200810
008300200810
008400200810
008500200810
008600200810
008700200810
008800200810
008900180814

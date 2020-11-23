       IDENTIFICATION DIVISION.                                         00010000
                                                                        00020000
       PROGRAM-ID.                      PROGTOPB.                       00030000
                                                                        00040000
       AUTHOR.                          JOHN DOE.                       00050000
                                                                        00150000
       DATE-WRITTEN.                    November 2020 AD.               00160001
       DATE-COMPILED.                                                   00170000
                                                                        00180000
      * ************************************************************ *  00190000
      *                                                              *  00200000
      *    PROGRAM PROCESSES TWO INTPUT PARMS, A NUMBER AND A NAME.  *  00210000
      *    THE NAME IS DISPLAYED AND THE NUMBER PASSED TO PROGRAM    *  00220000
      *    PROGMIDB WITH TWO, AS YET UNUSED PARMS. AFTER RETURNING   *  00230000
      *    FROM PROGMIDB THESE PARAMETERS ARE DISPLAYED.             *  00231000
      *                                                              *  00233000
      * ************************************************************ *  00234000
      /                                                                 00235000
       ENVIRONMENT DIVISION.                                            00236000
                                                                        00237000
       CONFIGURATION SECTION.                                           00238000
                                                                        00239000
       SOURCE-COMPUTER.                 IBM-370.                        00240000
       OBJECT-COMPUTER.                 IBM-370.                        00250000

       INPUT-OUTPUT SECTION.                                            00250400
       FILE-CONTROL.
           SELECT SPOOLR-DATASET      ASSIGN TO SPOOLR                  00250500
               STATUS IS WS-SPOOLR-STATUS.                              00250600
      /                                                                 00260000
       DATA DIVISION.                                                   00270000
       FILE SECTION.                                                    00270100
       FD  SPOOLR-DATASET                                               00270200
           RECORDING MODE F                                             00270300
           LABEL RECORDS STANDARD                                       00270400
           BLOCK CONTAINS 0.                                            00270500
                                                                        00270600
       01  SPOOLR-LINE.                                                 00270700
           03  SPOOLR-ASA               PIC X.                          00270800
           03  SPOOLR-TEXT              PIC X(120).                     00270900
      /                                                                 00280000
       WORKING-STORAGE SECTION.                                         00290000
       01  WORK-CONSTANTS.                                              00290102
           03  WC-PROGRAM-ID            PIC X(8)  VALUE 'PROGTOPB'.     00290202
           03  FILLER                   PIC X(17) VALUE                 00290402
                'PROGRAM VERSION '.                                     00290502
           03  WC-PROGRAM-VERSION       PIC X(8)  VALUE 'V001R001'.     00290608
           03  FILLER                   PIC X(32) VALUE                 00290702
                'WORKING STORAGE STARTS HERE'.                          00291002
           03  WC-PROGMIDB              PIC X(8)   VALUE 'PROGMIDB'.    00291003
           03  WC-PROGBOTB              PIC X(8)   VALUE 'PROGBOTB'.    00291004
      /                                                                  00550000
       01  WORK-ACCUMULATORS.                                           00560000
           03  WA-TOP1                  PIC S9(9) COMP VALUE +0.        00590000
           03  WA-MID1                  PIC S9(9) COMP VALUE +0.        00590100
           03  WA-BOT1                  PIC S9(9) COMP VALUE +0.        00590200
      /                                                                 00550000
       01  WORK-SAVES.                                                  00560000
           03  WS-SPOOLR-STATUS         PIC 99     VALUE ZEROES.
           03  WS-PARAMETERS            PIC X(64)  VALUE SPACES.        00570000
           03  WS-NAME                  PIC X(16)  VALUE SPACES.        00580000
           03  WS-TOP1                  PIC 9(7)   VALUE ZEROES.        00590000
           03  WS-MID1                  PIC 9(7)   VALUE ZEROES.        00590100
           03  WS-BOT1                  PIC 9(7)   VALUE ZEROES.        00590200
      /                                                                 00590300
       LINKAGE SECTION.                                                 00590400
       01  LINKAGE-PARMS.                                               00590500
           03  LP-LENGTH           PIC S9(4) COMP.                      00590600
           03  LP-DATA             PIC X(64).                           00590700
      /                                                                 01040000
       PROCEDURE DIVISION USING LINKAGE-PARMS.                          01050000
                                                                        01110000
           MOVE +0 TO RETURN-CODE                                       01120000

           DISPLAY '@ PROGTOPB.' upon console.

           MOVE LP-DATA (1:LP-LENGTH) TO WS-PARAMETERS.                 01120100
           UNSTRING WS-PARAMETERS DELIMITED BY ',' OR ALL SPACES        01120200
           INTO    WS-TOP1                                              01120400
                   WS-NAME.                                             01120400

           OPEN OUTPUT SPOOLR-DATASET.
                                                                        01120500
           MOVE '1' TO SPOOLR-ASA.                                      01120600
           MOVE SPACES TO SPOOLR-TEXT.                                  01120610
                                                                        01120620
           STRING 'Hi ' DELIMITED BY SIZE                               01120630
                   WS-NAME DELIMITED BY SPACES                          01120640
                   ' Here is your demo: ' DELIMITED BY SIZE             01120650
               into SPOOLR-TEXT.                                        01120660
                                                                        01120670
           WRITE SPOOLR-LINE.                                           01120680
       A.                                                               01120800
           Move WS-TOP1 to WA-TOP1.
           Move zeroes to WA-MID1.                                      01120801
           Move zeroes to WA-BOT1.                                      01120802
       Y.                                                               01120803
           CALL WC-PROGMIDB USING WA-TOP1                               01120804
                                 WA-MID1                                01120805
                                 WA-BOT1.                               01120806
           PERFORM INIT THRU INIT-END.                                  01120807
                                                                        01120810
           STRING 'Based on '                                           01120811
                   WS-TOP1                                              01120812
                   ' ' DELIMITED by size                                01120813
                   WC-PROGMIDB DELIMITED by spaces                      01120814
                   ' generated '                                        01120815
                   WS-MID1                                              01120816
                   ' and ' DELIMITED by size                            01120817
                   WC-PROGBOTB DELIMITED by spaces                      01120818
                   ' generated '                                        01120819
                   WS-BOT1 DELIMITED by size                            01120820
               into SPOOLR-TEXT.                                        01120821
                                                                        01120830
           WRITE SPOOLR-LINE.                                           01120900

           CLOSE       SPOOLR-DATASET.
           GO TO END.
       
       INIT.    
           MOVE WA-MID1 TO WS-MID1.
           MOVE WA-BOT1 TO WS-BOT1.
           MOVE ' ' TO SPOOLR-ASA.                                      
       INIT-END.    
           MOVE SPACES TO SPOOLR-TEXT.                               
           
       END.
           GOBACK.                                                      01121100

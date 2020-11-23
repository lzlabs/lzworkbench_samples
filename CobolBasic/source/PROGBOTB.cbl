       IDENTIFICATION DIVISION.                                         00010000
                                                                         00020000
       PROGRAM-ID.                      PROGBOTB.                       00030000
                                                                        00040000
       AUTHOR.                          JOHN DOE.                       00050000
                                                                        00150000
       DATE-WRITTEN.                    November 2020 AD.               00160001
       DATE-COMPILED.                                                   00170000
                                                                        00180000
      * ************************************************************ *  00190000
      *                                                              *  00200000
      *    PROGRAM PROCESSES 2 PARMS, this program squares the       *  00210000
      *    first parameter into the last.                            *  00220000
      *    Control is then returned to PROGMID.                      *  00231000
      *                                                              *  00233000
      * ************************************************************ *  00234000
      /                                                                 00235000
       ENVIRONMENT DIVISION.                                            00236000
                                                                        00237000
       CONFIGURATION SECTION.                                           00238000
                                                                        00239000
       SOURCE-COMPUTER.                 IBM-370.                        00240000
       OBJECT-COMPUTER.                 IBM-370.                        00250000
      /                                                                 00260000
       DATA DIVISION.                                                   00270000
       WORKING-STORAGE SECTION.                                         00290000
       01  WORK-CONSTANTS.                                              00290102
           03  WC-PROGRAM-ID            PIC X(8)  VALUE 'PROGBOTB'.     00290202
           03  FILLER                   PIC X(17) VALUE                 00290402
                'PROGRAM VERSION '.                                     00290502
           03  WC-PROGRAM-VERSION       PIC X(8)  VALUE 'V001R001'.     00290608
           03  FILLER                   PIC X(32) VALUE                 00290702
                'WORKING STORAGE STARTS HERE'.                          00291002
       01 PROG  PIC X(10).
      /                                                                 00590300
       LINKAGE SECTION.                                                 00590400
       01  LA-TOP1                      PIC S9(9) COMP.                 00590000
       01  LA-BOT1                      PIC S9(9) COMP.                 00590200
      /                                                                 01040000
       PROCEDURE DIVISION USING LA-TOP1 LA-BOT1.                        01050000
                                

           MOVE +0 TO RETURN-CODE.                                      01120000
                                                                        01120800
           DISPLAY '@ PROGBOTB.' upon console.

           Compute LA-BOT1 = LA-TOP1 ** 2.

                                                                        01121000
           GOBACK.                                                      01121100


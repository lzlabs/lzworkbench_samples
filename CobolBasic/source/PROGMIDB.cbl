       IDENTIFICATION DIVISION.                                         00010000
                                                                        00020000
       PROGRAM-ID.                      PROGMIDB.                       00030000
                                                                        00040000
       AUTHOR.                          JOHN DOE.                       00050000
                                                                        00150000
       DATE-WRITTEN.                    November 2020 AD.               00160001
       DATE-COMPILED.                                                   00170000
                                                                        00180000
      * ************************************************************ *  00190000
      *                                                              *  00200000
      *    PROGRAM PROCESSES 3 PARMS, this progam call PROGMIDB      *  00210000
      *    with the first and last parms to obtain first squared     *  00220000
      *    into last.  This program then cubes the first in the      *  00230000
      *    middle parm.  Control is then returned to PROGTOP.        *  00231000
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
           03  WC-PROGRAM-ID            PIC X(8)  VALUE 'PROGMIDB'.     00290202
           03  FILLER                   PIC X(17) VALUE                 00290402
                'PROGRAM VERSION '.                                     00290502
           03  WC-PROGRAM-VERSION       PIC X(8)  VALUE 'V001R001'.     00290608
           03  FILLER                   PIC X(32) VALUE                 00290702
                'WORKING STORAGE STARTS HERE'.                          00291002
           03  WC-PROGTOPB              PIC X(8)   VALUE 'PROGTOPB'.    00291003
           03  WC-PROGBOTB              PIC X(8)   VALUE 'PROGBOTB'.    00291004
      /                                                                 00590300
       LINKAGE SECTION.                                                 00590400
       01  LA-TOP1                      PIC S9(9) COMP.                 00590000
       01  LA-MID1                      PIC S9(9) COMP.                 00590100
       01  LA-BOT1                      PIC S9(9) COMP.                 00590200
      /                                                                 01040000
       PROCEDURE DIVISION USING LA-TOP1                                 01050000
                                LA-MID1                                 01110000
                                LA-BOT1.

           MOVE +0 TO RETURN-CODE.                                      01120000
                                                                        01120803
           DISPLAY '@ PROGMIDB.' upon console.
                                                                        01120803
           CALL WC-PROGBOTB USING LA-TOP1                               01120804
                                  LA-BOT1.                              01120806
                                                                        01120807
           Compute LA-MID1 = LA-TOP1 ** 3.
                                                                        01121000

           GOBACK.                                                      01121100


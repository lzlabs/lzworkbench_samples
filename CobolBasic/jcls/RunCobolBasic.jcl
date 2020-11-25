//BTCHJAVB JOB ('DR3658'),'TEST PROGTOPB. ',
//         COND=(5,LT),
//         CLASS=A,                                                       239650
//         MSGCLASS=X,                                                    240100
//         MSGLEVEL=(1,1),                                                240100
//         REGION=0M,                                                   00020000
//         NOTIFY=&SYSUID                                                 239950
//*
//*
//STEP1    EXEC PGM=PROGTOPB,PARM=('4,SAMPLE_USER')
//STEPLIB  DD DISP=SHR,DSN=COBOL.BASIC.PROGTOPB.LIB
//         DD DISP=SHR,DSN=COBOL.BASIC.PROGMIDB.LIB
//         DD DISP=SHR,DSN=COBOL.BASIC.PROGBOTB.LIB
//SPOOLR   DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//

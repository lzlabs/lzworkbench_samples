//LEGACYRN JOB
//  JCLLIB  ORDER=(QA.OTG.JCLLIB)
//  SET   TID=PJOOTPLI
//  SET   CID=KEYIO
//  SET   IPTO='127.0.0.1'
//ALLOC0 EXEC ALCVSK,LLQ=VSAMFILE,KL=9,KO=13,
//          ARL=80,MRL=80,RU=1
//NLM0   EXEC SETNLM,LLQ=VSAMFILE,AIX=0
//* 
//MIXED EXEC PGM=MIXED
//$$$LZLOG DD SYSOUT=*
//$$$LZTRC DD SYSOUT=*
//STEPLIB  DD DSN=PLI.APP.MIXED.LIB,
//  DISP=SHR
//SYSPRINT DD SYSOUT=*
//VSAMFILE DD DSN=&TID..&CID..VSAMFILE,
// DISP=OLD

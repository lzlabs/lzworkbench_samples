       IDENTIFICATION DIVISION.
       PROGRAM-ID. USEGLOB.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
           01 GLOBAL-VAR   PIC X(30) EXTERNAL.
              COPY  STRUCT.    
         
       PROCEDURE        DIVISION. 
       MAIN-PROGRAM.
           DISPLAY '  <USEGLOB>'
           DISPLAY '    Old global value = ' GLOBAL-VAR
           MOVE 'Blah' TO GLOBAL-VAR.
           DISPLAY 'DEFAULT DATE-YEAR: ' DATE-YEAR OF BIRTH-DATE.
           MOVE 2019            TO DATE-YEAR OF BIRTH-DATE.
           MOVE 9               TO DATE-MONTH OF BIRTH-DATE.
           MOVE 1               TO DATE-DAY OF BIRTH-DATE.
          
           DISPLAY '  </USEGLOB>' 
           GOBACK.

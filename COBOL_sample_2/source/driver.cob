       IDENTIFICATION DIVISION.
       PROGRAM-ID. DRIVER.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 P1           PIC 9(9) VALUE 456.  
         01 P2           PIC 9(9) VALUE 123.
         01 RES          PIC 9(9).
         01 DYNCALL      PIC X(8) VALUE 'SUBEM'.		
         01 GLOBAL-VAR   PIC X(30) EXTERNAL.
         01 GLOBAL-VAR1  PIC X(30) EXTERNAL.
         
       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY '<DRIVER>'

      ****************************************************
      
           CALL 'ADDEM' USING P1 P2 RETURNING RES
           DISPLAY '  SUM = ' RES

      ****************************************************
      
           CALL DYNCALL USING P1 P2 RETURNING RES
           DISPLAY '  DIFF = ' RES

      ****************************************************
      
           MOVE 'My global variable value' TO GLOBAL-VAR
           MOVE 'USEGLOB' TO DYNCALL
           CALL DYNCALL
           DISPLAY '  New global value = ' GLOBAL-VAR

      ****************************************************
           CALL 'SOMESQL'
      ****************************************************
      
           MOVE 'VSAM' TO DYNCALL
           CALL DYNCALL
           DISPLAY '</DRIVER>'
           .

       END-OF-PROGRAM.
           STOP RUN
           .

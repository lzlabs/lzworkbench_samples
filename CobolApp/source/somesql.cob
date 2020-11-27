       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOMESQL.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      
           EXEC SQL 
              INCLUDE SQLCA
           END-EXEC      
 
        01 COMPANY_CODE PIC X(10). 
        01 COMPANY_NAME.
          49 LEN PIC S9(4) COMP.
          49 VAL PIC X(256).
        01 COMPANY_TYPE PIC S9(4) COMP.
        01 IND1 PIC S9(4) COMP.
        01 IND2 PIC S9(4) COMP.
        
       LINKAGE SECTION.
       PROCEDURE DIVISION.
      ***********************************************************
       MAIN.
           DISPLAY '  <SOMESQL>'

           PERFORM FETCHONE
    
      *       PERFORM COUNTEM

           DISPLAY '  </SOMESQL>'
           GOBACK
         .
      ***********************************************************
       FETCHONE.
           DISPLAY '    <CURSOR TEST>'

           MOVE 4 TO COMPANY_TYPE
           MOVE -1 TO SQLCODE
                           
           EXEC SQL
             DECLARE DACURSOR CURSOR FOR
             SELECT COMPANY_CODE, COMPANY_NAME
             FROM T2021A
             WHERE COMPANY_TYPE = :COMPANY_TYPE
             ORDER BY COMPANY_NAME ASC
           END-EXEC
               
           EXEC SQL
             OPEN DACURSOR
           END-EXEC
           PERFORM DISPLAY-SQLERROR-IF-ANY
           
           MOVE 'comp_code' TO COMPANY_CODE
           MOVE 9 TO LEN OF COMPANY_NAME
           MOVE 'comp_name' TO VAL OF COMPANY_NAME
          
           DISPLAY '      Fetch one row:'
           EXEC SQL
             FETCH FROM DACURSOR INTO :COMPANY_CODE,
                                               :COMPANY_NAME
           END-EXEC
           PERFORM FETCHEM-DISPLAY
          
           EXEC SQL                                                       
             CLOSE DACURSOR
           END-EXEC
           PERFORM DISPLAY-SQLERROR-IF-ANY
          
           DISPLAY '    </CURSOR TEST>'
           .
      ***********************************************************
       FETCHEM-DISPLAY.
           PERFORM DISPLAY-SQLERROR-IF-ANY

           IF SQLCODE = 0 THEN
             DISPLAY '      ' COMPANY_CODE VAL(1:20) OF COMPANY_NAME
           END-IF
         .
      ***********************************************************
       DISPLAY-SQLERROR-IF-ANY.
           IF SQLCODE NOT EQUAL 0 THEN
             DISPLAY 'STATEMENT FAILED WITH SQLCODE: ' SQLCODE
             GOBACK
           END-IF
           .
      ***********************************************************


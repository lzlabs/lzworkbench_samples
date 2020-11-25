       IDENTIFICATION DIVISION.                                        
       PROGRAM-ID. VSAM.                     
       ENVIRONMENT DIVISION.                  
       INPUT-OUTPUT SECTION.                 
       FILE-CONTROL.                    
          SELECT KSDS-File-In-Out ASSIGN TO 'VSAMFILE'
              ORGANIZATION IS INDEXED        
              ACCESS MODE IS RANDOM 
              RECORD KEY IS KSO-Key
              FILE STATUS IS FSO.
          SELECT Print-File ASSIGN TO 'COBPRINT'.
      ******************************************************************
       DATA DIVISION.                        
       FILE SECTION.                         
       FD KSDS-File-In-Out.
       01 KS-Rec.
           05 KSO-Key               PICTURE IS X(10).
           05 KSO-Rec               PICTURE IS X(30).
       FD Print-File.
       01 Print-Rec                PICTURE IS X(120).
      ******************************************************************
       WORKING-STORAGE SECTION.
       01 FSO                      PICTURE IS 99.
      ******************************************************************
       PROCEDURE DIVISION.
       MAIN.
           DISPLAY '  <VSAM>'
           OPEN OUTPUT Print-File
          
           MOVE 'Try to OPEN INOUT KSDS-File-In-Out.' TO Print-Rec
           WRITE Print-Rec

           OPEN I-O KSDS-File-In-Out
           PERFORM CARP-AND-RETURN-IF-VSAM-ERROR
          
           MOVE 'Success.' TO Print-rec
           WRITE Print-Rec
           PERFORM CARP-AND-RETURN-IF-VSAM-ERROR

           MOVE 'BBBBBBBBBB' TO KSO-Key
           READ KSDS-File-In-Out
           PERFORM CARP-AND-RETURN-IF-VSAM-ERROR
           DISPLAY '    ' KS-Rec

           MOVE 'EEEEEEEEEE' TO KSO-Key
           MOVE 'AAAAAAAAAABBBBBBBBBBCCCCCCCCCC' TO KSO-Rec
           WRITE KS-Rec
           PERFORM CARP-AND-RETURN-IF-VSAM-ERROR
          
          

           CLOSE KSDS-File-In-Out
           PERFORM CARP-AND-RETURN-IF-VSAM-ERROR

           CLOSE Print-File

           PERFORM DONE
           .
       CARP-AND-RETURN-IF-VSAM-ERROR.
           IF FSO IS NOT EQUAL ZERO
              MOVE SPACES TO Print-Rec
              WRITE Print-Rec

              DISPLAY '    ' Print-Rec
              GOBACK
           END-IF
           .
       DONE.
           DISPLAY '  </VSAM>'
           GOBACK
           .

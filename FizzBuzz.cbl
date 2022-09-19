       IDENTIFICATION DIVISION.
       PROGRAM-ID. Fizzbuzz.
      ******************************************************************
      *Pour chaque nombre n d'une liste de 1 à 100 :
      *    si le nombre est divisible par 3 : on affiche Fizz
      *    si le nombre est divisible par 5 : on affiche Buzz
      *    si le nombre est divisible par 3 et par 5 : on affiche Fizzbuzz
      *    sinon : on affiche le nombre n
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *------------------------
       01  Liste    PIC 9999 VALUE 100.
       01  Nombre   PIC 9999.
       01  Resultat PIC 9999.
       01  Reste3   PIC 9999.
       01  Reste5   PIC 9999.

       PROCEDURE DIVISION.
           MOVE 0 TO Nombre
                     Resultat
                     Reste3
                     Reste5

           PERFORM VARYING Nombre FROM 1 BY 1 UNTIL Nombre > Liste
              DIVIDE Nombre BY 3 GIVING Resultat
              REMAINDER Reste3

              DIVIDE Nombre BY 5 GIVING Resultat
              REMAINDER Reste5

              IF Reste3 = 0 AND Reste5 = 0
                 DISPLAY 'Fizzbuzz'
              ELSE
                 IF Reste3 = 0
                  OR Reste5 = 0
                    IF Reste3 = 0
                       DISPLAY 'Fizz'
                    END-IF
                    IF Reste5 = 0
                       DISPLAY 'Buzz'
                    END-IF
                 ELSE
                    DISPLAY Nombre
                 END-IF
              END-IF
           END-PERFORM

           STOP RUN.
       END PROGRAM Fizzbuzz.

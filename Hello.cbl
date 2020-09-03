       IDENTIFICATION DIVISION.
      *=================================================================
       PROGRAM-ID. Hello.
      *DESCRIPTION : + Template d'un programme COBOL
      *              + Affichage Hello World 
      *-----------------------------------------------------------------

      *=================================================================
       ENVIRONMENT DIVISION.
      *=================================================================
      *---------------------
       CONFIGURATION SECTION.
      *---------------------
       SPECIAL-NAMES.
                      DECIMAL-POINT IS COMMA.

      *---------------------
       INPUT-OUTPUT SECTION.
      *---------------------
      *FILE-CONTROL.
      *-------------
      *--- Accès aux fichiers
      *    SELECT F-ENT     ASSIGN TO 'MonFichier.txt'
      *                     ORGANIZATION IS LINE SEQUENTIAL
      *                     FILE STATUS IS L-STS-ENT.

      *=================================================================
       DATA DIVISION.
      *=================================================================
      *-------------
      *FILE SECTION.
      *-------------
      *--- Description des fichiers
      *FD  F-ENT
      *    RECORDING MODE IS V
      *    RECORD VARYING FROM 1 TO 19 CHARACTERS.
      *01  ENR-ENT.                    
      *    10  fcode        PIC 9(04).
      *    10  fname        PIC X(10).
      *    10  price        PIC 9(04).

      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------
      *--- Variables de la Working:
       01 w-Hello-World    PIC X(13) VALUE 'Hello World !'.
       01 w-Fini           PIC X.
       
      *----------------------
      *LOCAL-STORAGE SECTION.
      *----------------------
      *--- Variables locales

      *----------------
      *LINKAGE SECTION.
      *----------------
      *--- Variables de communication avec d'autres programmes  

      *=================================================================
       PROCEDURE DIVISION.
      *=================================================================
      *    Appel du paragraphe : AFFICHE-HELLO
           PERFORM AFFICHE-HELLO

           DISPLAY 'APPUYEZ SUR ENTREE POUR CONTINUER ...'
           ACCEPT w-Fini

           STOP RUN
           .
      *-----------------------------------------------------------------
      *           PARAGRAPHES APPELLEES
      *-----------------------------------------------------------------

      *=================================================================
       AFFICHE-HELLO.
      *=================================================================
           DISPLAY w-Hello-World
           .

      *================================================================
      *Fin du programme
       END PROGRAM Hello.

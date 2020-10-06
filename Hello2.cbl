       IDENTIFICATION DIVISION.
      *=================================================================
       PROGRAM-ID. Hello2.
      *DESCRIPTION : Lecture de fichier et affichage.
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
       FILE-CONTROL.
      *-------------
      *--- Acces aux fichiers
           SELECT F-ENT     ASSIGN TO 'MonFichier.txt'
                            ORGANIZATION IS LINE SEQUENTIAL
                            FILE STATUS IS L-STS-ENT.

      *=================================================================
       DATA DIVISION.
      *=================================================================
      *-------------
       FILE SECTION.
      *-------------
      *--- Description des fichiers
       FD  F-ENT
           RECORDING MODE IS V
           RECORD VARYING FROM 1 TO 19 CHARACTERS.
       01  ENR-ENT.                    
           10  hello          PIC X(5).
           10  espace         PIC X.
           10  world          PIC X(5).
           10  espace2        PIC X.
           10  point          PIC X.

      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------
      *--- Variables de la Working:
       01 w-Fini              PIC X.

      *----------------------
       LOCAL-STORAGE SECTION.
      *----------------------
      *--- Variables locales:
      *  FILE STATUS
       01 L-STS-ENT           PIC 9(2).

      * FIN DE FICHIER (Booleen)
       01  L-ENT-EOF          PIC X.
           88 L-ENT-EOF-OUI   VALUE 'O'.
           88 L-ENT-EOF-NON   VALUE 'N'.

      *----------------
      *LINKAGE SECTION.
      *----------------
      *--- Variables de communication avec d'autres programmes  

      *=================================================================
       PROCEDURE DIVISION.
      *=================================================================
      *    Appel du paragraphe : OUVERTURE-FICHIER
           PERFORM OUVERTURE-FICHIER

      *    Appel du paragraphe : LECTURE-FICHIER jusqu'a fin fichier
           PERFORM UNTIL L-ENT-EOF-OUI
              PERFORM LECTURE-FICHIER
           END-PERFORM

      *    Appel du paragraphe : FERMETURE-FICHIER
           PERFORM FERMETURE-FICHIER

           DISPLAY 'APPUYEZ SUR ENTREE POUR CONTINUER ...'
           ACCEPT w-Fini

           STOP RUN
           .
      *-----------------------------------------------------------------
      *           PARAGRAPHES APPELLEES
      *-----------------------------------------------------------------

      *=================================================================
       OUVERTURE-FICHIER.
      *=================================================================
           SET L-ENT-EOF-NON TO TRUE
           
           OPEN INPUT  F-ENT
           
           IF L-STS-ENT NOT = 0
              DISPLAY 'Erreur ouverture fichier ENT'
              PERFORM TRAIT-ERREUR
           END-IF
           .

      *=================================================================
       LECTURE-FICHIER.
      *=================================================================
           READ F-ENT
           AT END
              SET L-ENT-EOF-OUI         TO TRUE
           NOT AT END
              IF L-STS-ENT NOT = 0
                 DISPLAY 'Erreur lecture fichier'
                 PERFORM TRAIT-ERREUR
              ELSE
                 PERFORM TRAITEMENT-FICHIER
              END-IF
           END-READ
           .

      *=================================================================
       FERMETURE-FICHIER.
      *=================================================================
           CLOSE F-ENT
           IF L-STS-ENT NOT = 0
              DISPLAY 'Erreur fermeture fichier ENT'
              PERFORM TRAIT-ERREUR
           END-IF
           .

      *=================================================================
       TRAITEMENT-FICHIER.
      *=================================================================
           DISPLAY 'Lecture fichier'
           DISPLAY 'ENR-ENT = ' ENR-ENT
           DISPLAY 'hello   = ' hello
           DISPLAY 'world   = ' world
           .

      *=================================================================
       TRAIT-ERREUR.
      *=================================================================
           DISPLAY SPACE
           DISPLAY '==== ERREUR - FIN ANORMALE ===='
           DISPLAY 'APPUYEZ SUR ENTREE POUR CONTINUER ...'
           ACCEPT w-Fini
           STOP RUN
           .

      *================================================================
      *Fin du programme
       END PROGRAM Hello2.

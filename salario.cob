       IDENTIFICATION                                       DIVISION.
       PROGRAM-ID. SALARIO.
       AUTHOR.     ADRIEL FREZATTI.

       ENVIRONMENT                                          DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.

       DATA                                                 DIVISION.
       WORKING-STORAGE SECTION.
       77   WRK-NOME              PIC X(30)        VALUE SPACES.
       77   WRK-TEMPO-EMPRESA     PIC 9(02)        VALUE ZEROES.
       77   WRK-SALARIO-BASE      PIC 9(06)V99     VALUE ZEROES.
       77   WRK-SALARIO-FINAL     PIC 9(06)V99     VALUE ZEROES.
       77   WRK-PERCENTUAL-BONUS  PIC 9(02)        VALUE ZEROES.
       77   WRK-BONUS             PIC 9(06)V99     VALUE ZEROES.
       77   WRK-OP                PIC 9            VALUE ZEROES.
       77   WRK-DADOS-VALIDADOS   PIC X            VALUE "N".
       77   WRK-SALARIO-BASE-ED   PIC Z.ZZZ.ZZ9,99 VALUE ZEROES.
       77   WRK-BONUS-ED          PIC Z.ZZZ.ZZ9,99 VALUE ZEROES.
       77   WRK-SALARIO-FINAL-ED  PIC ZZ.ZZ.ZZ9,99 VALUE ZEROES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM MENU-PROCEDURE WITH TEST AFTER UNTIL WRK-OP = 2
            STOP RUN.
       MENU-PROCEDURE. 
            DISPLAY "********* MENU ***********".
            DISPLAY "*     1 - CALCULAR       *".
            DISPLAY "*     2 -   SAIR         *".
            DISPLAY "**************************".
            ACCEPT WRK-OP.

            EVALUATE WRK-OP
                WHEN 1
                    PERFORM FLUXO-CALCULO
                WHEN 2
                    DISPLAY "ENCERRANDO.. "
                WHEN OTHER
                    DISPLAY " OPCAO NAO E VALIDA"
            END-EVALUATE.
       FLUXO-CALCULO.
            MOVE "N" TO WRK-DADOS-VALIDADOS

            PERFORM UNTIL WRK-DADOS-VALIDADOS = "S"
                PERFORM LIMPAR-DADOS
                PERFORM ENTRADA-DADOS
                PERFORM VALIDAR-DADOS
            END-PERFORM.

            PERFORM CALCULAR-BONUS.
            PERFORM CALCULAR-SALARIO.
            PERFORM EXIBE-RESULTADO.
       LIMPAR-DADOS.
            MOVE SPACES TO WRK-NOME.
            MOVE ZEROS  TO WRK-SALARIO-BASE.
            MOVE ZEROS  TO WRK-TEMPO-EMPRESA.
            MOVE ZEROS  TO WRK-PERCENTUAL-BONUS.
            MOVE ZEROS  TO WRK-SALARIO-FINAL.
            MOVE ZEROS  TO WRK-PERCENTUAL-BONUS. 
       ENTRADA-DADOS.
            DISPLAY "DIGITE O NOME: "
            ACCEPT WRK-NOME.
            DISPLAY "DIGITE O SALARIO BASE: "
            ACCEPT WRK-SALARIO-BASE.
            DISPLAY "DIGITE O TEMPO DE EMPRESA: "
            ACCEPT WRK-TEMPO-EMPRESA.
       VALIDAR-DADOS.
           MOVE "S" TO WRK-DADOS-VALIDADOS.

            IF WRK-NOME EQUAL SPACES
               DISPLAY "ERRO: NOME NAO PODE FICAR EM BRANCO."
               MOVE "N" TO WRK-DADOS-VALIDADOS
            END-IF.

            IF WRK-SALARIO-BASE IS LESS THAN OR EQUAL TO ZERO
               DISPLAY "ERRO: SALARIO BASE DEVE SER MAIOR QUE ZERO."
               MOVE "N" TO WRK-DADOS-VALIDADOS
            END-IF.

            IF WRK-TEMPO-EMPRESA IS LESS THAN OR EQUAL TO ZERO
               DISPLAY "ERRO: TEMPO DE EMPRESA DEVE SER MAIOR QUE ZERO."
               MOVE "N" TO WRK-DADOS-VALIDADOS
            END-IF.

       CALCULAR-BONUS.
            IF WRK-TEMPO-EMPRESA IS LESS THAN OR EQUAL TO 1
                MOVE 5 to WRK-PERCENTUAL-BONUS
            ELSE
                IF  WRK-TEMPO-EMPRESA IS LESS THAN OR EQUAL TO 5
                    MOVE 10 to WRK-PERCENTUAL-BONUS
                ELSE
                    MOVE 15 to WRK-PERCENTUAL-BONUS
                END-IF
            END-IF.

            COMPUTE WRK-BONUS =(WRK-SALARIO-BASE * WRK-PERCENTUAL-BONUS)
            /100.

       CALCULAR-SALARIO.
            ADD WRK-SALARIO-BASE WRK-BONUS GIVING WRK-SALARIO-FINAL. 


       EXIBE-RESULTADO.
            MOVE WRK-SALARIO-BASE TO WRK-SALARIO-BASE-ED.
            MOVE WRK-BONUS TO WRK-BONUS-ED.
            MOVE WRK-SALARIO-FINAL TO WRK-SALARIO-FINAL-ED.

            DISPLAY "******** RESULTADO ********".
            DISPLAY "NOME: " WRK-NOME.
            DISPLAY "SALARIO BASE: " WRK-SALARIO-BASE-ED.
            DISPLAY "BONUS: " WRK-BONUS-ED.
            DISPLAY "SALARIO FINAL: " WRK-SALARIO-FINAL-ED.
            DISPLAY "***************************". 

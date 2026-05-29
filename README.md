# Projeto 3 - COBOL: Cálculo de Salário Final

Este projeto é um programa em COBOL que calcula o salário final de um funcionário com base no salário base e no tempo de empresa.

O programa recebe os dados do funcionário, valida as entradas, calcula o percentual de bônus, calcula o valor do bônus e exibe o resultado final formatado.

## Funcionalidades

O programa possui as seguintes funcionalidades:

* Exibe um menu principal com opções para calcular ou sair.
* Recebe o nome do funcionário.
* Recebe o salário base.
* Recebe o tempo de empresa.
* Valida os dados informados.
* Calcula o percentual de bônus de acordo com o tempo de empresa.
* Calcula o valor do bônus.
* Calcula o salário final.
* Exibe o resultado formatado.

## Regra de bônus

O percentual de bônus é definido de acordo com o tempo de empresa:

| Tempo de empresa | Percentual de bônus |
| ---------------- | ------------------- |
| Até 1 ano        | 5%                  |
| De 2 a 5 anos    | 10%                 |
| Acima de 5 anos  | 15%                 |

## Estrutura do código

O código foi organizado em parágrafos para separar melhor cada responsabilidade do programa.

### MAIN-PROCEDURE

É o ponto principal do programa.

Esse parágrafo executa o menu até que o usuário escolha a opção de sair.

### MENU-PROCEDURE

Exibe o menu principal e lê a opção escolhida pelo usuário.

As opções disponíveis são:

* `1 - CALCULAR`
* `2 - SAIR`

A escolha do usuário é tratada com `EVALUATE`.

### FLUXO-CALCULO

Controla o fluxo principal do cálculo.

Esse parágrafo chama os outros parágrafos responsáveis por limpar os dados, receber entradas, validar os dados, calcular o bônus, calcular o salário final e exibir o resultado.

### LIMPAR-DADOS

Reinicializa as variáveis usadas no cálculo.

Isso evita que valores de uma execução anterior interfiram em uma nova execução do programa.

### ENTRADA-DADOS

Recebe os dados informados pelo usuário.

Os dados solicitados são:

* Nome
* Salário base
* Tempo de empresa

### VALIDAR-DADOS

Verifica se os dados informados são válidos antes de continuar o cálculo.

As validações feitas são:

* O nome não pode ficar em branco.
* O salário base deve ser maior que zero.
* O tempo de empresa deve ser maior que zero.

Se algum dado for inválido, o programa exibe uma mensagem de erro e solicita os dados novamente.

### CALCULA-BONUS

Define o percentual de bônus de acordo com o tempo de empresa.

Esse parágrafo usa `IF` para aplicar as regras:

* Até 1 ano: 5%
* De 2 a 5 anos: 10%
* Acima de 5 anos: 15%

Depois disso, calcula o valor do bônus.

### CALCULA-SALARIO

Calcula o salário final do funcionário.

O salário final é calculado somando o salário base com o valor do bônus.

### EXIBE-RESULTADO

Exibe o resultado final do cálculo.

São mostrados:

* Nome do funcionário
* Salário base
* Valor do bônus
* Salário final

Os valores monetários são movidos para variáveis editadas antes da exibição, para que apareçam de forma mais legível.

## Observações

O programa utiliza `PERFORM` para chamar os parágrafos e manter o código organizado.

Também utiliza `PERFORM UNTIL` para repetir a entrada de dados enquanto houver informações inválidas.

A estrutura foi feita de forma modular para facilitar a leitura, manutenção e entendimento do fluxo do programa.

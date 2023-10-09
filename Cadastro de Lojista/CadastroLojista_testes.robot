*** Settings ***
Documentation        Esses casos de teste sao referentes ao cadastro de lojista na plataforma GOIT
Resource             CadastroLojistaresources.robot
Test Setup           Abrir o navegador
Test Teardown        Fechar o navegador
*** Test Cases ***
CT 01 - Cadastro de lojista com dados válidos
        [Documentation]        Esse caso de teste testa o cadastro de lojista no GOIT preenchendo os campos de forma correta
        Acessar: localhost/goit
        Na home do sistema, clicar no link "Cadastre-se aqui"
        Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo
        Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
        Clicar em "Ok" no pop-up do cadastro

CT 02 - Cadastro de lojista com CNPJ indisponível
        [Documentation]        Esse caso de teste testa o cadastro de lojista no GOIT preenchendo o campo de CNPJ com um CNPJ ja cadastrado
        Acessar: localhost/goit
        Na home do sistema, clicar no link "Cadastre-se aqui"
        Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo
        Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "CNPJ", neste campo insira um CNPJ indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
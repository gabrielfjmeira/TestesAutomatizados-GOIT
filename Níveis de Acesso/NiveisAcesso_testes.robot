*** Settings ***
Documentation   Essa suíte testa os casos de teste do GOIT selecionado pela equipe.
Resource        NiveisAcesso_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
CT 1 - Acessar a tela inicial sem estar logado com nenhum tipo de usuário
        [Documentation]     Esse teste serve para verificar se o nível de acesso está coerente dentro da plataforma
        [Tags]              nivel_acesso
        Acessar: localhost/goit
        Acessar: localhost/goit/PAGES/home/home.php
        Clicar em "Ok" no pop-up de aviso que informa que é necessário realizar o login para acessar o sistema

CT2 - Acessar a tela de gerenciamento de anúncios do lojista como usuário praticante
        [Documentation]     Esse teste serve para verificar se o praticante é barrado ao tentar logar no gerenciamento de anuncios do usuáriolojista
        [Tags]              nivel_acesso
        Acessar: localhost/goit
        Realizar login no sistema com uma conta de usuário praticante
        Acessar: localhost/goit/PAGES/anuncios/anuncio.php
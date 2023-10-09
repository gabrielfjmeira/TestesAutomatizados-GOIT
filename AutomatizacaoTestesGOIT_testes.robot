*** Settings ***
Documentation    Essa suíte testa o site GOIT
Resource         AutomatizacaoTestesGOIT_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
#CADASTRO DE PRATICANTE
CT01 - Cadastro de praticante com dados válidos
	[Documentation]    Esse teste verifica o cadastro de um praticante com dados válidos
    [Tags]              cadastro_Praticante         verificacao_Formulario
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Praticante", em seguida clique no botão próximo 
	Preencher todos os campos do formulário de cadastro de praticante com dados válidos, em seguida clique no botão "Cadastrar"
	Clicar em "Ok" no pop-up do cadastro

CT02 - Cadastro de praticante com apelido indisponível
	[Documentation]    Esse teste verifica o cadastro de um praticante com o apelido já cadastrado
    [Tags]              cadastro_Praticante         verificacao_Formulario
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Praticante", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro de praticante com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"

#CADASTRO ADICIONAL DE PRATICANTE PARA AUXÍLIO EM FUTUROS TESTES
CA01 - Cadastro adicional de praticante para realização de testes
	[Documentation]    Esse teste cria um outro usuário praticante que irá ser utilizado em demais casos de testes do sistema, portando não é um caso de teste (CT) e sim um cadastro adicional (CA)
    [Tags]              cadastro_PraticanteAdicional
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Praticante", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro de praticante (CA) com dados válidos, em seguida clique no botão "Cadastrar"
	Clicar em "Ok" no pop-up do cadastro

#CADASTRO DE INSTRUTOR
CT03 - Cadastro de instrutor com dados válidos
	[Documentation]    Esse teste verifica o cadastro de um instrutor com dados válidos
    [Tags]              cadastro_Instrutor              verificacao_Formulario
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro de instrutor com dados válidos, em seguida clique no botão "Cadastrar"
	Clicar em "Ok" no pop-up do cadastro

CT04 - Cadastro de instrutor com cadastur indisponível
	[Documentation]    Esse teste verifica o cadastro de um instrutor com o cadastur já cadastrado
    [Tags]              cadastro_Instrutor              verificacao_Formulario 
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro de instrutor com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"

#CADASTRO DE LOJISTA
CT05 - Cadastro de lojista com dados válidos
    [Documentation]     Esse teste verifica o cadastro de um lojista com dados válidos
    [Tags]              cadastro_Lojista                verificacao_Formulario    
    Acessar: localhost/goit
    Na home do sistema, clicar no link "Cadastre-se aqui"
    Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo
    Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
    Clicar em "Ok" no pop-up do cadastro

CT06 - Cadastro de lojista com CNPJ indisponível
    [Documentation]     Esse teste verifica o cadastro de um lojista com o CNPJ já cadastrado
    [Tags]              cadastro_Lojista                verificacao_Formulario
    Acessar: localhost/goit
    Na home do sistema, clicar no link "Cadastre-se aqui"
    Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo
    Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "CNPJ", neste campo insira um CNPJ indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"

#CRIAÇÃO DE UMA ATIVIDADE AO AR LIVRE
CT07 - Criação de atividade ao ar livre com dados válidos
	[Documentation]    Esse teste verifica a criação de uma atividade ao ar livre com dados válidos
	[Tags]             criacao_AtividadeAoArLivre       verificacao_Formulario
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante
	Na tela de inicial, clicar no ícone de "Publicar"
	Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos, em seguida clique no botão "Publicar"
    Clicar em "Ok" no pop-up da criação de atividade ao ar livre

CT08 - Criação de atividade ao ar livre com data inferior a atual
	[Documentation]    Esse teste verifica a criação de uma atividade ao ar livre com dados inválidos
	[Tags]             criacao_AtividadeAoArLivre       verificacao_Formulario
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante
	Na tela de inicial, clicar no ícone de "Publicar"
	Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos exceto o de "Data", neste campo insira uma data inferior a atual em seguida clique no botão "Publicar"    

#INSCRIÇÃO EM UMA ATIVIDADE AO AR LIVRE
CT09 - Inscrição em uma atividade ao ar livre que possuí vagas
	[Documentation]    Esse teste verifica se é possível se inscrever em uma atividade ao ar livre que possuí vagas
	[Tags]             inscricao_AtividadeAoArLivre
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante (CA)
	Na tela de inicial, Selecione uma atividade ao ar livre criada por outro usuário e clique em "Inscrever-se"
    Clicar em "Ok" no pop-up da inscrição da atividade ao ar livre

#NÍVEIS DE ACESSO
CT10 - Acessar a tela inicial sem estar logado com nenhum tipo de usuário
    [Documentation]     Esse teste serve para verificar se o nível de acesso está coerente dentro da plataforma
    [Tags]              nivel_Acesso
    Acessar: localhost/goit
    Acessar: localhost/goit/PAGES/home/home.php
    Clicar em "Ok" no pop-up de aviso que informa que é necessário realizar o login para acessar o sistema

CT11 - Acessar a tela de gerenciamento de anúncios do lojista como usuário praticante
    [Documentation]     Esse teste serve para verificar se o praticante é barrado ao tentar logar no gerenciamento de anuncios do usuáriolojista
    [Tags]              nivel_Acesso
    Acessar: localhost/goit
    Realizar login no sistema com uma conta de usuário praticante (Nível de Acesso)
    Acessar: localhost/goit/PAGES/anuncios/anuncio.php
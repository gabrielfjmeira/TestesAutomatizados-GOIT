*** Settings ***
Documentation    Essa suíte testa o site GO It para os casos de Cadastro e Cadastro com Apelido invalido
Resource         CadastroInstrutor_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Cadastro de instrutor com dados válidos
	[Documentation]    Esse teste verifica o cadastro de um instrutor com dados válidos
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
	Clicar em "Ok" no pop-up do cadastro


CT2 - Cadastro de instrutor com cadastur indisponível
	[Documentation]    Esse teste verifica o cadastro de um instrutor com o cadastur já cadastrado
	Acessar: localhost/goit
	Na home do sistema, clicar no link "Cadastre-se aqui"
	Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
	

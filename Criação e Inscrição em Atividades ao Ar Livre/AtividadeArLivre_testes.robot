*** Settings ***
Documentation    Essa suíte testa o site do GoIT com interações referentes as atividades ao ar livre
Resource         AtividadeArLivre_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Criação de atividade ao ar livre com dados válidos
	[Documentation]    Esse teste verifica a criação de uma atividade ao ar livre com dados válidos
	[Tags]             criacao_AtividadeAoArLivre   dados_Validos
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante
	Na tela de inicial, clicar no ícone de "Publicar"
	Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos, em seguida clique no botão "Publicar"
    Clicar em "Ok" no pop-up da criação de atividade ao ar livre

CT2 - Criação de atividade ao ar livre com data inferior a atual
	[Documentation]    Esse teste verifica a criação de uma atividade ao ar livre com dados inválidos
	[Tags]             criacao_AtividadeAoArLivre   dados_Invalidos
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante
	Na tela de inicial, clicar no ícone de "Publicar"
	Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos exceto o de "Data", neste campo insira uma data inferior a atual em seguida clique no botão "Publicar"    

CT3 - Inscrição em uma atividade ao ar livre que possuí vagas
	[Documentation]    Esse teste verifica se é possível se inscrever em uma atividade ao ar livre que possuí vagas
	[Tags]             inscricao_AtividadeAoArLivre
	Acessar: localhost/goit
	Realizar login no sistema com uma conta de usuário praticante2
	Na tela de inicial, Selecione uma atividade ao ar livre criada por outro usuário e clique em "Inscrever-se"
    Clicar em "Ok" no pop-up da inscrição da atividade ao ar livre
    
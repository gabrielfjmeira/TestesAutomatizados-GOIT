*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/goit/index.php
${EMAIL_CRIADOR}	gabrielfjmeira@gmail.com
${SENHA_CRIADOR}	Ga@@2018
${EMAIL_INSCRITO}	xulio@gmail.com
${SENHA_INSCRITO}	Xulio@1234
${TITULO_ATIVIDADE}	Caminhada no Jardim Botânico
${INDEX_CATEGORIA_ATIVIDADE}	1
${DESCRICAO_ATIVIDADE}	Caminhada no Jardim Botânico no dia 24/10, venha participar!
${ENDERECO_ATIVIDADE}	Rua Engenheiro Ostoja Roguski, 350
${PARTICIPANTES_ATIVIDADE}	20
${DATA_ATIVIDADE}	24/10/2023
${DATA_ANTIGA_ATIVIDADE}	24/10/2022
${HORA_ATIVIDADE}	09:00

*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar: localhost/goit
	Go To	url=${URL}

Realizar login no sistema com uma conta de usuário praticante
	Input Text	css:input[name=txtEmail]        ${EMAIL_CRIADOR}
	Input Text	css:input[name=txtSenha]          ${SENHA_CRIADOR}
	Click Element	css:button[id=btnEntrar]

Realizar login no sistema com uma conta de usuário praticante2
	Input Text	css:input[name=txtEmail]        ${EMAIL_INSCRITO}
	Input Text	css:input[name=txtSenha]          ${SENHA_INSCRITO}
	Click Element	css:button[id=btnEntrar]

Na tela de inicial, clicar no ícone de "Publicar"
	Click Element	css:button[id=btnPublicacao]

Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos, em seguida clique no botão "Publicar"
	Input Text	css:input[name=txtTitulo]        ${TITULO_ATIVIDADE}
	Select From List By Index    id=categoriaAtividade    ${INDEX_CATEGORIA_ATIVIDADE}
	Input Text	css:textarea[name=txtDescricao]        ${DESCRICAO_ATIVIDADE}
	Input Text	css:input[name=txtLocalizacao]        ${ENDERECO_ATIVIDADE}
	Input Text	css:input[name=nbrInscritos]        ${PARTICIPANTES_ATIVIDADE}
	Input Text	css:input[name=dataAtividade]        ${DATA_ATIVIDADE}	
	Input Text	css:input[name=horaAtividade]        ${HORA_ATIVIDADE}    	
	Capture Page Screenshot
    Click Element	css:button[id=submitButton]	

Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos exceto o de "Data", neste campo insira uma data inferior a atual em seguida clique no botão "Publicar"
	Input Text	css:input[name=txtTitulo]        ${TITULO_ATIVIDADE}
	Select From List By Index    id=categoriaAtividade    ${INDEX_CATEGORIA_ATIVIDADE}
	Input Text	css:textarea[name=txtDescricao]        ${DESCRICAO_ATIVIDADE}
	Input Text	css:input[name=txtLocalizacao]        ${ENDERECO_ATIVIDADE}
	Input Text	css:input[name=nbrInscritos]        ${PARTICIPANTES_ATIVIDADE}
	Input Text	css:input[name=dataAtividade]        ${DATA_ANTIGA_ATIVIDADE}	
	Input Text	css:input[name=horaAtividade]        ${HORA_ATIVIDADE}    	
	Capture Page Screenshot
    Click Element	css:button[id=submitButton]	

Clicar em "Ok" no pop-up da criação de atividade ao ar livre
	Handle Alert    Accept	

Na tela de inicial, Selecione uma atividade ao ar livre criada por outro usuário e clique em "Inscrever-se"
	Capture Page Screenshot
	${CONTADOR}    Set Variable    1
	${CONTROLE}		Set Variable	0
	${ITERACAO}		Set Variable	1
	WHILE	${CONTADOR} < 99999
		${ID}     Set Variable   linkInscricaoAtv${CONTADOR}
		${ELEMENTO}	Get webElement	${ID}
		IF	$ELEMENTO.text == "Inscrever-Se"
			Click Element	css:a[id=${ID}]												
			${CONTROLE}		Evaluate	${CONTROLE} + ${ITERACAO}
			Exit For Loop If	${CONTROLE} != 0
		END		
		${CONTADOR}		Evaluate    ${CONTADOR} + ${ITERACAO}		
	END	

Clicar em "Ok" no pop-up da inscrição da atividade ao ar livre
	Handle Alert    Accept
	













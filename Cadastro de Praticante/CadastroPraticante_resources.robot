*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/goit/index.php
${VALUE_TO_SELECT}	2
${USUARIO_VALIDO_P}	Antônio Carlos
${APELIDO_VALIDO_P}	AntonioCarlos
${DATANASC_VALIDO_P}	2002-10-22
${EMAIL_VALIDO_P}	antoniocarlos@gmail.com
${SENHA_VALIDA_P}	Antonio@1234
${USUARIO_INVALIDO_P}	Bruno José
${APELIDO_INVALIDO_P}	AntonioCarlos
${DATANASC_INVALIDO_P}	2002-10-22
${EMAIL_INVALIDO_P}	brunojose@gmail.com
${SENHA_INVALIDA_P}	Bruno@1234

*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar: localhost/goit;
	Go To	url=${URL}

Na home do sistema, clicar no link "Cadastre-se aqui";
	Click Element	css:a[id=linkCadastro]	

Na tela de Cadastro-> Seleção de usuário, selecione a opção "Praticante", em seguida clique no botão próximo. 
	Select From List by Value    css:Select[name=tipoUsuario] 	${VALUE_TO_SELECT}
	Click Button    //button[@type="submit" and text()="Próximo"]

Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar".
	Input Text	css:input[name=txtNome]        ${USUARIO_VALIDO_P}
	Input Text	css:input[name=txtApelido]        ${APELIDO_VALIDO_P}
	Input Text	css:input[name=dataNascimento]        ${DATANASC_VALIDO_P}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL_VALIDO_P}
	Input Text	css:input[name=txtSenha]          ${SENHA_VALIDA_P}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_VALIDA_P}
	Capture Page Screenshot
	Click Element	css:button[id=btnCadastrar]	

Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar".
	Input Text	css:input[name=txtNome]        ${USUARIO_INVALIDO_P}
	Input Text	css:input[name=txtApelido]        ${APELIDO_INVALIDO_P}
	Input Text	css:input[name=dataNascimento]        ${DATANASC_INVALIDO_P}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL_INVALIDO_P}
	Input Text	css:input[name=txtSenha]          ${SENHA_INVALIDA_P}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_INVALIDA_P}
	Click Element	css:button[id=btnCadastrar]
	Capture Page Screenshot	

Clicar em "Ok" no pop-up do cadastro.	
	Handle Alert    Accept
*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/goit/index.php
${VALUE_TO_SELECT_I}	3
${USUARIO_VALIDO_I}	João Pedro
${APELIDO_VALIDO_I}	JPedro
${DATANASC_VALIDO_I}	2001-11-11
${CADASTUR_VALIDO_I}	PR98765432PUUC
${INDEX_CATEGORIA_VALIDA_I}	1
${EMAIL_VALIDO_I}	joaopedro@gmail.com
${SENHA_VALIDA_I}	Joao@1234
${USUARIO_INVALIDO_I}	Carlos Felipe
${APELIDO_INVALIDO_I}	CarlosF
${DATANASC_INVALIDO_I}	1998-01-15
${CADASTUR_INVALIDO_I}	PR98765432PUUC
${INDEX_CATEGORIA_INVALIDA_I}	2
${EMAIL_INVALIDO_I}	carlosfelipe@gmail.com
${SENHA_INVALIDA_I}	Carlos@1234

*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar: localhost/goit
	Go To	url=${URL}

Na home do sistema, clicar no link "Cadastre-se aqui"
	Click Element	css:a[id=linkCadastro]	

Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Select From List by Value    css:Select[name=tipoUsuario] 	${VALUE_TO_SELECT_I}
	Click Button    //button[@type="submit" and text()="Próximo"]

Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
	Input Text	css:input[name=txtNome]        ${USUARIO_VALIDO_I}
	Input Text	css:input[name=txtApelido]        ${APELIDO_VALIDO_I}
	Input Text	css:input[name=dataNascimento]        ${DATANASC_VALIDO_I}
	Input Text	css:input[name=txtCadastur]		${CADASTUR_VALIDO_I}
	Select From List by Index	css:Select[name=catInstrutor]	${INDEX_CATEGORIA_VALIDA_I}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL_VALIDO_I}
	Input Text	css:input[name=txtSenha]          ${SENHA_VALIDA_I}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_VALIDA_I}
	Capture Page Screenshot
	Click Element	css:button[id=btnCadastrar]	

Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
	Input Text	css:input[name=txtNome]        ${USUARIO_INVALIDO_I}
	Input Text	css:input[name=txtApelido]        ${APELIDO_INVALIDO_I}
	Input Text	css:input[name=dataNascimento]        ${DATANASC_INVALIDO_I}
	Input Text	css:input[name=txtCadastur]		${CADASTUR_INVALIDO_I}
	Select From List by Index	css:Select[name=catInstrutor]	${INDEX_CATEGORIA_INVALIDA_I}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL_INVALIDO_I}
	Input Text	css:input[name=txtSenha]          ${SENHA_INVALIDA_I}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_INVALIDA_I}
	Click Element	css:button[id=btnCadastrar]
	Capture Page Screenshot	

Clicar em "Ok" no pop-up do cadastro
	Handle Alert    Accept
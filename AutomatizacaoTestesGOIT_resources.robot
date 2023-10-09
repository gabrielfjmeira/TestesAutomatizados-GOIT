*** Settings ***
Library	SeleniumLibrary

*** Variables ***
#GLOBAIS
${BROWSER}	                    chrome 
${URL}		                    http://localhost/goit/index.php

#CADASTRO DE PRATICANTE
${VALUE_TO_SELECT_P}	        2
${USUARIO_VALIDO_P}	            Antônio Carlos
${APELIDO_VALIDO_P}	            AntonioCarlos
${DATANASC_VALIDO_P}	        2002-10-22
${EMAIL_VALIDO_P}	            antoniocarlos@gmail.com
${SENHA_VALIDA_P}	            Antonio@1234
${USUARIO_INVALIDO_P}	        Bruno José
${APELIDO_INVALIDO_P}	        AntonioCarlos
${DATANASC_INVALIDO_P}	        2002-10-22
${EMAIL_INVALIDO_P}	            brunojose@gmail.com
${SENHA_INVALIDA_P}	            Bruno@1234

#CADASTRO DE PRATICANTE ADICIONAL
${USUARIO_CA}	                Wiliam Souza
${APELIDO_CA}	                WilSouza
${DATANASC_CA}	                1997-08-13
${EMAIL_CA}	                    wilsouza@gmail.com
${SENHA_CA}	                    Wiliam@1234

#CADASTRO DE INSTRUTOR
${VALUE_TO_SELECT_I}	        3
${USUARIO_VALIDO_I}	            João Pedro
${APELIDO_VALIDO_I}	            JPedro
${DATANASC_VALIDO_I}	        2001-11-11
${CADASTUR_VALIDO_I}	        PR98765432PUUC
${INDEX_CATEGORIA_VALIDA_I} 	1
${EMAIL_VALIDO_I}	            joaopedro@gmail.com
${SENHA_VALIDA_I}	            Joao@1234
${USUARIO_INVALIDO_I}	        Carlos Felipe
${APELIDO_INVALIDO_I}	        CarlosF
${DATANASC_INVALIDO_I}	        1998-01-15
${CADASTUR_INVALIDO_I}	        PR98765432PUUC
${INDEX_CATEGORIA_INVALIDA_I}	2
${EMAIL_INVALIDO_I}	            carlosfelipe@gmail.com
${SENHA_INVALIDA_I}	            Carlos@1234

#CADASTRO DE LOJISTA
${LOCATOR_SELECT}	            name:tipoUsuario
${LOCATOR_PROXIMO}	            css:button[id=btnProximo]
${LOCATOR_RAZAO}	            id:txtRazaoSocial
${RAZAO_SOCIAL}		            Empresa Bacana Ltda
${RAZAO_SOCIAL2}                Empresa Legal Ltda
${LOCATOR_FANTASIA}	            id:txtFantasia
${FANTASIA}		                EmpresaBacana
${FANTASIA2}                    EmpresaLegal
${LOCATOR_CNPJ}		            id:txtCNPJ
${CNPJ_VALIDO}		            12345678901234
${LOCATOR_EMAIL}	            id:txtEmail
${EMAIL}                	    empresabacana@gmail.com
${EMAIL2}                       empresalegal@gmail.com
${LOCATOR_SENHA}	            id:txtSenha
${LOCATOR_CONFIRM_SENHA}	    id:txtSenhaConfirmada
${SENHA}	                    Senha@123
${LOCATOR_CADASTRAR}	        css:button[id=btnCadastrar]

#CRIAÇÂO DE ATIVIDADE AO AR LIVRE
${EMAIL_CRIADOR}	            ${EMAIL_VALIDO_P}
${SENHA_CRIADOR}	            ${SENHA_VALIDA_P}
${EMAIL_INSCRITO}	            ${EMAIL_CA}
${SENHA_INSCRITO}	            ${SENHA_CA}
${TITULO_ATV_VALIDA}	        Caminhada no Jardim Botânico
${INDEX_CATEGORIA_ATVS}          1
${DESCRICAO_ATV_VALIDA}	        Caminhada no Jardim Botânico no dia 24/10, venha participar!
${ENDERECO_ATV_VALIDA}	        Rua Engenheiro Ostoja Roguski, 350
${PARTICIPANTES_ATV_VALIDA}	    20
${DATA_ATV_VALIDA}	            24/10/2023
${HORA_ATV_VALIDA}	            09:00
${TITULO_ATV_INVALIDA}	        Caminhada entre amigos no Barigui
${DESCRICAO_ATV_INVALIDA}	    Caminhada entre amigos no Barigui, venha participar e traga 1kg de alimento não perecível para participar!
${ENDERECO_ATV_INVALIDA}	    Rua Batista Ganz, 453
${PARTICIPANTES_ATV_INVALIDA}	100
${DATA_ATV_INVALIDA}            09/01/2010
${HORA_ATV_INVALIDA}	        08:30

#NÍVEIS DE ACESSO
${EMAIL_NIVEL_ACESSO}           ${EMAIL_CA}
${SENHA_NIVEL_ACESSO}           ${SENHA_CA}

*** Keywords ***
#GLOBAIS
Abrir o navegador
	Open Browser	            browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar: localhost/goit
	Go To	                    url=${URL}
    Sleep                       2s
    Capture Page Screenshot

#CADASTROS EM GERAL
Na home do sistema, clicar no link "Cadastre-se aqui"
	Click Element	            css:a[id=linkCadastro]	
    Sleep                       2s
    Capture Page Screenshot    

Clicar em "Ok" no pop-up do cadastro	
    Sleep                       2s
	Handle Alert                Accept

#CADASTRO DE PRATICANTE
Na tela de Cadastro-> Seleção de usuário, selecione a opção "Praticante", em seguida clique no botão próximo
	Select From List by Value   css:Select[name=tipoUsuario]               ${VALUE_TO_SELECT_P}
    Sleep                       2s
    Capture Page Screenshot
	Click Button                css:button[id=btnProximo]
    Capture Page Screenshot

Preencher todos os campos do formulário de cadastro de praticante com dados válidos, em seguida clique no botão "Cadastrar"
	Input Text	                css:input[name=txtNome]                     ${USUARIO_VALIDO_P}
	Input Text	                css:input[name=txtApelido]                  ${APELIDO_VALIDO_P}
	Input Text	                css:input[name=dataNascimento]              ${DATANASC_VALIDO_P}
	Click Element	            css:input[id='sexo_m']
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_VALIDO_P}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_VALIDA_P}
	Input Text	                css:input[name=txtSenhaConfirmada]          ${SENHA_VALIDA_P}
    Sleep                       2s
	Capture Page Screenshot
	Click Element	            css:button[id=btnCadastrar]	

Preencher todos os campos do formulário de cadastro de praticante com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
	Input Text	                css:input[name=txtNome]                     ${USUARIO_INVALIDO_P}
	Input Text	                css:input[name=txtApelido]                  ${APELIDO_INVALIDO_P}
	Input Text	                css:input[name=dataNascimento]              ${DATANASC_INVALIDO_P}
	Click Element	            css:input[id='sexo_m']
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_INVALIDO_P}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_INVALIDA_P}
	Input Text	                css:input[name=txtSenhaConfirmada]          ${SENHA_INVALIDA_P}
	Click Element	            css:button[id=btnCadastrar]
    Sleep                       2s
	Capture Page Screenshot	

#CADASTRO ADICIONAL DE PRATICANTE
Preencher todos os campos do formulário de cadastro de praticante (CA) com dados válidos, em seguida clique no botão "Cadastrar"
	Input Text	                css:input[name=txtNome]                     ${USUARIO_CA}
	Input Text	                css:input[name=txtApelido]                  ${APELIDO_CA}
	Input Text	                css:input[name=dataNascimento]              ${DATANASC_CA}
	Click Element	            css:input[id='sexo_m']
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_CA}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_CA}
	Input Text	                css:input[name=txtSenhaConfirmada]          ${SENHA_CA}
    Sleep                       2s
	Capture Page Screenshot
	Click Element	            css:button[id=btnCadastrar]	

#CADASTRO DE INSTRUTOR
Na tela de Cadastro-> Seleção de usuário, selecione a opção "Instrutor", em seguida clique no botão próximo
	Select From List by Value   css:Select[name=tipoUsuario] 	            ${VALUE_TO_SELECT_I}
    Sleep                       2s
	Click Button                css:button[id=btnProximo]

Preencher todos os campos do formulário de cadastro de instrutor com dados válidos, em seguida clique no botão "Cadastrar"
	Input Text	                css:input[name=txtNome]                     ${USUARIO_VALIDO_I}
	Input Text	                css:input[name=txtApelido]                  ${APELIDO_VALIDO_I}
	Input Text	                css:input[name=dataNascimento]              ${DATANASC_VALIDO_I}
	Input Text	                css:input[name=txtCadastur]		            ${CADASTUR_VALIDO_I}
	Select From List by Index	css:Select[name=catInstrutor]	            ${INDEX_CATEGORIA_VALIDA_I}
	Click Element	            css:input[id='sexo_m']
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_VALIDO_I}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_VALIDA_I}
	Input Text	                css:input[name=txtSenhaConfirmada]          ${SENHA_VALIDA_I}
    Sleep                       2s
	Capture Page Screenshot
	Click Element	            css:button[id=btnCadastrar]	

Preencher todos os campos do formulário de cadastro de instrutor com dados válidos exceto o de "Apelido", neste campo insira um apelido indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
	Input Text	                css:input[name=txtNome]                     ${USUARIO_INVALIDO_I}
	Input Text	                css:input[name=txtApelido]                  ${APELIDO_INVALIDO_I}
	Input Text	                css:input[name=dataNascimento]              ${DATANASC_INVALIDO_I}
	Input Text	                css:input[name=txtCadastur]		            ${CADASTUR_INVALIDO_I}
	Select From List by Index	css:Select[name=catInstrutor]	            ${INDEX_CATEGORIA_INVALIDA_I}
	Click Element	            css:input[id='sexo_m']
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_INVALIDO_I}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_INVALIDA_I}
	Input Text	                css:input[name=txtSenhaConfirmada]          ${SENHA_INVALIDA_I}
	Click Element	            css:button[id=btnCadastrar]
    Sleep                       2s
	Capture Page Screenshot

#CADASTRO DE LOJISTA
Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo 
    Select From List By Value   ${LOCATOR_SELECT}                           4
    Sleep                       2s    
    Capture Page Screenshot
    Click Element               ${LOCATOR_PROXIMO}

Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
    Input Text                  ${LOCATOR_RAZAO}                            ${RAZAO_SOCIAL}
    Input Text                  ${LOCATOR_FANTASIA}                         ${FANTASIA}
    Input Text                  ${LOCATOR_CNPJ}                             ${CNPJ_VALIDO}
    Input Text                  ${LOCATOR_EMAIL}                            ${EMAIL}
    Input Password              ${LOCATOR_SENHA}                            ${SENHA}
    Input Password              ${LOCATOR_CONFIRM_SENHA}                    ${SENHA}
    Sleep                       2s
    Capture Page Screenshot
    Click Element               ${LOCATOR_CADASTRAR}

Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "CNPJ", neste campo insira um CNPJ indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
    Input Text                  ${LOCATOR_RAZAO}                            ${RAZAO_SOCIAL2}
    Input Text                  ${LOCATOR_FANTASIA}                         ${FANTASIA2}
    Input Text                  ${LOCATOR_CNPJ}                             ${CNPJ_VALIDO}
    Input Text                  ${LOCATOR_EMAIL}                            ${EMAIL2}
    Input Password              ${LOCATOR_SENHA}                            ${SENHA}
    Input Password              ${LOCATOR_CONFIRM_SENHA}                    ${SENHA}
    Click Element               ${LOCATOR_CADASTRAR}
    Sleep                       2s
    Capture Page Screenshot

#CRIAÇÃO DE ATIVIDADE AO AR LIVRE
Realizar login no sistema com uma conta de usuário praticante
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_CRIADOR}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_CRIADOR}
    Sleep                       2s
    Capture Page Screenshot
	Click Element	            css:button[id=btnEntrar]

Na tela de inicial, clicar no ícone de "Publicar"
    Sleep                       2s
	Click Element	            css:button[id=btnPublicacao]    
    Capture Page Screenshot

Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos, em seguida clique no botão "Publicar"
	Input Text	                css:input[name=txtTitulo]                   ${TITULO_ATV_VALIDA}
	Select From List By Index   id=categoriaAtividade                       ${INDEX_CATEGORIA_ATVS}
	Input Text	                css:textarea[name=txtDescricao]             ${DESCRICAO_ATV_VALIDA}
	Input Text	                css:input[name=txtLocalizacao]              ${ENDERECO_ATV_VALIDA}
	Input Text	                css:input[name=nbrInscritos]                ${PARTICIPANTES_ATV_VALIDA}
	Input Text	                css:input[name=dataAtividade]               ${DATA_ATV_VALIDA}	
	Input Text	                css:input[name=horaAtividade]               ${HORA_ATV_VALIDA}
    Sleep                       2s    	
	Capture Page Screenshot
    Click Element	            css:button[id=submitButton]	

Preencher todos os campos do formulário de criação de atividade ao ar livre com dados válidos exceto o de "Data", neste campo insira uma data inferior a atual em seguida clique no botão "Publicar"
	Input Text	                css:input[name=txtTitulo]                   ${TITULO_ATV_INVALIDA}
	Select From List By Index   id=categoriaAtividade                       ${INDEX_CATEGORIA_ATVS}
	Input Text	                css:textarea[name=txtDescricao]             ${DESCRICAO_ATV_INVALIDA}
	Input Text	                css:input[name=txtLocalizacao]              ${ENDERECO_ATV_INVALIDA}
	Input Text	                css:input[name=nbrInscritos]                ${PARTICIPANTES_ATV_INVALIDA}
	Input Text	                css:input[name=dataAtividade]               ${DATA_ATV_INVALIDA}	
	Input Text	                css:input[name=horaAtividade]               ${HORA_ATV_INVALIDA}  
	Click Element	            css:button[id=submitButton]
    	Sleep                       2s 	
	Capture Page Screenshot
    	

Clicar em "Ok" no pop-up da criação de atividade ao ar livre
    Sleep                       2s
	Handle Alert                Accept	

#INSCRIÇÃO EM UMA ATIVIDADE AO AR LIVRE
Realizar login no sistema com uma conta de usuário praticante (CA)
	Input Text	                css:input[name=txtEmail]                    ${EMAIL_INSCRITO}
	Input Text	                css:input[name=txtSenha]                    ${SENHA_INSCRITO}
    Sleep                       2s
    Capture Page Screenshot
	Click Element	            css:button[id=btnEntrar]

Na tela de inicial, Selecione uma atividade ao ar livre criada por outro usuário e clique em "Inscrever-se"
    Sleep                       2s
	Capture Page Screenshot
	${CONTADOR}                 Set Variable                                1
	${CONTROLE}		            Set Variable	                            0
	${ITERACAO}		            Set Variable	                            1
	WHILE	                    ${CONTADOR} < 99999
		${ID}                   Set Variable                                linkInscricaoAtv${CONTADOR}
		${ELEMENTO}	            Get webElement	                            ${ID}
		IF	$ELEMENTO.text == "Inscrever-Se"
			Click Element	    css:a[id=${ID}]												
			${CONTROLE}		    Evaluate	                                ${CONTROLE} + ${ITERACAO}
			Exit For Loop If	${CONTROLE} != 0
		END		
		${CONTADOR}		        Evaluate                                    ${CONTADOR} + ${ITERACAO}		
	END	

Clicar em "Ok" no pop-up da inscrição da atividade ao ar livre
    Sleep                       2s
	Handle Alert                Accept
	
#NÍVEIS DE ACESSO
Acessar: localhost/goit/PAGES/home/home.php
    Go To                       url=http://localhost/goit/PAGES/home/home.php    
    Sleep                       2s    

Clicar em "Ok" no pop-up de aviso que informa que é necessário realizar o login para acessar o sistema
    Sleep                       2s
    Handle Alert                Accept
    Capture Page Screenshot

Realizar login no sistema com uma conta de usuário praticante (Nível de Acesso)
    Input Text                  locator=txtEmail                            text=${EMAIL_NIVEL_ACESSO}
    Input Text                  locator=txtSenha                            text=${SENHA_NIVEL_ACESSO}
    Sleep                       2s
    Capture Page Screenshot
    Click Element               locator=btnEntrar
    Capture Page Screenshot
    
Acessar: localhost/goit/PAGES/anuncios/anuncio.php
    Go to                       url=http://localhost/goit/PAGES/anuncios/anuncio.php
    Sleep                       2s
    Capture Page Screenshot

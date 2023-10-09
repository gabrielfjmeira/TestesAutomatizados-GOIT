*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${BROWSER}		        chrome
${URL}		                http://localhost/GOIT/index.php
${LOCATOR_CADASTRO}	        css:a[id=linkCadastro]
${LOCATOR_SELECT}	        name:tipoUsuario
${LOCATOR_PROXIMO}	        css:button[id=btnProximo]
${LOCATOR_RAZAO}	        id:txtRazaoSocial
${RAZAO_SOCIAL}		        Empresa Bacana Ltda
${RAZAO_SOCIAL2}                Empresa Legal Ltda
${LOCATOR_FANTASIA}	        id:txtFantasia
${FANTASIA}		        EmpresaBacana
${FANTASIA2}                    EmpresaLegal
${LOCATOR_CNPJ}		        id:txtCNPJ
${CNPJ_VALIDO}		        12345678901234
${LOCATOR_EMAIL}	        id:txtEmail
${EMAIL}                	empresabacana@gmail.com
${EMAIL2}                       empresalegal@gmail.com
${LOCATOR_SENHA}	        id:txtSenha
${LOCATOR_CONFIRM_SENHA}	id:txtSenhaConfirmada
${SENHA}	                Senha@123
${LOCATOR_CADASTRAR}	        css:button[id=btnCadastrar]

*** Keywords ***
Abrir o navegador
        Open Browser            browser=${BROWSER}
        Maximize Browser Window

Fechar o navegador
        Close Browser

Acessar: localhost/goit
        Go To                           ${URL}        
        Capture Page Screenshot

Na home do sistema, clicar no link "Cadastre-se aqui"
        Click Element                   ${LOCATOR_CADASTRO}

Na tela de Cadastro-> Seleção de usuário, selecione a opção "Lojista", em seguida clique no botão próximo 
        Select From List By Value       ${LOCATOR_SELECT}        4
        Sleep       1s    
        Capture Page Screenshot
        Click Element                   ${LOCATOR_PROXIMO}

Preencher todos os campos do formulário de cadastro com dados válidos, em seguida clique no botão "Cadastrar"
        Input Text                      ${LOCATOR_RAZAO}                ${RAZAO_SOCIAL}
        Input Text                      ${LOCATOR_FANTASIA}             ${FANTASIA}
        Input Text                      ${LOCATOR_CNPJ}                 ${CNPJ_VALIDO}
        Input Text                      ${LOCATOR_EMAIL}                ${EMAIL}
        Input Password                  ${LOCATOR_SENHA}                ${SENHA}
        Input Password                  ${LOCATOR_CONFIRM_SENHA}        ${SENHA}
        Capture Page Screenshot
        Click Element                   ${LOCATOR_CADASTRAR}        

Clicar em "Ok" no pop-up do cadastro
        Handle Alert    Accept
        Wait Until Element Is Visible    ${LOCATOR_CADASTRO}
        Sleep       2s

Preencher todos os campos do formulário de cadastro com dados válidos exceto o de "CNPJ", neste campo insira um CNPJ indisponível (que já está cadastrado no sistema), em seguida clique no botão "Cadastrar"
        Input Text                      ${LOCATOR_RAZAO}               ${RAZAO_SOCIAL2}
        Input Text                      ${LOCATOR_FANTASIA}            ${FANTASIA2}
        Input Text                      ${LOCATOR_CNPJ}                ${CNPJ_VALIDO}
        Input Text                      ${LOCATOR_EMAIL}               ${EMAIL2}
        Input Password                  ${LOCATOR_SENHA}               ${SENHA}
        Input Password                  ${LOCATOR_CONFIRM_SENHA}       ${SENHA}
        Click Element                   ${LOCATOR_CADASTRAR}
        Sleep       2s
        Capture Page Screenshot
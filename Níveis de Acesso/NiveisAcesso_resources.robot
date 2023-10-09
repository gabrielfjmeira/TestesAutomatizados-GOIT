*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}  http://localhost/Goit/index.php
${EMAIL}    xulio@gmail.com
${SENHA}    Xulio@1234

*** Keywords ***
Abrir o navegador
    Open Browser	browser=${BROWSER}
    Maximize Browser Window
Fechar o navegador
    Close Browser

Acessar: localhost/goit
    Go To   url=${URL}
    Capture Page Screenshot

Acessar: localhost/goit/PAGES/home/home.php
    Go To   url=http://localhost/goit/PAGES/home/home.php    
    Sleep   1s    

Clicar em "Ok" no pop-up de aviso que informa que é necessário realizar o login para acessar o sistema
    Handle Alert    Accept
    Capture Page Screenshot

Realizar login no sistema com uma conta de usuário praticante   
    Input Text    locator=txtEmail    text=${EMAIL}
    Input Text    locator=txtSenha    text=${SENHA}
    Capture Page Screenshot
    Click Element   locator=btnEntrar
    Capture Page Screenshot
    
Acessar: localhost/goit/PAGES/anuncios/anuncio.php
    Go to   url=http://localhost/goit/PAGES/anuncios/anuncio.php 
    Capture Page Screenshot
*** Settings ***
Documentation   Essa suíte testa o app de lista de tarefas
Resource        login_resources.robot



*** Test Cases ***
Start the session - Abrir aplicativo
    [Tags]  Start_app
    iniciar o app

Close update
   [Tags]  close_update
    Sleep    60s
    Fechar atualização

Cenário 1: Concedendo as permissões e acessando a tela de login
    [tags]   acesso_login
    Sleep    10s
    Dado que estou na tela home do app
    Quando clico nas permissões
    Então Visualizo a tela de login

Cenário 2: Acessando a conta
    [Tags]  acesso_conta
    Dado que estou na tela de Login
    Quando clico no botao de JÁ SOU CLIENTE
    E Visualizo os campos de SHORTNAME e USUÁRIO
    E digito o SHORTNAME e USUÁRIO
    E clico no ENTRAR
    E visualizo a tela com o campo SENHA
    Então Digito a senha e confirmo o acesso

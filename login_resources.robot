*** Settings ***

Library        AppiumLibrary

*** Variables ***
&{home_permissions}
...  btn_notupdate=//android.widget.Button[@text="Lembrar Depois"]
...  btn_permitir=//android.widget.Button[@text="Permitir"]
...  btn_npermitir=//android.widget.Button[@text="Não permitir"]
...  btn_permissionsPermitir=com.android.permissioncontroller:id/permission_allow_button

&{page_login}
...  btn_jaSouCliente=//android.widget.Button[@text="Já sou cliente"]
...  aba_shortname=//android.widget.Button[@text="Entrar com Shortname"]
...  campo_textShortname=//android.widget.EditText[@resource-id="inpShortname"]
...  campo_textUsuario=//android.widget.EditText[@resource-id="inpUser"]
...  btn_entrar=//android.widget.Button[@text="Entrar"]

&{page_password}
...  campo_senha=//android.widget.EditText[@resource-id="senhaEletronica"]
...  btn_confirmar=//android.widget.Button[@resource-id="botaoConfirmarSenhaEletronica"]
...  bnt_itokenDeixarParaDps=//android.widget.Button[@text="Fazer depois"]

*** Keywords ***
iniciar o app
  Open Application  http://localhost:4723/wd/hub
...  platformName=Android
...  deviceName=R9XN805SNEF
...  appPackage=br.livetouch.safra.empresas.hml
...  appActivity=com.accenture.safra.mobilepf.principal.PrincipalActivity
...  automationName=Uiautomator2

Fechar atualização
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${home_permissions.btn_notupdate}
    Run Keyword And Ignore Error  Click Element                  ${home_permissions.btn_notupdate}

 Dado que estou na tela home do app
    Wait Until Element Is Visible           ${home_permissions.btn_npermitir}

 Quando clico nas permissões
    FOR    ${counter}    IN RANGE    0    4
         Swipe    0    600    0    100   #Deslizamento até o botão permitir
         Sleep    3s
         Wait Until Element Is Visible      ${home_permissions.btn_permitir}
         Click Element                      ${home_permissions.btn_permitir}
         Wait Until Element Is Visible      ${home_permissions.btn_permissionsPermitir}
         Click Element                      ${home_permissions.btn_permissionsPermitir}
         Sleep    3s
    END

Então Visualizo a tela de login
    Wait Until Element Is Visible    ${page_login.btn_jaSouCliente}

#---------------------------------------------------------------------------------------
#implementações Cenário do cenário 2

Dado que estou na tela de Login
    Wait Until Element Is Visible    ${page_login.btn_jaSouCliente}

Quando clico no botao de JÁ SOU CLIENTE
    Click Element                    ${page_login.btn_jaSouCliente}

E Visualizo os campos de SHORTNAME e USUÁRIO
    Wait Until Element Is Visible    ${page_login.aba_shortname}
    Click Element                    ${page_login.aba_shortname}
    Wait Until Element Is Visible    ${page_login.campo_textShortname}
    Wait Until Element Is Visible    ${page_login.campo_textUsuario}
E digito o SHORTNAME e USUÁRIO
    Input Text    ${page_login.campo_textShortname}  text=drogaria spaulo
    Input Text    ${page_login.campo_textUsuario}    text=drogaria
E clico no ENTRAR
    Wait Until Element Is Visible    ${page_login.btn_entrar}
    Click Element                    ${page_login.btn_entrar}
E visualizo a tela com o campo SENHA
    Wait Until Element Is Visible    ${page_password.campo_senha}
Então Digito a senha e confirmo o acesso
    Input Text        ${page_password.campo_senha}    text=paulist1
    Wait Until Element Is Visible    ${page_password.btn_confirmar}
    Click Element     ${page_password.btn_confirmar}
    Sleep    15s
    Swipe    0    600    0    100   #Deslizamento
    Sleep    3s
    Wait Until Element Is Visible   ${page_password.bnt_itokenDeixarParaDps}
    Click Element    ${page_password.bnt_itokenDeixarParaDps}

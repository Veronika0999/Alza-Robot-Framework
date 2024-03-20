*** Settings ***
Library     Browser

*** Variables ***
${URL}  https://www.alza.cz/

*** Test Cases ***
Successful login
    Login    emailktestu@gmail.com    zadejheslo    yes

Unuccessful login
    Login    emailktestu@gmail.com    zadejheslo5    no


*** Keywords ***
Login
    [Arguments]     ${email}    ${pass}     ${shouldBeLogin}
    New Browser     chromium        headless=false
    New Page        ${URL}
    Set Strict Mode     off
    Click           css=.btnx.cookies-info__button
    Click           data-testid=headerContextMenuToggleLogin
    Type Text       id=userName     ${email}
    Type Text       id=password     ${pass}
    Click           id=btnLogin

    IF    "${shouldBeLogin}" == "yes"
        Log To Console    User is log in
        Get Text          data-testid=headerContextMenuToggle       ==      Moje Alza
    ELSE
        Log To Console    User is not log in
        Get Text          id=loginButtonText       *=      Neplatné uživatelské
    END

*** Settings ***
Library     Browser

*** Variables ***
${URL}      https://www.alza.cz/
${email}    emailktestu@gmail.com
${pass}     zadejheslo

*** Test Cases ***
Successful login
    Login               ${email}    ${pass}

*** Keywords ***
Login
    [Arguments]         ${email}     ${pass}
    New Browser         chromium     headless=false
    New Page            ${URL}
    Get Title           ==   Alza.cz – rychlý a pohodlný nákup odkudkoliv | Alza.cz
    Set Strict Mode     off
    Click               css=.btnx.cookies-info__button
    Click               text=Přihlásit se
    Type Text           id=userName         ${email}
    Type Text           id=password         ${pass}
    Click               id=btnLogin

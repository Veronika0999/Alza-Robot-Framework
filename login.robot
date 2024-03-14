*** Settings ***
Library     Browser

*** Test Cases ***
Login
    New Browser         chromium     headless=false
    New Page            https://www.alza.cz/
    Get Title           ==   Alza.cz – rychlý a pohodlný nákup odkudkoliv | Alza.cz
    Set Strict Mode     off
    Click               css=.btnx.cookies-info__button
    Click               text=Přihlásit se
    Type Text           id=userName         emailktestu@gmail.com
    Type Text           id=password         zadejheslo
    Click               id=btnLogin

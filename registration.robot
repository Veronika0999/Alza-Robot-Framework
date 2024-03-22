*** Settings ***
Library     Browser

*** Variables ***
${URL}          https://www.alza.cz/
${email}        krataw66388@glaslack.com
${password}     Wtest123Testq?

*** Test Cases ***
Registration a new user
    Registration    ${email}    ${password}

Login and logout a user
    Login and logout           ${email}    ${password}

*** Keywords ***
Registration
    [Arguments]     ${email}    ${password}
    New Browser     chromium    headless=false
    New Page        ${URL}
    Set Strict Mode     off
    Click           css=.btnx.cookies-info__button
    Click           data-testid=headerContextMenuToggleLogin
    Click           id=registerLink
    Type Text       id=edth1EmailLogin          ${email}
    Type Text       id=edth1Password            ${password}
    Type Text       id=edth1PasswordConfirm     ${password}
    Type Text       id=ctl00_ctl00_cpcm_cpc_ud2_phoneCountryBasicPhoneValidator_inpTelNumber    777666111
    Type Text       id=edth2Name        John Doe
    Type Text       id=edth2Street      Sluneční 1453
    Type Text       id=edth2City        Příbram
    Type Text       id=edth2Zip         747 61
    Click           xpath=//*[@id="orderpage"]/div/div[2]/a

Login and logout
    [Arguments]     ${email}    ${password}
    New Browser     chromium    headless=false
    New Page        ${URL}
    Set Strict Mode     off
    Click           css=.btnx.cookies-info__button
    Click           data-testid=headerContextMenuToggleLogin
    Type Text       id=userName     ${email}
    Type Text       id=password     ${password}
    Click           id=btnLogin
    Click           data-testid=headerContextMenuToggle
    Click           data-testid=headerNavigationLogout

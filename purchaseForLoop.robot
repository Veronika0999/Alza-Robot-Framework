*** Settings ***
Library     Browser

*** Variables ***
${URL}  https://www.alza.cz/
@{products}     notebook    mobil   tablet

*** Test Cases ***
Login
    New Browser     chromium        headless=false
    New Page        ${URL}
    Set Strict Mode     off
    Click           css=.btnx.cookies-info__button

    FOR    ${product}    IN    @{products}
        Search for product      ${product}
        Log    ${product}
    END

*** Keywords ***
Search for product
    [Arguments]     ${product}
    Click           data-testid=searchInput
    Type Text       xpath=//*[@id="page"]/div[1]/div/div/div[1]/div/header/div[5]/div/div[1]/div/input     ${product}
    Sleep           3s
    Click           data-testid=button-search
    Click           xpath=//*[@id="content0"]/div[1]/div[2]/div[7]/div/div[1]/a[3]
    Click           css=.btnk1
    









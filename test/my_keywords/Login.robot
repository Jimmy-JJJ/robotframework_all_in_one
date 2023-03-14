*** Settings ***
Library    SeleniumLibrary
Library    ExtendedSelenium2Library

*** Keywords ***
Login
    [Arguments]    @{NAMES} @{PASSWORDS}
    FOR    ${NAME}  IN   @{NAMES}
        Input Text   name:email ${NAME}
        ${count}=    Get Index   @{NAMES}
        Input Text    name:password @{PASSWORDS}[${count}]
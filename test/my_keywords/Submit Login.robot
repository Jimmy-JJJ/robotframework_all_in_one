*** Settings ***
Library    SeleniumLibrary
Library    ExtendedSelenium2Library

*** Keywords ***
Submit Login
    ${BUTTONS}  Get Webelements    class:sc-ca90c2ac-0
    Click Element    ${BUTTONS}[1]
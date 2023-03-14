*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait And Clear Password And Username
    Sleep   1
    Click Element    name:email
    Clear Element Text    name:email
    Click Element    name:password
    Clear Element Text    name:password
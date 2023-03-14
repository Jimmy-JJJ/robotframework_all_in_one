*** Settings ***
Library    SeleniumLibrary
Library    ExtendedSelenium2Library
Resource    ../my_keywords/Wait And Clear Password And Username.robot
Test Setup    Open Browser    ${URL}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${BROWSER}  chrome
${URL}  https://www.onet.pl


*** Test Cases ***
Open Mailbox Panel - xFail Case - Unsuccessful Login
    Set Browser Implicit Wait    10
    Click Element    class:cmp-intro_rejectAll
    Click Element    class:cmp-details_save
    @{ICONS}    Get Webelements    class:MenuIcon_icon__ac4PH
    Click Element    ${ICONS}[5]
    Input Credentials    marian_kowalski123@gmail.com       zosia123
    Submit Form
    Wait And Clear Password And Username
    Input Credentials   staś_kowalski123@gmail.com   BarcaRządzi
    Submit Form
    Wait And Clear Password And Username
    Input Credentials   robakowski123@gmail.com   jpbpnp
    Submit Form
    Wait And Clear Password And Username

*** Keywords ***
Input Credentials
    [Arguments]    ${email}     ${password}
    Input Text   name:email  ${email}
    Input Text   name:password   ${password}

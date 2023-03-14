*** Settings ***
Library    SeleniumLibrary
Library    ExtendedSelenium2Library
Resource    ../my_keywords/Wait And Clear Password And Username.robot

*** Variables ***
${BROWSER}  chrome
${URL}  https://www.onet.pl


*** Test Cases ***
Open Mailbox Panel - xFail Case - Unsuccessful Login
    Open Browser    ${URL}  ${BROWSER}
    Set Browser Implicit Wait    10
    Click Element    class:cmp-intro_rejectAll
    Click Element    class:cmp-details_save
    @{ICONS}    Get Webelements    class:MenuIcon_icon__ac4PH
    Click Element    ${ICONS}[5]
    Input Text   name:email  marian_kowalski123@gmail.com
    Input Text   name:password   zosia123
    Submit Form
    Wait And Clear Password And Username
    Input Text   name:email  staś_kowalski123@gmail.com
    Input Text   name:password   BarcaRządzi
    Submit Form
    Wait And Clear Password And Username
    Input Text   name:email  robakowski123@gmail.com
    Input Text   name:password   jpna100%
    Submit Form
    Wait And Clear Password And Username

    Sleep    30
*** Settings ***
Documentation    Google searchbar Smoke test
Library    SeleniumLibrary
Test Setup    Open Browser    ${URL}   ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${BROWSER}      chrome
${URL}      https://www.google.com/
${SEARCH_PHRASE1}      Freddie Mercury Wikipedia
${SEARCH_PHRASE2}      Free books net
${EXPECTED_TITLE1}     Freddie Mercury – Wikipedia, wolna encyklopedia
${EXPECTED_TITLE2}     Free-eBooks.net | Download free Fiction, Health, Romance and many more books
${TEXT_ELEM1}      brytyjski muzyk, piosenkarz rockowy i autor tekstów
${TEXT_ELEM2}      Discover 1000's of New Authors in Hundreds of Categories

*** Test Cases ***
Google Search Smoke #1
    Scroll Element Into View    class:QS5gu
    Reject Cookies
    Search For Phrase    ${SEARCH_PHRASE1}
    Click Link      partial link:Wikipedia
    Verify Results      ${TEXT_ELEM1}   ${EXPECTED_TITLE1}

Google Search Smoke #2
    Scroll Element Into View    class:QS5gu
    Reject Cookies
    Search For Phrase    ${SEARCH_PHRASE2}
    Click Link      partial link:Free-eBooks.net
    Verify Results      ${TEXT_ELEM2}   ${EXPECTED_TITLE2}

*** Keywords ***

Verify Results
    [Arguments]    ${TEXT_ELEM}     ${TITLE}
    Wait Until Page Contains    ${TEXT_ELEM}
    Title Should Be    ${TITLE}

Scroll to Cookies Button
    @{BUTTONS}     Get Webelements    class:QS5gu
    Scroll Element Into View    ${BUTTONS}[2]

Reject Cookies
    @{BUTTONS}     Get Webelements    class:QS5gu
    Click Element    ${BUTTONS}[2]

Search For Phrase
    [Arguments]    ${phrase}
    Input Text      css=input.gLFyf    ${phrase}
    Submit Form

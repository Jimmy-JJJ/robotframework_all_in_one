*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${PORTAL_URL}     ${BROWSER}
Test Teardown    Close Browser


*** Variables ***
${BROWSER}  chrome
${PORTAL_URL}   https://www.youtube.com/
${SEARCH_PHRASE1}    Pete Doherty at Royal Albert Hall playlist
${SEARCH_PHRASE2}   Eno spirits drifting 2004
${EXPECTED_TITLE1}     Pete Doherty at Royal Albert Hall playlist - YouTube
${EXPECTED_TITLE2}     Eno spirits drifting 2004 - YouTube

*** Test Cases ***
Search & Play 1 - Pete Doherty Royal Albert Hall
    Set Browser Implicit Wait    10
    Scroll Element Into View    css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Click Element    css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Wait Until Element Is Not Visible     css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Wait For Element To Be Interactable    tag:input
    Input Text    tag:input     ${SEARCH_PHRASE1}
    Submit Form
    Click Element    partial link: Pete Doherty
    Title Should Be    ${EXPECTED_TITLE1}

Search & Play 2 - Brian Eno Spirits Drifting
    Set Browser Implicit Wait    10
    Scroll Element Into View    css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Click Element    css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Wait Until Element Is Not Visible     css:#content > div.body.style-scope.ytd-consent-bump-v2-lightbox > div.eom-buttons.style-scope.ytd-consent-bump-v2-lightbox > div:nth-child(1) > ytd-button-renderer:nth-child(1) > yt-button-shape > button
    Wait For Element To Be Interactable    tag:input
    Input Text    tag:input     ${SEARCH_PHRASE2}
    Submit Form
    Click Element    partial link: Spirits Drifting
    Title Should Be    ${EXPECTED_TITLE2}

*** Keywords ***
Wait For Element To Be Interactable
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}


*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${PHRASE}   S&P Global
${PHRASE2}  Wikipedia
${PHRASE3}  American Dollar
${URL}  https://search.yahoo.com/

*** Test Cases ***
Search1 Test Case - S&P Website Crawler
    Open Browser   ${URL}   ${BROWSER}
    Input Text  p   ${PHRASE}
    Submit Form
    Wait Until Page Contains    Global Homepage | S&P Global
    Click Element    partial link: Global Homepage | S&P Global

    @{handles}  Get Window Handles
    ${current_handle}   Set Variable    ${handles[0]}

    FOR     ${handle}   IN      @{handles}
        Run Keyword If    "${handle}" != "${current_handle}"  Set Global Variable    ${new_handle}    ${handle}
    END

    Switch Window   ${new_handle}
    Click Element    id:onetrust-pc-btn-handler
    Wait Until Page Contains Element    xpath: //*[@id="onetrust-pc-sdk"]/div[3]/div[1]/button
    Click Element    xpath: //*[@id="onetrust-pc-sdk"]/div[3]/div[1]/button
    Click Element    partial link:Events
    Click Element    partial link:S&P Dow Jones Indices Events
    Scroll Element Into View    partial link:Mid-Year Review and Outlook for U.S. Insurers 2022
    Click Element    partial link:Mid-Year Review and Outlook for U.S. Insurers 2022

    ${DOCUMENT_TITLE}   Execute Javascript    return document.title
    Should Be Equal    ${DOCUMENT_TITLE}    Mid-Year Review and Outlook for U.S. Insurers 2022 - Events | S&P Dow Jones Indices
#    Sleep   500

Search2 Test Case - Wikipedia Article Title
    Open Browser    ${URL}  ${BROWSER}
    Input Text  p   ${PHRASE2}
    Submit Form
    Click Element    xpath://*[@id="web"]/ol/li[1]/div/div[1]/h3/a

    @{handles}  Get Window Handles
    ${current_handle}   Set Variable    ${handles[0]}

    FOR    ${handle}   IN  @{handles}
        Run Keyword If    "${handle}" != "${current_handle}"    Set Global Variable    ${new_handle}   ${handle}
    END

    Switch Window    ${new_handle}

    Wait Until Page Contains Element    name=search
    Input Text  name=search  ${PHRASE3}
    Submit Form
    Wait Until Page Contains Element    class=mw-page-title-main
    ${Article Title}    Get Text    class:mw-page-title-main
#    ${Article Title}    Execute Javascript    return document.getElementsByClassName('mw-page-title-main')[0].getText();
    Should Be Equal     ${Article Title}    United States dollar
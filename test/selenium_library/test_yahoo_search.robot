*** Settings ***
Library     SeleniumLibrary
Test Setup    Open Browser    ${URL}  ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${BROWSER}  chrome
${PHRASE}   S&P Global
${PHRASE2}  Wikipedia
${PHRASE3}  American Dollar
${PHRASE4}  Fred Perry
${URL}  https://search.yahoo.com/

*** Test Cases ***
Search1 Test Case - S&P Website Crawler
    Reject Cookies
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
    Reject Cookies
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

Search3 Fred Perry - Male Clothes Shopping
    Reject Cookies
    Input Text    p     ${PHRASE4}
    Submit Form
    Click Element    partial link: Fred Perry | Original Since 1952 | Fred Perry US

    @{handles}  Get Window Handles
    ${current_handle}   Set Variable    ${handles[0]}

    FOR    ${handle}    IN  @{handles}
        Run Keyword If    "${handle}" != "${current_handle}"    Set Global Variable    ${new_handle}    ${handle}
    END

    Switch Window    ${new_handle}
    Wait Until Page Contains Element    id:site_switcher_popup_country

    Click Element    id:site_switcher_popup_country
    Select From List By Value    id=site_switcher_popup_country     GB
    Click Element    id:shop-now-popup
    Mouse Over  css:body > div.page-wrapper > header > div > div.header__links--left.skip-links > nav > ul > li:nth-child(2) > a
    Click Element    css:body > div.page-wrapper > header > div > div.header__links--left.skip-links > nav > ul > li:nth-child(2) > ul > li:nth-child(1) > ul > li:nth-child(4) > a
    @{polo_products}    Get Webelements     class:product
    Scroll Element Into View    ${polo_products}[0]
    Wait Until Element Is Visible    ${polo_products}[0]
    Click Element    ${polo_products}[0]
    Page Should Contain    Fred Perry Shirt


*** Keywords ***
Reject Cookies
    Click Button    css=button#scroll-down-btn
    Click Button    css=button.reject-all
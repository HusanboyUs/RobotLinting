*** Settings ***
Library     SeleniumLibrary

Suite Setup    Start Testing    ${URL}   ${BROWSER}
Suite Teardown    Finish Testing
*** Variables ***
${NAME}    admin
${PASSWORD}    admin
${BROWSER}    Firefox
${URL}        https://demo.playground-crm.com/


*** Test Cases ***
Test Adding New Order
    [Documentation]    testes if new order can be created
    User Should Login    ${NAME}    ${PASSWORD}
    Navigate To    New order
    Create New Order    1555    5    ${NAME}    0    1

*** Keywords ***
Start Testing
    [Documentation]    Starts test session
    [Arguments]     ${url}    ${browser}
    Open Browser    about:blank  ${browser}
    Go To    ${url}
Finish Testing
    [Documentation]    Finishes testing and closes all browsers
    Close All Browsers
User Should Login
    [Documentation]    user should login with  correct credentials
    [Arguments]    ${name}    ${password}
    Input Text    //input[@id='user']    admin
    Input Text    //input[@id='password']    admin
    Click Button    //button[contains(text(),'Login!')]
    Wait Until Element Is Enabled    //a[contains(text(),'Playground CRM')]//ancestor::h1
Navigate To
    [Documentation]    navigates through tabs
    [Arguments]      ${page}
    Click Element    //a[contains(text(),'${page}')]
Create New Order
    [Documentation]    creates new order
    [Arguments]    ${card_number}    ${number_of_people}    ${full_name}    ${time}    ${tarrif}
    Wait Until Element Is Enabled    //div[@id='horizontal']


    ${result}    Convert To Integer    ${card_number}
    Input Text    //input[@id='productID']    ${result}
    Input Text    //input[@id='inputPassword1']    ${number_of_people}
    Select From List By Value    //select[@name='time_count']    ${time}
    Select From List By Value    //select[@name='time_tarif']    ${tarrif}
    Input Text    //input[@id='card_id_filed']    ${full_name}
    Click Button    //button[@id='neworderbtn']
    Wait Until Element Is Enabled    //td[text()='${card_number}']    timeout=60



    

    

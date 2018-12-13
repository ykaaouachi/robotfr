*** Settings ***
Documentation                                     A basic test to check google page with chrome 
Library                                           Selenium2Library

*** Variables ***
${url}                                             https://www.google.com
${BROWSER}                                         chrome
${text}                                            xpath=//*[@name="q"]

*** Test Cases ***
User can open page
    [Documentation]                                As a user I can open the google page
    open browser                                   ${URL}    ${BROWSER}
    wait until page contains                       ${url}
    close browser

User fill in the Search text box
    [Documentation]                                The user search 'Test with robot'
    open browser                                   ${URL}    ${BROWSER}
    wait until page contains                       ${URL}
    Title Should Be                                Google
    input text                                     ${text}  Test with robot 
    Press Key                                      ${text}  \\13
    wait until page contains                       Test
    sleep                                          5s
    Close Browser

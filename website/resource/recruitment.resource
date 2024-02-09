*** Settings ***
Documentation     This is a resource file, that can contains variables and keywords.
...               Keywords defined here can be used where this resource file is imported.
Library          SeleniumLibrary
Library        ../../src/RecruitmentController.py

*** Variables ***
${EVIDENCE_IMG} =    ../../evidence/website/

*** Keywords ***

Webapp URL and Browser
    [Arguments]    ${webapp_url}    ${browser}
    Log Variables


Open URL on Browser
    [Arguments]    ${webapp_url}    ${browser}
    Open Browser    ${webapp_url}    ${browser}
    Maximize Browser Window
    #Capture Page Screenshot    selenium-screenshot-{index}.png
    Wait Until Page Contains Element    xpath=//input[@name='name']

Set Name Using Random Value
    ${name}=      Get Random Name
    Input Text    xpath=//input[@name='name']   ${name}
    #Capture Page Screenshot    selenium-screenshot-{index}.png

Set Email Using Random Value
    ${email}=      Get Random Email
    Input Text    xpath=//input[@name='email']   ${email}
    #Capture Page Screenshot    selenium-screenshot-{index}.png

Set Description Using Random Value
    ${description}=      Get Random Description
    Input Text    xpath=//textarea[@name='more']   ${description}
    #Capture Page Screenshot    selenium-screenshot-{index}.png

Click Submit Button
    Click Button    xpath=//button[@type='submit']
    Capture Page Screenshot    ${EVIDENCE_IMG}selenium-screenshot-{index}.png

Get Response Message
    Wait Until Page Contains Element    xpath=//div[@class='animate-appear mt-2 text-red-400 text-sm']
    ${message_resp}=       Get Text    xpath=//div[@class='animate-appear mt-2 text-red-400 text-sm']
    Set Global Variable    ${RESP_MESSAGE}      ${message_resp}
    Capture Page Screenshot    ${EVIDENCE_IMG}selenium-screenshot-{index}.png
    Close Browser


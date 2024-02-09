*** Settings ***
Documentation    Test suite for recruiting component from nozzmo-website.
Default Tags     positive
Resource         resource/recruitment.resource

*** Variables ***
${HOST} =  https://nozzmo.com/recruiting
${BROWSER} =       Chrome
${RESP_MESSAGE}


*** Test Cases ***

[TST01] - Positive Test Validate Contact Us Form - Happy Path
    [Documentation]    Validation of Contact Us Form sending all valid values
    [Tags]      Positive    Regression
    Given Webapp URL and Browser  ${HOST}     ${BROWSER}
    When Open URL on Browser    ${HOST}     ${BROWSER}
    And Set Name Using Random Value
    And Set Email Using Random Value
    And Set Description Using Random Value
    And Click Submit Button
    Then Close Browser


[TST02] - Negative Test Validate Contact Us Form - Send Just Name
    [Documentation]    Validation of Contact Us Form sending just name value and leave other fields empty
    [Tags]      Negative    Regression
    ${email_error_message}    Set Variable    Email is required
    Given Webapp URL and Browser  ${HOST}     ${BROWSER}
    When Open URL on Browser    ${HOST}     ${BROWSER}
    And Set Name Using Random Value
    And Click Submit Button
    Then Get Response Message
    And Should Be Equal As Strings    ${RESP_MESSAGE}     ${email_error_message}

[TST03] - Negative Test Validate Contact Us Form - Send Just Email
    [Documentation]    Validation of Contact Us Form sending just email value and leave other fields empty
    [Tags]      Negative    Regression
    ${name_error_message}    Set Variable    Name is required
    Given Webapp URL and Browser  ${HOST}     ${BROWSER}
    When Open URL on Browser    ${HOST}     ${BROWSER}
    And Set Email Using Random Value
    And Click Submit Button
    Then Get Response Message
    And Should Be Equal As Strings    ${RESP_MESSAGE}     ${name_error_message}



[TST04] - Negative Test Validate Contact Us Form - Send Just Description
    [Documentation]    Validation of Contact Us Form sending just description value and leave other fields empty
    [Tags]      Negative    Regression
    ${name_error_message}    Set Variable    Name is required
    Given Webapp URL and Browser  ${HOST}     ${BROWSER}
    When Open URL on Browser    ${HOST}     ${BROWSER}
    And Set Description Using Random Value
    And Click Submit Button
    Then Get Response Message
    And Should Be Equal As Strings    ${RESP_MESSAGE}     ${name_error_message}



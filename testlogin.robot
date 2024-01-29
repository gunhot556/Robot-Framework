*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
Suite Setup       Open Browser    https://automationexercise.com/   chrome

*** Variables ***
${email}         gunhot556@gmail.com
${password}      70231168919

*** Keywords ***
Click Login Element
    Click Element       //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Click Login Button
    Click Button        //*[@id="form"]/div/div/div[1]/div/form/button

Click Delete Account Element
    Click Element       //*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a

Click Delete account Continue button
    Click Element        //*[@id="form"]/div/div/div/div
Input Email
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@name="password"]    ${password}

*** Test Cases ***
Login with valid info
   [Documentation]    Test the login functionality with valid credentials
   Click Login Element
   
   Input Email                  ${email}
   Input Password            ${password}
          
   Click Login Button
   Page Should Contain Element          //*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a

Delete Account and Verify Message
    [Documentation]    Test deleting the account and verify the "ACCOUNT DELETED!" message
    Click Delete Account Element
    Click Delete account Continue button

    Click Login Element

    Input Email                  ${email}
    Input Password               ${password}

    Click Login Button
    Page Should Contain Element          //*[@id="form"]/div/div/div[1]/div/form/p`

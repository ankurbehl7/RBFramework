
*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://qa.applivetest.com/Login/

*** Test Cases ***
This is a demo test
    [Documentation]  Ebay test for search element
    [Tags]  Functional

    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Login to application without username

*** Test Cases ***
This is Login test

    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Login to application successfully


*** Keywords ***
Login to application without username
    ${"username"}   set variable    //input[@id="UserName"]

    Input Text  ${"username"}   testdemo2

    element should be visible   ${"username"}

    Input Text  //input[@id="Password"]     123456789

    clear element text  ${"username"}

    click element   //button[@id="cmdLogin"]
    sleep   3
    element should be visible   //div[text()="Please Enter User ID"]

    Close Browser

Login to application successfully
    ${"username"}   set variable    //input[@id="UserName"]

    Input Text  ${"username"}   testdemo2

    element should be visible   ${"username"}

    Input Text  //input[@id="Password"]     123456789

    click element   //button[@id="cmdLogin"]
    sleep   3
    element should be visible   //a[text()=" Screen-shot Tool "]
    Close Browser
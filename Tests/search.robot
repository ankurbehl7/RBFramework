
*** Settings ***
Library  SeleniumLibrary
Library  driversync.py

*** Variables ***
${url}  https://qa.applivetest.com/Login/


*** Test Cases ***
This is a demo test
    ${chromedriver_path}=   driversync.Get Driver Path With Browser        Chrome

    Create Webdriver    Chrome   executable_path=${chromedriver_path}

    Go To  ${url}
    Maximize Browser Window
    Login to application without username

*** Test Cases ***
This is Login test
    ${chromedriver_path}=   driversync.Get Driver Path With Browser        Chrome

    Create Webdriver    Chrome   executable_path=${chromedriver_path}

    Go To  ${url}
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
    ${"homepage_title"}     Set Variable    //a[text()=" Screen-shot Tool "]
    Input Text  ${"username"}   testdemo2

    element should be visible   ${"username"}

    Input Text  //input[@id="Password"]     123456789

    click element   //button[@id="cmdLogin"]
    sleep   3
    Element Should Not Be Visible    ${"homepage_title"}

    Close Browser
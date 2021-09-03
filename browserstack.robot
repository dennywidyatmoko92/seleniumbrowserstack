*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${baseUrl}                     https://opensource-demo.orangehrmlive.com/
${os}                          windows
${osVersion}                   10
${browser}                     chrome
${browserVersion}              92.0
${browserstack_userName}       yourUserName
${browserstack_accessKey}      yourUserAccessKey

*** Test Cases ***
testSetupBrowserstack
    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
    &{desiredCapabilities}      Create Dictionary   os=${os}     os_version=${osVersion}     browser=${browser}   browser_version=${browserVersion}
    Open Browser      ${baseUrl}    remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}
    Input Text    xpath=//input[@id='txtUsername']    Admin
    Input Text    xpath=//input[@id='txtPassword']    admin123
    Click Button    xpath=//input[@id='btnLogin']     
    Element Should Be Visible    xpath=//input[@id='MP_link']                
    
